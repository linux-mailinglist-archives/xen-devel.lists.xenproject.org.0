Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D4750190
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 10:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562061.878615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJVGN-0001BV-OC; Wed, 12 Jul 2023 08:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562061.878615; Wed, 12 Jul 2023 08:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJVGN-00019n-Ky; Wed, 12 Jul 2023 08:31:55 +0000
Received: by outflank-mailman (input) for mailman id 562061;
 Wed, 12 Jul 2023 08:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdEw=C6=citrix.com=prvs=550563963=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qJVGM-000192-Ps
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 08:31:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b56e35d-208e-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 10:31:53 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2023 04:31:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6537.namprd03.prod.outlook.com (2603:10b6:303:124::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Wed, 12 Jul
 2023 08:31:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::f3c4:948d:a70a:de2a]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::f3c4:948d:a70a:de2a%5]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 08:31:42 +0000
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
X-Inumbo-ID: 8b56e35d-208e-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689150712;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YKGLG1iV3KvOHMAwM/lp/+QBoeezRlpFqOrsq0LKU8U=;
  b=ZdRl9bV2AaY2EBEheGISEYT/PhE9J2J7YU2RoRnJdLbWz1IGjBhs43Zs
   DHGR9xGsK9x+fdHkLyRqBnq0WQr2KFcz/pZ4qBLruqkkS87eTSfguRuCB
   3d9KhF4DyryplnU9AHGT3q/lPJhU8miNh0kQ5EnUpjTV2mw72OtIQSXZN
   8=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 115811936
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bYsrgKLiX49OClTTFE+RnpUlxSXFcZb7ZxGr2PjKsXjdYENShWBTx
 mQaC2iFOv3Za2anLYpza9yz/UtSsJPcnYcwSAZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QVkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5+WE8W+
 +U0dAsUTT+8q8G6zLKLaOxF05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqmCNtLRebmnhJsqFed2UUrU0c3bgaypcO9sXO1Cvt5d
 kNBr0LCqoB3riRHVOLVXRC+uzibvx0YUtxcHvcS7ACLw7DTpQGDCQAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv5hDaq0g9vdCTz2h
 TeQo0AWubIXisIa0rShynrOiTmsu5vhQxY840PcWWfNxil0fpK/boqkr33S9+9dLZ2xR0OE+
 nMDnqC27u8UCoqWvDeQW+hLF7asj96aNBXMjFgpGIMunxyo8mSoO4pX5jd/L0ZBO9wBPzTuZ
 Sf7sAhR5ZkVM2aycaZfapi0Tc8tyMDd+c/NU/nVap9CZ8Z3fQrepiV2PxfOjibqjVQmlrw5N
 dGDa8GwAH0GCKNhij2rW+Ma1rxtzSc7rY/Oea3GI92c+eL2TBaopX0tYDNisshRAHu4nTjo
IronPort-HdrOrdr: A9a23:efhKEaHAaDAJPZlCpLqELseALOsnbusQ8zAXP0AYc20yTiW9rb
 HToB17726ItN91Yh0dcL+7Scy9qB/nhPpICMwqTMiftUrdyRiVxeJZnPHfKl/balXDH7VmpN
 ddmsFFYbWaZzUb/KWKgjVQUexQu+Vvm5rY/Ns2oU0dKj2CjZsA0+5/MGim+0tNKzVuNN4cHJ
 qY5s1I4x+hY2l/VLXIOpAcZZmzmzTUruOZXSI7
X-Talos-CUID: 9a23:TxWxA299q/tcYzod9TeVv0dNNJgra1GB927zDHCUKmplSI23THbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AeNty0w0bxmnrIlsIif2TMply1zUj6aqxIXhWy7Q?=
 =?us-ascii?q?95sCADyhLBjzMpRLqTdpy?=
