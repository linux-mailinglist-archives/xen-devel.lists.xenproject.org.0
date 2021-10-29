Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B540043F7E2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 09:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218408.378830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgMP9-0000ce-78; Fri, 29 Oct 2021 07:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218408.378830; Fri, 29 Oct 2021 07:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgMP9-0000aa-3B; Fri, 29 Oct 2021 07:34:23 +0000
Received: by outflank-mailman (input) for mailman id 218408;
 Fri, 29 Oct 2021 07:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slsI=PR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mgMP7-0000aU-6C
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 07:34:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a07bef66-388a-11ec-850a-12813bfff9fa;
 Fri, 29 Oct 2021 07:34:19 +0000 (UTC)
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
X-Inumbo-ID: a07bef66-388a-11ec-850a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635492859;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Htls4ulL51CujrqXzqk25KMUmpC6GMMGah5DA47sNNo=;
  b=BA/iao6iwzpAK0XDO7liHsRDabdIxjNzyfqsTmAKmMh2lYH1hcAlyBlf
   e7d7KNLKkFC+ysb+DNXRBaoHqAnTW/ilktcQoOIH4N4Rh7dXEVZOdGhpk
   Zm+rPsiOdEPiX7WcLBpAEr6q1CgFGszb5FmNEB6pBy8OGZiMcnWLqn74w
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KXs+zWnLr1v6cyWSLH38C6MP+35KnOoOsIauKe0PhUEbch8JBmj2f1Z9msdXO1gPJCp/xBFKh4
 UsNJcynB0TLwWB8HUePs42h8/3aU3NKsJHxjtksLi7kaBno2gLAfEmucfYQkINUKw+NjYaete5
 I3nF8uim/mLo+2Bk7Pwg9oEca1KHsP3DAtH1f6Iie8wWOs+2/3G7/josXT2B+29J+Rb4HSATyL
 JsB+GfLaKd3BrRP1pcXQcNy3isN3hbcZs3eAlGWmxJgSJZOesUNcz2UTTHZ2EejbMKS7EqjIQ2
 ADbQ5Cg+dplXqbgCIoCINlj6
X-SBRS: 5.1
X-MesageID: 56613373
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:F5Ae4q5WTOE5zaMZhGOYNgxRtIfAchMFZxGqfqrLsTDasY5as4F+v
 mNMDzqGOvuCYTTxfYgnb9jj9U5TscfWmt9qTARq/C1jHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2N4w2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 o9Rtru/Qg0SAJaPgsk5aBN/OR9aMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWlu35sVQq22i
 8wxMTUxNg3+WiJ1amg6F68zn9qVnnjRbGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSFwDqY9jS3h+nAnQvyQodUH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3GuvQ9rmVhu0ukmtuBIGRsFQGO037gKK4qfM6gPfDW8BJhZDddgnuckeVTEsk
 FiTkLvBDzF1rKecT37b876OtC6zIgAcN2pEbigBJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RiE9jQ9oLoYh/U17Oah0HT8iRWGmLzGG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxJDAtLFm4YWl0XXXGr1UTe7BC+OtaWWE2TZS848dGyNBEpJJVbtb5y1iPw9XO8IAdC6Bj
 KT76F4JusE70JdHa8ZKj2ON5yYCkfeI+TfNDKm8gj9yjn5ZLlLvEMZGPhf44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2IGMynkUn6gePGPhZ5rIvp1nPUM4jVC4vf+W3oH
 yt3bZPWm32zrsWnOkE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNauTWFpmZETAy37zgCN9CWtuhY9CH6YKkU4Pr709nKEtF
 alVJ61twJ1nE1z6xtjUVrGkxKRKfxW3nwOeeS2jZTk0ZZl7QALVvNTje2PSGOMmV3bfWRIWr
 +Ly2wXFb4AEQgg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXh
 1SMHBMVhejRuItpotPHsr+J8tWyGOxkE0sEQ2SCteSqNTPX93aIyJNbVLraZijUUW75of3wZ
 ehcw/zmHucAmVJG79h1H7pxlPps7Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xvWqNdAOLiPNMf0K3IrJVIoPraZyPUZujjO9vBpck/00zB6oeicWkJIMhjS1CEEdOlpMJkoy
 PsKsdIN71DtkQIjN9uLg3wG92mIKXBcAawruotDXd3ugwsvjFpDfYbdGmn955TWM4dANUwjI
 zm1gqvehusDmhqeIiRrTXWdj/BAgZkuuQxRyA5QLluErdPJm/sr0UAD6j8wVAlUkk1K3u8b1
 rKH7KGpyXFiJwtVufU=
