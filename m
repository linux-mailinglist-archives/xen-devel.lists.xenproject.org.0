Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC34A59A3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 11:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263472.456168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEq72-0001e3-DT; Tue, 01 Feb 2022 10:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263472.456168; Tue, 01 Feb 2022 10:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEq72-0001bG-AI; Tue, 01 Feb 2022 10:10:12 +0000
Received: by outflank-mailman (input) for mailman id 263472;
 Tue, 01 Feb 2022 10:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEq70-0001bA-1H
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 10:10:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21984442-8347-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 11:10:08 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 21984442-8347-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643710208;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZvO4up7j1fhOYscExFirfPxO4qeaueZBiDsCaZw2W1M=;
  b=hPf87z9lL6qS+6hB+zc990cskMfy5Ea7mR3CBqaY4VzKzF81IFFXzAlX
   HyOhhZOc+c+9PkOhnJHObWVXZI9tcarTLBIAKBcmy2P6d7H/lo9lTKseX
   3CPkXNyb6RxtbsvoRV5yFHexbyueEohhcxIAn2dI4EJyPGAJxVdwdeFgo
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 21Nd/g8xtp8wAXzv3ZeXmqYbxidY8GRx0kKvyqa1D5E1BZ/eWFeCys5sQhd77cDs/CCeJeLEmt
 bgelYSbm6/VIXqLpDrrg40QWVrP+X8AL3RUukSIbtnQf6TPg3LMiSzT677Nsv3sc1v4SnMvkqu
 W7Zg/RD8yIk5TJ5O1NqoJqqQ12UG6y1wtTnZu6RKbmqPKCrTLYiD4lyMGQgbfhnf/EnKOE2T8l
 jMZRNh67Dz0ZjeERC36OdjTYdx8sDuBA7mQ7RQ5/qEC31W2W4wqPRJHQHfHms/rr5PaO3dyN1r
 glcoIYuusZi2/sv3AyA54KZm
X-SBRS: 5.2
X-MesageID: 63204372
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yflj9Kxg7FvZlUgscE56t+cDwCrEfRIJ4+MujC+fZmUNrF6WrkUCz
 GJJXj+CMv2LMzamet9yOtji/ElTuJOAzYVhHQNvqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Vf6
 /Rz777hcwIwIJHRmtxaTyRZKz4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEDhm9s3Z8UdRrYT
 +4CZCRVc0T9WSQROAc4AZsXgLfyt3aqJlW0r3rK/PFqsgA/1jdZ+aLxPd/iX82FTMRYgG6Vv
 mvDuW/+B3kyCtubzjaU92O2scXGlyj7RYE6GaWx87hhh1j77nQaFRk+RVa95/6jhSaWQdtfN
 khS4Ssooqga/VauCNL6WnWQqnOeogQVXdYWFuQg8RyM0YLd+QPfDW8BJhZmbNElr8YwSSYd6
 k6Sn9jpCDpst5WYUXuYsLyTqFuaOyIYMGsDbi8sVhYe7p/op4RbpjXLQ9V4Gai5lOrcHz3q3
 iuKpygzgbYUpcMT3qD99lfC6xq8q56MQgMr6wH/WmO+8hg/dIOjf5av61XQ8bBHNonxZkKao
 HEOlsya7eYPJZKAjiqARKMKBr7Bz/SYNDzRh3Z/Ep9n8C6ik0NPZqgJvms4fh0wdJ9ZJ3m5O
 yc/pD+9+rd2EliLU/VVMri0EtoW0KrYUsjYV8jLO48mjodKSCeL+yRnZEi11m/rkVQxnaxXB
 ap3YfpAHl5BV/05kWPeq/M1lOZym3tgnT+7qYXTkkz/uYdyckJ5Xlvs3LGmSukipJ2JrwzOm
 zq0H5vbkk4POAESj8S+zGLyEbzoBSVhbXwVg5YOHgJmHuaAMDt7YxM26eh5E7GJZ4wPyo/1E
 oiVAye0MmbXi3zdMhmtYXt+cr7pVpsXhStlYXdxbQnwiyZyPdfHAEIjm30fJ+NPGAtLlqYcc
 hX4U5/YXqQnpsrvplzxkqURXKQ9LU/21GpizgKuYSQlfo4IeuA60oSMQ+cbzwFXVnDfnZJn+
 9WIj1qHKbJeGVgKJJuIOZqHkgPg1VBAybkadxaZfbFulLDErdICx9rZ1KFneqnh6Hzrm1On6
 uphKU5G/bGT+9Nkr4ihaGLth97BLtaS13FyRgHzxb23KTPb7iykx4pBW/yPZjfTSCX//6DKW
 Amf56iU3CQvkAkYvoxiPaxsyK5itdLjq6UDllZvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDfh/sarSbfsKYuK0Lg6S4poLfeCRdOPwOBgTB2JaduNN932
 v8ovcMbslTtihcjPtucoDpT8mCAci4JX6k978lIC473kAs7jFpFZMWEWCPx5ZiObfRKM1Urf
 WDI1PaT2ewEyxObIXQpFHXL0e5Mvrg0uUhHnA0YOlCEutvZnftrjhdfxis6E1ZOxRJd3uMtZ
 mUybx9pJb+D9itDjdRYWzz+ABlIARCU9xCjy1YNk2GFHUCkWnaUcT84MOeJuksY73hdbn5Q+
 7TBkDTpVjPjfcfQ2CouWBE696y/HIIprgCSytq6G8mlHoUhZWu3i6CjUmMEth/7DJ5jn0bAv
 +RroL59ZKCT2fT8eEHn5112DYgtdS0=