X-IronPort-AV: E=Sophos;i="6.01,199,1684814400"; 
   d="scan'208";a="115811936"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nesiVjjz9T67/8sL+qW+m1QuqEg/SpbagNCOiX2OnNn7lGRPBBU6BKDBq2WzUp8pN+GNKnbGBBqaCdPxcbZmtu9fSQlZVJPNuBj/wd4yZtpammseqd1OGZ0sJCkD9GzUu5gKAeV4FKvq64935zimekMEBEZ0Fg4rEPEIlJeNzWVR8v5uPxbPPECMPEkeVD9oCMw1ickAI8b0go1BB0d3cpInT53rgmSKdCj2OKivqy2GvwRoqRlnP2GzKr6B1LS4shtplxJjBNFWPMG9x/jhyFkngP6/baMywsWqtM1LrHKGZjK99t/MZZJ1rT0JHKdzYgW/1I3quixzXaqiAotViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiHAcxPrPiVdJ2KScPsOSAUGvxMRX9irUEVSjSMsD5Q=;
 b=ltOnyxAz/Fz85C1w/y2/iO1xiDJuUJjDLYyS8EnlKDzgK20jgu+tIvvSx7N8K/RuZhj+uAsM9sU8CXuqena5Ip+9xfYesoi4DrATqFa4fITWOjUybYmu6V2B6SmeXnhloGLn4wr1SYL3oGkcbgpUs/GJKgYCX7b6bKTDlQd0Db48tt0sdfgJEKCUTRe3AaIP7oI/2oNvFwbLMV29OLwHqdEack6FNrWhIBAxwqyIlDJkFUBagRX9fn82QZCyOoUupF7MBVxmEtBEqDwThWJyNBjiPYE+09RAdtM7fp1EomNW5qC9yHDjk33aQDwywh/YCqYUvlz/F4/2MGn6urtPmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiHAcxPrPiVdJ2KScPsOSAUGvxMRX9irUEVSjSMsD5Q=;
 b=Lc4H6vuXldNj8phNZQrZEeH8Oiou4B+0rZzGPnCd6QVuZ+Bx41K7n7WQMsK5a9dAtO5XMX7dcoHqF1Us8bnKpLFukM04nC+UFR6Su8k+S5kF1bqc5UKu5f3EMorbXaeOgmc4zmbQHJM3hSKB908endApxofqzlqbknT/w6n762o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <826c2ff0-79d3-9544-5ce3-7f49905a353c@citrix.com>