IronPort-HdrOrdr: A9a23:eTZup6rEz7Hapd5UtUJ9dwIaV5uxL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhOY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX202oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDQ4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAqqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocZTbqjVQGbgoBT+q3vYpxqdS32B3Tq+/blnAS+pUoJj3fxn6ck7zM9HJFUcegz2w
 2LCNUuqFh0dL5lUUtKPpZ3fSKGMB2/ffvyChPmHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,191,1631592000"; 
   d="scan'208";a="56613373"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSbSsJLdx1D0Jx/myq+ZWDurlRrugxnRjf0QOtGppBvDqVw1gEz0zuTtImAH3982HYaRpb8vH6I/04wHKYT4XZKcFb+lcR33m4fXsAP+UTjou8jquK/ZrW9HEoyl1Jsvqz2/QxpzSiw4VG86ZsZrQzHWUS41Y4qI/nvs21RMlB7ff0kRdrIAmYnzDlemYyXB4SdQF0lqolbfL7Q5MSIzZYGUDC09tllOhti3O1IFNbpulNZTQMzsyHfU75GSqrvUhN4e3qXt1tUGU2R1BVgIWFy2Lic5P36WKiFUucbkNICAIuI0exdZDggtHEdjc5RHqySZ9JWyzku78gEBCsXo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GAx4LKQKNaHQoging8yT8bl0sE3U6jYHaKB6MVRuNM=;
 b=NL5iurLplJDJXlEjuQp1BIUFkfV9bAiN9SI6AfejKEWSefJa9fS3U3J49WcWPIIjAS7kN50FZ9q0aNv8ktKsVGEOCbvkZ6pSBZ2nNh7lO0t6CMsuj+74C2VM1ob4Fej6YgoV9Ns8Bk00mW+99ZfHnp6HjzA5wiDAHJAkeyLp0kscyMLl5XohgXtga3mpa4Z/no/Lm2AEMqlbJ30iM3eNmwjAWYMFE7v434vlYWWNaIbjTqqhprC0IO//Ua581bvALnFzZ8y8MP7eJR1YMIBfAcWt3jPMcblucEzEwJVVYCCRDPJ9/B3wZRIztlPAnanZ0lrLr2ki0J3QBIcgvBk/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GAx4LKQKNaHQoging8yT8bl0sE3U6jYHaKB6MVRuNM=;
 b=eqxf9bim7mnvK7cFpUXtOjdWyFBqon4vQE5fz+bMDgEGcVrVfZfZG899IQSVhMxfv4E1IpYAwhvgKloOvFF0Gyy5hHPJRPRADQwxa+1Kz7MMuTGJQu0OJL23wlw4TJWSIMe5JOsNECw4+XppP5hL1hpcIzOamUyqSPmhPPqPgKk=
Date: Fri, 29 Oct 2021 09:33:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Rahul Singh <rahul.singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Message-ID: <YXuj4frtHIRuSgOO@Air-de-Roger>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
 <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