IronPort-HdrOrdr: A9a23:Bz+Nraswz7sFSPjZsozco4zt7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9RVfYd1P7orhJJGdZY8qPSMex/wqDL3QRSvyAfcZeg600ykke+E3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.88,333,1635220800"; 
   d="scan'208";a="63204372"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8DawPAwcbuOsTKnPfhaVqt6xbTjxMcxANEU+9yixIu6dFeQLXk4Al3bpLHazbvfkZTvYq61q9HzW3/xIOHYbjTJNpWrCS4xtQ+XH8qGv0fYGYDrR3EtQFIdhTt1SHTkcUiba6UOh/BHeyX6KCgZ8NolrgHAk5uNnRDB0FpqdG7UFL6nSmLax8g6xjQs/PJFqqWLGt+a2o8wedl8UHTz4Zwazle5PEmuQntL0CgX1eaTIwPjwkZuFG78OT2ZXiSJm2ie/00KPjOQmFGqwW9koSnd00iqUk2DQzZ2m0wlXprk9RAP5vkfykOh346TqqsgyoSdhwC1Nc+6FEKkJRy2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bO4jG1GuNrVkD5Sf93b0trfw7GU9uwzI+/wxRehQRJg=;
 b=gXIy/YKScE/kOnjaR8CWbE+9UHgA6MQom7ZUc7HzsRMB+R4WXpOFKmgaLkem883dJS90OXA+DdbOW26Xofc8UWJJmz2qs+WJeUPSW6DUdPaZoTh9QNR+IXBFdZdSURWOhjsqbqLtoy7be8DtpFpcknm2XSpiQaNcd8YjasIdQgcgo/B29fjyrT47zPo/1FSHtbUHMpyjyWNWedZ5G+1OXgRhgbnxyN9eQA35hp0TrRv0Lh6IXKvhSFRsYiUtBJAFJJslaAszDyWXCX7q0SDjtvBqAVWk3O7JICd005aA+aaF5Vs8ZR90GMgdyukan9z3cp0Z36QoWiB4YLBvothIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO4jG1GuNrVkD5Sf93b0trfw7GU9uwzI+/wxRehQRJg=;
 b=gpJd5siwrIU+oSn07imgEwHCA5Fs6YMq30mG0B8BQUC87RVKT0Cl8moZ/L7HYiZR6PU5boL5q4E1x6U9rnhPXzFc9upxxrXQRxs6OYnJVpILnd2ZJ934eHyzxIDEnYqXTjkuguDx5IaEFOatcpR3Tdts0832xfW6m8IwHIVQGd4=