Date: Wed, 12 Jul 2023 09:31:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v9 02/24] xen/arm: add TEE teardown to
 arch_domain_teardown()
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <20230705093433.2514898-3-jens.wiklander@linaro.org>
In-Reply-To: <20230705093433.2514898-3-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0630.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: a7746e58-443e-4ec6-6154-08db82b26b0e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OgSBwl99MR4nNNf+lFGblmfVfCZk7E1C/H6GTFwmc2L5HYUBALN9szkeH7Bw9PqiFG/hFX8DNTZ7OgOm2qQhXTmTot7L5DzXn4qCapWpwl3eQswUtgZOmjwQOf0MeGwZdfms8bXDhCiLY8bmAPdG0q3IwR2XDqVrKo7bTszld7uar0NAjj0T13va9RGi/HMy1PVv7FCTMobEV8xSC7JeL6+rpbNPT/vryTAorblR0i7N/npyxTVOi9/hv0P3BjTgWy7C0Ts36VDnjn8I6rFkJY7XWN1RNJFEiyl80IenafGO8L3wZgnLDTV8BT4sESIjy6MFW7dqGTlN+bg9nHfnv0yMPSTDx1qi0SxaUFmWsWR9/rBJ6o8j+9bHopzB3WKuYr2JCy4LXI34Xs7pU7lYATYeQ/pXOzeAARmfeRu1AxK5WjjG1PrpUC5+F/per1/OR6z+i0iEJPM/ATvWq0M5caoRHvwTMJ5Kxr3BZ3TF9LxqMbUl6YYKHxrS5QTKHqORnIE1qrYdlAiXDom6fiuGlYGwa1vT3zFh+9E3a+dVHw/URk1vSEQ2/eyBSyyv8enG2rbpGoRdUeaImUT7jYG7GZlvOaCQ8zPa7eEYnXRiCETSXoOf2p7dzqhwgi81a3U3szCHDYkpfds/f+XuCJ5aag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(86362001)(53546011)(82960400001)(31686004)(54906003)(8936002)(8676002)(7416002)(5660300002)(31696002)(478600001)(6506007)(66476007)(26005)(4326008)(66946007)(316002)(41300700001)(6666004)(66556008)(6486002)(186003)(6512007)(2616005)(2906002)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmNWaUFIcnBtbVVWMkx4eEYyWVNOTnZGUWFUNWVzeklWQW9PL0kxMmg2bmhS?=
 =?utf-8?B?MXJheml5YklTcnByZzRCTlk4RzlYK0JzVExWV3VodElPYTlYSkUzVDFTLys2?=
 =?utf-8?B?SEdwSTE1Vk9laXc4bm5NMXovdTlnQzJ5ZlVMd3hxaC9NMTZxKzNLS2pZcDgv?=
 =?utf-8?B?VFRVU09jK1BEMUdZbW1jYmN6Z3J4ZmRJMkdjUXhSYnMvVnI1UEowSUZkTTdp?=
 =?utf-8?B?ZklSRmR3VkJNVUNoNGhNc0FrNXV4VUtCeTRTYUZMZmFPQXdTTW5XYitTWGgv?=
 =?utf-8?B?a1VWclhJVGZiZ3ZwYzJUbGhzdTdnT2Y3ZjRDbDZ0SDF6RHV2dGZvaXdXUW04?=
 =?utf-8?B?RmRDdW82N2FOTEVXUGcrSm82RkdKcFhMRE1JUFQ0K3JjNlUvQ2xiVEpTdnhx?=
 =?utf-8?B?NGFjZmlGVWcza1gvMk04YUtCbU9QWWZBQ0hTQ3JHWnZ6R3B0MExteFRqUG0z?=
 =?utf-8?B?akVHeVI4UmZ4M2JHMmcyRE1UdnJsc3pHRVlRN2ZONGhoK0g4aDNyRkpsTXZa?=
 =?utf-8?B?U1hEYnpNK1JjdFlhUHVSSGlzT2l2elEyY0FDYmVZM2tLVHdaQ1BSazNMSWVF?=
 =?utf-8?B?YWdEUjYrZ0ZOTzVOSDhWTGpXYzU4YmtZZTh6YkFjdENnQSsydUx5clJ5WFdY?=
 =?utf-8?B?NTdQd0JQNGVHaGFtNFEwUDZJUmhXd1AzenV4eWZlVzMzUExtcCt2STZ3Rldz?=
 =?utf-8?B?L1lVTkUrZHVZV3hpN1AvOEFFMGFzTUhYRk9xaUNZUG5yb3hYMEhLY1c4Y2E5?=
 =?utf-8?B?YWVmS2VGeE5OMFMxRWxLcnVNdGJaNlhMUkNxZit4YkVoeGtIWk96clJVVVFK?=
 =?utf-8?B?VWZTZEE5OGJsYVd2eEN5RDZidEptQm9zVElvNGFSQW1pYWpLVXNXdTFvbnJp?=
 =?utf-8?B?cEF1M2JacUNyaGNJcE16T2hNZ0xraXFjNTJrZFdkVTlkV0NncDRFL0UvR2JN?=
 =?utf-8?B?Z2J3blNwWUlMcXF6bkhMWlBlK0dMLzQwci8wUGdvaGNURkY5RmpUZU1WUnJu?=
 =?utf-8?B?NlVneXRBaCtyTSt4SmVySGo0aFdXQWNWcEhQcDhISmVQRk43d3NmbTNaNmZO?=
 =?utf-8?B?NFBGdTcvTGVUZFdONTZnUnNic1VqSTd1MmcvbGViQm1IT0ltendESWhESWVY?=
 =?utf-8?B?NU1sQmROdVR3M20wemlGSE5kcEExR0ZRRGNON25uUDJ1VTA4a3ltMkFMdzB3?=
 =?utf-8?B?V1lnMHhVUzN0aE1ETXZ2YzFGZzU5V2NnQUplOXdLaHY0UUNFY013L1ArRFB3?=
 =?utf-8?B?dkFFTjllaEJoS1d0YWhtOFZQV0RmWDk1VmlQd0hZbi92b3RWMUsxK3pxY2ZF?=
 =?utf-8?B?KzhUTjhnTG9tNG9mcDhVdkFuZENyNkt4aVRVUkd3YTFWcGNEQ05yQktKT2ZR?=
 =?utf-8?B?N1N3Z2pQVmorUmM0eEhBMGtlSWF2Si9sNjFqY0NyVkJYc3I1N05kbWJxb1Qw?=
 =?utf-8?B?NkJxcWhBdGE5OGJWS3BuN3JuR01PQUY4NDJvZEtWOWtHdjFpTDVQYlJ4QVVV?=
 =?utf-8?B?SHNDb1NiZ2FYcjJzbnFNaFFTU2Fya25sWWxDWEx6VU1YMWdJNytlV0ZESG9P?=
 =?utf-8?B?ZFNNZXFiN1EyUTFqM3lNR3dkSWtTY0FhWmNGVTk5K2M2dXZKTWpQbDMyWktw?=
 =?utf-8?B?cmpsS2pZU3ZPTlk3Q2IreWtWSW9ZTzF6bk1QUElTeXE5cXhIQ0QwN3NYSEpJ?=
 =?utf-8?B?disyek16MGV6YXU2QlhSR0FqYmdtV1lwZlN3Q1lYNkRGWk5EdlZaVm1JQ1Jw?=
 =?utf-8?B?VE9GRjQwUEVkQlhEeG5wTGVOUEhFUTkxMSt1YjFNcXFhWGFlTThSRDlHTDJJ?=
 =?utf-8?B?SWhjWXVxeUJDMmdzUVF1VjY3V1l6eU1TeTdzclNPVHZEeGF6Wk5HM0dIV0tZ?=
 =?utf-8?B?MHRqZHZxYzNkN3lCZ29QQUNEU3V4Nzhjeis1SWdmeGwrQnhwMis2RldrZk9G?=
 =?utf-8?B?dlQyOUtBbXp0UitTY3ZhR0NtMDlEcEMwdUpKK1kyWTNaT3Uwci8xUTY1akVj?=
 =?utf-8?B?UGV6WXNlTUoyUUc4UWFJTlFVcldTRjRTSVA4TGRGMXI1aUxzeDlDellNMk4r?=
 =?utf-8?B?K1pvK2VsWXhBelViZUhrVFNkcjRLWkJjK2JPVnM5Y01zMDdmRzI0aUwreXhp?=
 =?utf-8?B?QVJURU40dGM4VGZQK1pvcm15UFcrMCtPeHB2dk1PM2tvcWNnN0x4ZG1HcjFF?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dWXOL4cxnesg0ttDSR/qMjJMYhVzWcW22f0gqGHYxV6PsC2BE6G6vLLbPHfbRYFBqgRf77V0gmcLhZaEEx0aI90vhN+0VOfS67wngigr1spU/Cr46YjEK4sZxIfyUJGsL8oBHKjFuZQRSrif6XtYyuvzUZulnfXUaOAeJoJN9HFgh9QigqVhos86Yilz9/6jESOT6FLT2wlwejhHeE50Y4HAGVxOjI9WfJFjSq15U5AHYcDo7uw+TO2kWToHvP7EOb0HvflwKt2KHY/jMbkQz412uCm8qDeWwY4kJbIWfxEIZwZFJZdgbG67mV1c/XzAPxZfgMDKXKiFrgDMG5n2XeWIye+X2Bes5kJPfDq+xhHqCy3nT+oIRBQ0Y8/YtgHeIi33yrsy6rOkQfcJgPA4YDxJC3QVoiWsNghI9D6LNrtcx0RwNZeHxLXNBt2PaqQ29GjOgRbxF7EFZY8NZqq9axazkpe0+pz6xGm9UTAH2iI/KYXG7SQix22uT/qfMaA0cogMRiudpZ4wcaAjGfP5v7EHPgCbqA1M0OynHQpH9LdsMA1vFUz/SlUbq08k78cYGUhdWIoi1g0GwBI1fRLdRPqlmYVWTEakbi6a87eBNPQ32Ph9UUJ/lb801RX+Unjz1RyqySmVybNvhXBt/VapJs0TwTNPhtV15M5AKqu8WnzSENm1JWAiLDXZgj2hWpmFtjFdSw/EGdGoCR1FpYG5sDw6o52Z1ECvYzinG8rOlTnH1bXF8e49L2IgRc+C4sD22qfu+/FLdj9KW7maieP3fOFPNyokApW5tSAwzebLAENewaP7ZpdVOw1d7745S7BJ0izs1ILqksGhbn+JIx3vLCVfSukfgI0Zkf2ab3SbPUt9ZTA8B7nmwvD3gacvTHC/qYJKpgrCzjfIRugy0no+XocnU3+o3+rp/h0d99jyxqk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7746e58-443e-4ec6-6154-08db82b26b0e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 08:31:41.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ReHYMYs3UAVldQmmh3YgDoPt6JutFnrfEwQ+083Vuw+WdQYRwZ4qbKxM+AEpzF0nF18+Gl3AKQl7iYX0nNnkialE5Q6OuzTT+73UaMy7bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6537