X-ClientProxiedBy: PR1P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1398bade-6131-4a92-c717-08d99aae7801
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-Microsoft-Antispam-PRVS: <DM5PR03MB337058CACD804977CC63CF2B8F879@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cz6LqoD2JUHqCQDt2V+1KxpmhFPAJHs5397kgTIjz6MVqZYrbLwt27LU0ySqf0lsZq3gqeyQCxAGqWMXjMwlaiB1+Ao2M0tn8SE7bfFNZsn8KoDUsy23GK5CZUZhrGc0Tx+50pGBsEPnkC9/nCBT+zTKAXlhx649eBUkickqJbPgRTIx28mScCHOe11LHR7Wdeed0ZC8daGVD7l7za5vBKqLPJJGlCGi0lrADu5BooceOMnpYx2EC9+yjLgO6vMTaO0in3PqsH6YvZzPSl2NdFFzWc5QrTlquhsMWedNhFS9KvFzmenVnb6stq8jlDVhhlKxdnQo2ewD6vQnnaP0zYqZU39vcD73f4BZxX6vK6r6FvUcXeKGi48iNHxz+l6DUH/RZoEvaAhHswaw+AXaMKLIGtQ1NSXWq1CSmLREhrr7IzpTuXWdQqMmDDMKXd2gOFCCI9wiDNmThSAs5tS8M/AHfmo6xTc4+/0cvV2qd7do4TzEbjd24CPpFqdRCBqq6YgS033i5OS5PFQ7lu4ZqPdPVPRVrdcVxQiA9cAQKb7bRmmDkaI7wmfACEo3TShQXajP6HukYxlDXJqpH6oZwc9Z1ADX+1c8E5vgBEMimWTisoYS1wjw/cE7eHrdU/cuqJe8MZI6eXZe93JlDxWhgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(8936002)(82960400001)(4326008)(38100700002)(8676002)(66556008)(6666004)(83380400001)(26005)(508600001)(6916009)(54906003)(186003)(6486002)(9686003)(66476007)(86362001)(5660300002)(53546011)(2906002)(956004)(85182001)(33716001)(316002)(66946007)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NENXQXp1VHNOSkIyZmVLUkd6dysxN3dMRENTVlZuWm5sVVRlc1M1dnYwK3RK?=
 =?utf-8?B?S0w3aTArNHh3blRHR2JTWmdZQlVFQnZnemFrT05uZ1YwUWpTdFc5Sm9aTkZ4?=
 =?utf-8?B?a25NZnluNjIyTFZXYldmVUxVRHFLNkpoWnZrWlNTeHZMaDJOdlB2OFdoeG1Q?=
 =?utf-8?B?VEdnOFhRekZ2dnZKMml1dW1IMFNkWUJpalVKV1JPQ21hL3RRREUrejlsT0Fn?=
 =?utf-8?B?R2ttdXR3Q1JHTW5hU2ppbUt4TjBYeWJQODRJcnZCVXBCaFlOdDVmZlhqajBw?=
 =?utf-8?B?UmxnSTZvdUFTWWVLWVdKdjRQY3FrRDdwWHVjWnRoYzJJb3BsQkZVZTk0RmR1?=
 =?utf-8?B?OW4rT2NvZGl0NnVVWUVhbUdGUjBSQ3FnOHlSLzhwRDZZd0pnVkhXKzR4V0Js?=
 =?utf-8?B?amJrZHYyTlJ1azdybnBYZ3pSVit0M0dlaEdhY0lmKy9oRVd6WmdUVEY4YzVD?=
 =?utf-8?B?OXM2N3c2NERaVlBCQmhhWTVka0ZSZVRJazd3NDNRM2NPVkFXRGIyYS9XRUp4?=
 =?utf-8?B?YVRHalhqVGlLWVNUQWk0Sjd5aDM3UExuY3I4emtUWXI5ZWFRclIyVWJHVWdi?=
 =?utf-8?B?NWlVNXcvZFU3ODVLQ0pSNGxPRG5SSmtSNXJ2UWNlYXpObUloU2ZqSmFmWkMx?=
 =?utf-8?B?SHkwRS9HZHUwQW9ZR3lVNXBXclpheFpNZHl0Vy9hbzlOdXRaNzJFbjMxUEF0?=
 =?utf-8?B?M0FsMzlzMzhBMkVPaGlSZzUwZnhMMkRLTWFUUHNZeXhjbkxzRnpSYXdWTDdq?=
 =?utf-8?B?V1BhSStDVEJaSlRPNGRiMFBDd1ZEMDZ4M3FybldEcllPNmFMU1IrQ09tN3Aw?=
 =?utf-8?B?MDBCUTBMdkRZbEpGMzRDdzl4WjZNVzN2RXNTalhWS0N1bjhoTlJsVkxsTUxa?=
 =?utf-8?B?aEN4ZndRNmVaK0tWNi9EbExncm9uNHZIQkhLdnBXZzlBYzIrc0QzajZISStz?=
 =?utf-8?B?cUFkMEZEZ3Bkb3ZZcCtRTll0cnJ3ZUt3b1BnMW0vTmtzdGgySm5uSFZZcXBs?=
 =?utf-8?B?Z09Rb1BET0Vub2JKSEdxdWlvN3JNQm1sTUlyQUR2REx3MjJRdjYvTUltOXJn?=
 =?utf-8?B?UXJscHB0cW1ZaVRib0oxem4xV2sxNEFkZGNYNkM2Z0JSa1J6NFVGNnRkWWtD?=
 =?utf-8?B?cEFFUlBUWnE1ZjJaRFNNcGJvRmQycDJhdkFGMEI0eVJqbE1kVlRUMXlTQ2Y2?=
 =?utf-8?B?MUFEaDBNVC83OElOWjU3L3hScDJsY096RWNMU3FtSFduU0xqU21KUUlzcVc4?=
 =?utf-8?B?VHEzNDBLQ1ZaclYyS3ZEVldaMnhFSnFkZklyMCt2WmVJU2tjZGZuS0VXNC9i?=
 =?utf-8?B?cko1ZkRxSGRzTUZWQUFtSHFtUUhBeGlNNnl5ZEJpZjZsWU5QaWpvNGNvckZr?=
 =?utf-8?B?ZEx4OHJYc3N6cGYraW9naVBEZk1mOFRNdjZIZU44eXFKdVdYTjYvanV2eFVu?=
 =?utf-8?B?UWJobDluS3BIZXVHUGYxS3VoN05PMlBxMEpDYXRBdzN6TG9uRGU2VUtNU01J?=
 =?utf-8?B?SG5aZTVuVmdHclBBaWJjckRNS3BUT3JZMVZZbWhnOG9WTm1OdkV4d1hHU3VU?=
 =?utf-8?B?VDFxcFlwcWF3T1NqQTV3dHZORHZzRlA3S2FjQ3R5dldlWmNqL0MvZGoyaEVT?=
 =?utf-8?B?ZkhNSGRVSjVqckthMzRvellrQVJya20yVXhpMlY4bUlVOXo2dnZ3YVo1MzAz?=
 =?utf-8?B?WmY4b1NwU2phbno0TDJxbmg1cjllQ09nTTI4bzlhUC8wSE5sNGUvcG1hdlo3?=
 =?utf-8?B?YVBPSE9PSzYxMW1rcVpnNUFRVUNhM3pRUEFKRHhLVHRWQXFmUXNKSHBzelRH?=
 =?utf-8?B?a2doZGpzT3RjOHp4dEt4emphQU5pWWVZTlI1d3RpeVBTZmVQWkF1cFFrek5P?=
 =?utf-8?B?T29sVTNGSGxCZDhvNTlaTTEvamxnMk9rbGJ4YXpDbEs2anhlRTlSK0xOSkdx?=
 =?utf-8?B?elRod0sxUlFZWFdsVUEyOG51dmFWOE81ZndMWnUraUpobVorMEJuR2NvTDAz?=
 =?utf-8?B?SHd5L2hUN0hLcU9pb09NZmU2eittclF0Z2JmQldCQlRsTlhCa0NvTEZiTEJW?=
 =?utf-8?B?bXlld3RqM2ZLY0FPTXdWQk15S2NGblUrM1d2YzFqTXV6TW1ZV014SURtYWFC?=
 =?utf-8?B?MmN4YUdKOUFHeGVERXBFcU1pc2luUTFMK0MyanhhcCtyK1ZmdXN4NFlGZ1d3?=
 =?utf-8?Q?SSdq8DTgeuqNX1lbr+YRfis=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1398bade-6131-4a92-c717-08d99aae7801
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 07:33:57.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlaTpqt1TEi88Sjg2EWqkW25CubT/vUHusm4EhPlE284lbmzXe93j1MiLYGhTrmrq2eDJZIYXGSW/Fr0gbOrFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Thu, Oct 28, 2021 at 05:55:25PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 28.10.21 19:03, Roger Pau Monné wrote:
> > On Thu, Oct 28, 2021 at 02:23:34PM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 28.10.21 16:36, Roger Pau Monné wrote:
> >>> On Thu, Oct 28, 2021 at 12:09:23PM +0000, Oleksandr Andrushchenko wrote:
> >>>> Hi, Julien!
> >>>>
> >>>> On 27.10.21 20:35, Julien Grall wrote:
> >>>>> Hi Oleksandr,
> >>>>>
> >>>>> On 27/10/2021 09:25, Oleksandr Andrushchenko wrote:
> >>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>>>
> >>>>>> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
> >>>>>> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
> >>>>>> the base address may not be aligned in the way that the translation
> >>>>>> always work. If not adjusted with respect to the base address it may not be
> >>>>>> able to properly convert SBDF and crashes:
> >>>>>>
> >>>>>> (XEN) vpci_mmio_read 0000:65:1a.0 reg 8bc gpa e65d08bc
> >>>>> I can't find a printk() that may output this message. Where does this comes from?
> >>>> That was a debug print. I shouldn't have used that in the patch description, but
> >>>> probably after "---" to better explain what's happening
> >>>>> Anyway, IIUC the guest physical address is 0xe65d08bc which, if I am not mistaken, doesn't belong to the range advertised for GUEST_VPCI_ECAM.
> >>>> This is from dom0 I am working on now.
> >>>>> IMHO, the stack trace should come from usptream Xen or need some information to explain how this was reproduced.
> >>>>>
> >>>>>> (XEN) Data Abort Trap. Syndrome=0x6
> >>>>>> (XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000
> >>>>> I can understnad that if we don't substract GUEST_VPCI_ECAM, we would (in theory) not get the correct BDF. But... I don't understand how this would result to a data abort in the hypervisor.
> >>>>>
> >>>>> In fact, I think the vPCI code should be resilient enough to not crash if we pass the wrong BDF.
> >>>> Well, there is no (?) easy way to validate SBDF. And this could be a problem if we have a misbehaving
> >>>> guest which may force Xen to access the memory beyond that of PCI host bridge
> >>> How could that be? The ECAM region exposed to the guest you should be
> >>> the same as the physical one for dom0?
> >> Ok, I have a Designware PCI hist which has 2 ECAM regions (I am starting to
> >> implement the driver for it, so I can be wrong here):
> >> - Root Complex ECAM area ("dbi"), it is something like 0x3000 bytes long
> >> - "Client" ECAM area ("config")
> >> So from Dom0 POV we have 2 ECAM regions and for the guest
> >> we always emulate a single big region:
> > You need support for multiple ECAM regions. That's how we do it on x86
> > PVH dom0. See register_vpci_mmcfg_handler and related machinery.
> Is it common for a PCI host bridge to have multiple ECAM regions?
> Currently on Arm we were about to support "pci-host-ecam-generic" [1],
> e.g. generic ECAM host bridge which normally (?) has a single ECAM
> region [2]. But the host bridge I want to support has multiple, so
> strictly speaking it is not the one that we implement.

It's possible on x86 to have multiple ECAM regions, whether that means
multiple host bridges, or host bridges having multiple ECAM regions is
unknown to me. It's all reported in the MCFG ACPI table (see PCI
Firmware document for the detailed description of MCFG) using the
"Configuration Space Base Address Allocation Structure", and there can
be multiple of those structures.