Date: Tue, 1 Feb 2022 11:10:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <YfkG91cg+fAHFPGd@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <082ca110-2ab7-60ff-e705-032d2d472547@epam.com>
 <df36767b-e04f-aa29-82af-87e8624bd29c@suse.com>
 <c82f94c4-dadf-7b2d-4d30-a1de2b5f962a@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c82f94c4-dadf-7b2d-4d30-a1de2b5f962a@epam.com>
X-ClientProxiedBy: LO2P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af3de8f-4a10-48fc-a738-08d9e56b03a9
X-MS-TrafficTypeDiagnostic: BY5PR03MB5346:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB5346A5222075F3B88952E24F8F269@BY5PR03MB5346.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLgq8xbHz1HMxDnIAE2lzO97sH4uZrk+IoRjrrlmAypFoLC56CE3GqJYLOXKThn9395BGJN3gUxyXLGUXNaqapstQDMQShikwiPVQXqjFeGUjUikDOAO9BeL9jOL0wwWbr/KldutWqvTf37LtrbplhVd8aRlvN8yMG5rWU1zRfCRMbehel6J2mW2Blq4D+IUvb5GLxlm1DFFHJ6XqjQeVeEENbuA4VLFP4kRCwh/l4oUEBKQGFH+61jgcZU/Axw9Pw5rjzucdnPHifry6BovRzzIxx/TEuoncJszpYVLB0iDJocDwFqamhz371vneTc2d47SH5bBlGQx//Ri/IktdBEhAL2JOeLKh3tFOMEelbK1GDdMJX0ro8Qbm/Bs8vBwzula4yZywH58338VuMb4DV3QdZJjCqry0BMSzgSwA+rzWq7qpqFfvo42yuAjJkGwUkeIe4wE4ZWs/keL7nYnEC0nhURvjLkMxbim68ygloNuk0Mzg8ROt4YZtBoEchKnleK/PhyYbnu19gVz+lqz747qPpKxIT52egQHrZaYLqU1V8E1khCR959Zadiv17FMDorZU4/U1tkoa06JAhQ125ugPX6M70BhYDsZLnddSc4EUgM151n/yF0XtBeB21iiC0z1fNe9fb+VZM900jgkAc1+5TX2xAClVbRIFvYJZkDUI7A6Q+GIsqJmeabvWDDfWNYmiwcUanptGKZ+JuPFnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(66556008)(6486002)(66476007)(316002)(86362001)(4326008)(8676002)(66946007)(33716001)(85182001)(8936002)(6916009)(54906003)(82960400001)(508600001)(5660300002)(53546011)(6506007)(186003)(26005)(9686003)(6512007)(7416002)(2906002)(83380400001)(67856001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHZlMzhqblFKK2FZUUVyWUNSdXBHYnlBMTdzYS9jcXYvMG95NlZmT1gvazRI?=
 =?utf-8?B?c2cvQkNvRmVmVkVqUzErODlPbWNYdzhHOUpFMGxQYUFYTk82bHFQS2lFSGo1?=
 =?utf-8?B?cDNJMXcrU292b0FPSzVUSEtKUVNPVkozYkZtclJKcStMMnNtZkdhdDRybmdV?=
 =?utf-8?B?MnN4dnR2WmVvcHl3VkdsUmF2VE84WTRHemdvNFZBVWFnZnF3MTViZDQ0bVcw?=
 =?utf-8?B?R0hDZDNFNWs0S1NOaUtTQ2tDb1c2M01YWmpGU1dtbzhTNk1vSnJpMTJxeDh6?=
 =?utf-8?B?UlYyRlRmT29HZkpPNHVneW84SHkyRTkzY0t1dVBEZzlMbWpFdTNMUjU3clE1?=
 =?utf-8?B?SjRRWXlGL3YrSzZoK29Zdjd1dDFhUGs3b0pjeGVXTS9zbUpXdm9qRlNtL25r?=
 =?utf-8?B?ODc1OXJFN2tZS1E5eDN0ZERnZGF5WE52eWVzVkI1YmpKWWk0b1MwbjEycDl2?=
 =?utf-8?B?dlU1clM0NFZ6V2FFemNaM3ptVVVSQ0JKQ0JTUHdhY29DTnlQNEpaa2tuNGw4?=
 =?utf-8?B?SjlzNjRPaW04UHNNQXRudTQxSkErTmRoQ2ZOL1NkTDBtMktKamNLWEZlYkg5?=
 =?utf-8?B?c0JXQmNRTjJWMHlGU0J2c0RJTE43RVkvQ2xJekFtNi9jTThQWnRSbXdjbzZ6?=
 =?utf-8?B?amhoWjZZbFdNSWhyQ2c3MG5uVjhjR1pGZTRLWXlFNXF3cFF2NGVidVJYRHRw?=
 =?utf-8?B?VjFEeXgzSXdlM2VRSTdSdnlNU0d0Q1hBdm1BNzB2RHYrek9uT2wva2MxYVhC?=
 =?utf-8?B?SUUrdldqT3Jha1Q5ZE40RnZmRnZZNm9LY3M5ejRpeEZUZ0VYT3kyVkJRNEtp?=
 =?utf-8?B?UG9pZDlPRERjNFFtTUF3Rk81ZHRGcGM4YkZmTk44TVVMa2RtQUtVUkg0OW9L?=
 =?utf-8?B?WWZxWklOMXh6bnBWZ094M0lJZFlnOGsxWkZYcmhCdE1PbGJFT25QaGNFSkNo?=
 =?utf-8?B?Zm1GdTBCSkxrcFIzeVl6MDlKZk5SMHJSaHZBbU5Kb29JeDRFeEExejJ1aEtm?=
 =?utf-8?B?UzJIVnVGMHhhR05OaHcvcjlUZEx0S09zK0pKTWExaWJOSERmSGpFY2lYMTJE?=
 =?utf-8?B?clFKWmp2bnNyazNET3VmclR2dmt5TFBUVitDaXVTWDhCWlNDeE5rbk9PbVhm?=
 =?utf-8?B?UjBUWVNlVG1qdkgxS0doMnh3N0dFWmZLUmRVVXBacTh5YVoxUEhsZ2UxeEsw?=
 =?utf-8?B?VGQ2L0JJUWZQOEhZOGJEeHUyK2pWMWI4YksrdW41OXNQd1V6bWNYaUNyUVFQ?=
 =?utf-8?B?cFZYTmdETWhHUll0WDNNTHh1VUNmWkxMVXRTYm9tUUlSZFdMbU9pT0dma3Na?=
 =?utf-8?B?Q1VxbTh5QStKL3lXY2VvRS9EM1cxWGRMZEhVaWQ3d3p2T2JsQjkwc1ArVGJz?=
 =?utf-8?B?czkvcmlraDBQWldCQWl1NUQ3WHpQMjgvV0xIaEtUNWhkcG9oVVBoT1dIZXhr?=
 =?utf-8?B?NTEwMzNpc2puM0E5YXAvUXd5OXZwYk01MGxWMDdwOEEraHJJWEpUSlZzQW9E?=
 =?utf-8?B?TGV6bGR4VjUvczVVdFZzbVBoSjllTFpwVVVWcCsySFY1bk54dkNwRDhGUmhD?=
 =?utf-8?B?WmpYaitOTkhuWGtwditkeGRzT3hqY1N3cmtZVXVYNTJ1MXc1Wk5wSU1pa3A5?=
 =?utf-8?B?eTYwYldOTU01clhBMHYwaUFES2pGbzQ1YTZ4SGZoNTdlbTBYNEhJUytERUMv?=
 =?utf-8?B?dzFBWFhwSnp6YVcwM3hLeCtMQm50UWtqRGZMWHZ6V1M5bUVIalA4MVJXZFpS?=
 =?utf-8?B?WFNlcWdVZ1EvUi8ycmpteXo0NjJPK2czckw3ZUZFQmgzSE5uekx4dGRBaTRQ?=
 =?utf-8?B?RjcvdkE4VEd2eUFxM3o3SHhYbE9odU5yRU1pdjhmejQxMHpEWmU5dnNpZG5h?=
 =?utf-8?B?ZTJUWS91aC9ZUlJjOWZhdVJIQndCRGZVMytTMFdhUVlaVkZrNFdiV3N6L2hZ?=
 =?utf-8?B?NktrcjVEV2x5VTdRaS9ZQkREUkJ4amlOakVsaGNvZ0ZtMHc2MGJqcnBwTUhz?=
 =?utf-8?B?YzVnMnlLOVBDZ01NQnJJRno3S3htWFpFb01UWWthU0VzQ0E4NzZrQUtzSFUr?=
 =?utf-8?B?bWs0NktWK0VHQnFJZVdCak5KMTZKWG5FOUw5cHJDUmlpZ1dTa3RvWVdpbXVY?=
 =?utf-8?B?aTViTlMreGtSY1dsM3k5YkVpRmVHMDZvaXpSWDEvbSttL2czcGRqUHRKbnRO?=
 =?utf-8?Q?RLmtrNTxUe3jBsTWZL5qm20=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af3de8f-4a10-48fc-a738-08d9e56b03a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 10:10:03.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOGUgu/lODnf+n/GiPQ4CAYKpBmRRTtBqha4JrTESwiZO/ckPNf+SiopEjss0RE0VZHtsDJXg8VpJRBk6FzNAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5346