On 05/07/2023 10:34 am, Jens Wiklander wrote:
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 15d9709a97d2..18171decdc66 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -795,6 +795,42 @@ fail:
>  
>  int arch_domain_teardown(struct domain *d)
>  {
> +    int ret = 0;
> +
> +    BUG_ON(!d->is_dying);
> +
> +    /* See domain_teardown() for an explanation of all of this magic. */
> +    switch ( d->teardown.arch_val )
> +    {
> +#define PROGRESS(x)                             \
> +        d->teardown.arch_val = PROG_ ## x;      \
> +        fallthrough;                            \
> +    case PROG_ ## x
> +
> +        enum {
> +            PROG_none,
> +            PROG_tee,
> +            PROG_done,
> +        };
> +
> +    case PROG_none:
> +        BUILD_BUG_ON(PROG_none != 0);
> +
> +    PROGRESS(tee):
> +        ret = tee_domain_teardown(d);
> +        if ( ret )
> +            return ret;
> +        break;

This unconditional break isn't correct.

The logic functions right now (because upon hitting return 0, you don't
re-enter this function), but will cease working when you add a new
PROG_*, or when the calling code gets more complicated.

> +
> +    PROGRESS(done):
> +        break;

This needs to be the only break in the switch statement, for it to
behave in the intended manner.

~Andrew