> Arm folks, do we want this generalization at this moment to align with x86
> with this respect?
> 
> We can live with the current approach and when I have my driver implemented
> I can send patches to make that generalization.
> >
> >> /*
> >>    * 256 MB is reserved for VPCI configuration space based on calculation
> >>    * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB
> >>    */
> >> #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
> >> #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
> >>
> >> So, we have the base address and size of the emulated ECAM space
> >> not connected to the real host bridge
> >>> And for domUs you really need to fix vpci_{read,write} to not
> >>> passthrough accesses not explicitly handled.
> >> Do you mean that we need to validate SBDFs there?
> >> This can be tricky if we have a use-case when a PCI device being
> >> passed through if not put at 0000:00:0.0, but requested to be, for
> >> example, 0000:0d:0.0. So, we need to go over the list of virtual
> >> devices and see if SBDF the guest is trying to access is a valid SBDF.
> >> Is this what you mean?
> > No, you need to prevent accesses to registers not explicitly handled
> > by vpci. Ie: do not forward unhandled accesses to
> > vpci_{read,wrie}_hw).
> I see, so those which have no handlers are not passed to the hardware.
> I need to see how to do that

Indeed. Without fixing that passthrough to domUs is completely unsafe,
as you allow domUs full access to registers not explicitly handled by
current vPCI code.

Regards, Roger.