X-OriginatorOrg: citrix.com

On Tue, Feb 01, 2022 at 07:31:31AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 31.01.22 17:50, Jan Beulich wrote:
> > On 31.01.2022 16:06, Oleksandr Andrushchenko wrote:
> >> Hi, Roger!
> >>>>                rom->type = VPCI_BAR_EMPTY;
> >>>>        }
> >>>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> >>>> index ed127a08a953..0a73b14a92dc 100644
> >>>> --- a/xen/include/xen/vpci.h
> >>>> +++ b/xen/include/xen/vpci.h
> >>>> @@ -68,7 +68,10 @@ struct vpci {
> >>>>        struct vpci_header {
> >>>>            /* Information about the PCI BARs of this device. */
> >>>>            struct vpci_bar {
> >>>> +            /* Physical view of the BAR. */
> >>> No, that's not the physical view, it's the physical (host) address.
> >>>
> >>>>                uint64_t addr;
> >>>> +            /* Guest view of the BAR: address and lower bits. */
> >>>> +            uint64_t guest_reg;
> >>> I continue to think it would be clearer if you store the guest address
> >>> here (gaddr, without the low bits) and add those in guest_bar_read
> >>> based on bar->{type,prefetchable}. Then it would be equivalent to the
> >>> existing 'addr' field.
> >>>
> >> I agreed first to do such a change, but then recalled our discussion with Jan [1].
> >> And then we decided that in order for it to be efficient it is better if we setup all the
> >> things during the write phase (rare), rather then during the write phase (more often).
> > Small correction: The 2nd "write" was likely meant to be "read".
> Yes, this is correct.
> >   But
> > please recall that Roger is the maintainer of the code, so he gets
> > the final say.
> Agree, but would vote for the current approach as it still saves some
> CPU cycles making the read operation really tiny

I think you need to build the mapping rangeset(s) based on guest
addresses, not host ones, so it's likely going to be easier if you
store the address here in order to use it when building the rangeset.

Overall the cost of the vmexit will shadow the cost of doing a couple
of ORs here in order to return the guest view of the BAR.

If you think storing the guest view of the BAR register will make the
code easier to understand, then please go ahead. Otherwise I would
recommend to store the address like we do for the host position of the
BAR (ie: addr field).

Thanks, Roger.

