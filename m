Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46CB401F60
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 20:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180163.326692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNIuz-0005Ek-NR; Mon, 06 Sep 2021 18:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180163.326692; Mon, 06 Sep 2021 18:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNIuz-0005Cx-K8; Mon, 06 Sep 2021 18:00:29 +0000
Received: by outflank-mailman (input) for mailman id 180163;
 Mon, 06 Sep 2021 18:00:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNIuy-0005Cr-5l
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 18:00:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 508fddc2-0f3c-11ec-b0b1-12813bfff9fa;
 Mon, 06 Sep 2021 18:00:27 +0000 (UTC)
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
X-Inumbo-ID: 508fddc2-0f3c-11ec-b0b1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630951227;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hVReezva1bSFHzc08+Zdr6xsT6LCHgeopJi15GjeCc8=;
  b=ORcYJxRG/gBeSSFTPSYlVhh6Y/rwgSqVK1IDAXDe6jdzt+Xe598DGJ5z
   1a6TBRqnHmhlwxuj4LgLWwszzuJT6NB/II3c5F1wPmKS1ZURIROz+ZS/5
   39RGD91Prjx3GkDLxN5uc8Idg6bsJEKIxiUVRjQOdQvU9mgc1YFoJ0aYO
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: X7eUQp6tuzQ90zkby4zuBFKbzv6oaSOv4wR0xGuSIdaM2RVYJGXuc+gMZSllMEhnhyKD/mTDCz
 pPo4VLTrZra7G7yeufcb0koKr3XalC57dshSmC71JXivZJJnG6ItRJHNgmqsTuir6l4R58Clim
 9cYtRC3dmlXtCvo0qHjU6PvqoLTomD4bl0lJGNdyKfOjNm73a9ab0GBfvVZorz7p5eIwwWEGO1
 7zHHW3h/cbYnaTh27qwNdScBDzPpnC/7zj9GKuWmRiwtt8OcYw9AZXNs+uOzBBAcKX2W2hmIhl
 989RUCyN48Mxee/xQTi1flVU
X-SBRS: 5.1
X-MesageID: 52115295
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8RiGzK18jX10sI76Q5oOxgqjBSVyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YHT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPj2CKZsQiDuRYjzrY3GeLzM2Z6bReq
 Dsg/av6wDQAkj+Oa+Adwc4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhQ8UPpZ3fSKNMB25ffv7ChPaHb3WLtB0B5vzke+C3FwU3pDhRHVa9up+pH
 z+OGkow1LaPXieUfGz4A==
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52115295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7TNtoxXe6LCg5dz499W2bhUflsE+gEht+DnQm6UbnptoOp9BbMqJP+R0BhFRu4vtAnB6CPDufjk1AKyApvXc045G52mSyIcBa1NdccHI4HRZSiUknEBRbeV9S9cQxjAvUpNZIyIImi+2mAF/VoeP+LkgfJ2OhhxsInYmyDhrbHEYk3fdeMZZr9AKQ93quoWdjnFygTAoYS3A4GkW2jUsorcHsI4MXDarW4oEum2LMXmeZm+daV+ipYTj7BYI1tI7Tby7Nc3iJ5e1dT/8ZYwmYd+90Oj1CT4VXGseHA0/vdc5yqGKEgrR9TN1wUzaSLuXXJDcmFAZoBCNQyawWVNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hVReezva1bSFHzc08+Zdr6xsT6LCHgeopJi15GjeCc8=;
 b=OhHy/CMhQl2QEGSdLSNbj57wevfGcKZBUbbZRr5Zlbdf/K/ExqgOPgA2c1ir5S43M4uJmxx7ahuTWeMYqJWiC24zLWpqptJJrFH4LBEMQlqKhSHCFKMgZRKzO32UZIvdPslobFygUAHEtZHzgJcu0JUABQKodLe8BNZGvMgvTUMUuG6SIO08SXwFXz5nd0PH1pYim2NKWMZz2CP1PAp5rqHFPZNZ12uQ3meq3+6DbejCavWFMtOAxKPc9sXlSWW/YeBdm1enE1/BxTARPBIat8IQP/GYLmL/MEcRAG4vhYjnGuGbq6E3FWAXCs0LLIIrxu+/NQijUuulIfGkKfEvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVReezva1bSFHzc08+Zdr6xsT6LCHgeopJi15GjeCc8=;
 b=BM6XOLAvBYZUfwHFbBN9+i8gCufwmmwL0znbbGmvOGK29eGjTuwVw62DUvJ4NuTBbc9sK7goAKtsFANuxFXZZ2Sd1r2OkC48xWdGZmWIko9Cb7d8fiWqNhHWbnSTrotn9K52nBe9YrnUoVjzU1icVSy0t+NKzJbOnOjUnF1MDa8=
Subject: Re: [PATCH v4 03/11] xsm: drop dubious xsm_op_t type
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-4-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <923afe88-ac02-77b8-06c5-480ddb2afe43@citrix.com>
Date: Mon, 6 Sep 2021 19:00:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79473da4-3a1c-419a-a61c-08d9716030b4
X-MS-TrafficTypeDiagnostic: BYAPR03MB4741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB47416A97F04DF9648788A62DBAD29@BYAPR03MB4741.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +7fZnZ/lN0p4q6mLzuc+LUICJI+wdXud8CWOQMptCNrXmVqWQiGOyjqGBrVGjttzmK46SjnmiSH0VPQYmSywbJt6FbRiYucpc8xKCEc0OZcKwVHaAFdwzfIM3DAfzknC1ekxJ+SVD6zuqafRtTKcUD0KDEWZieHEy4Ub5QFQWH6l5X3tR1kx/hdeHGFmFj8MuopYFi2zi//CswvGbJK4EWGdrh9kacuPkaMbANhUs5nvucwh+8THvQKL0+aGtz7cAXhyTAvtWBTcpmy9Ydsy52VIxSh6upFOlr6kP4PFKj8uMksnoxCice/ntzC6tonavoSU3RtmPtSQAOenHBg088nmJnTD/L1uOnUBWwtgszTxzV6oiIqqObz1cvXq2P8LwSjctmKg+dn5YQpI5GK6BwFYi6Fp7el+ktAaMSIssrh+VqX5v6NueKoO/eAUyJoYAF/mBXzk+GjFnmrEUHRx3m5uZ9+CBYvAoc6wNIWjkor9zRAbdRcpzv2RqKe5YUhOZjrmmHTG+pAsjvT8rGFbFZWBf+04rfIGWpRsA6QMHGIxqKeO51naZzlX0T0G9nH83ZcrLdZQxE7jDZF/tPH1g4N6ejaJ06jKqJY+sgU+hTYmYZKyPTJqXCFkU0Pd28rh9yCEoMxEZfWD0fnA919Vcy0SfdKYvf/Tr7SxyetEY+0JugNv6PuO9VOeOY1viDh0H4Uj7exo2LWXmxycDTXIZRn0K2PvBGGcdvuBD52pvPURRGAuQTOshKRP8gaIEmfL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(66476007)(66946007)(31686004)(66556008)(5660300002)(16576012)(8936002)(4744005)(2906002)(8676002)(316002)(26005)(2616005)(6486002)(36756003)(55236004)(186003)(53546011)(4326008)(6666004)(54906003)(86362001)(38100700002)(956004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi9reTE0SVJFL3BqM3BhTjNEc2FsMnZrVGdPL0g0VEFjWk91cDVBTHVQcUlC?=
 =?utf-8?B?SWJlcE1pYzJiSW1TMCs3dzl4SVprd09sdU5udktteDJwalpPUjJYbDZmdzVM?=
 =?utf-8?B?cGhuWm5VMU1OczRmUGZJc1B4UEdYTjdxa2lIVEUrb01QeU1DOWR2WC92MjF6?=
 =?utf-8?B?NHl5Uk1sa29yeGcrRzJsMmhIMVNsV3BuOU1TalF1ZmNUeFNHeS9YWTQ2WWVY?=
 =?utf-8?B?L3NITXZYd3ZHRGZEZkt6OWZCY0w0dDB5dllFUU9sMlZBWE9pcWZNdVAyd3Ft?=
 =?utf-8?B?QmxQOERKMVZpT1d3KzBuTG00UWpDaFBWT2M3cWI1TXk4RlZUM0pxcW5LYXZD?=
 =?utf-8?B?NnRaOTByY1NmbkVjK09GVk9zQzFrNk5OTms3K1g3U2pXMUxzQTdvNm5TdnVz?=
 =?utf-8?B?YlpDUGpJWWViVG4wSkRKZXkyL2RLV094Uk9RTkk0cmV3Zm1qak5qTDZJbUhT?=
 =?utf-8?B?QU1sN2plcTJNZkdMQWg2UXRRa0Jta28xZ01hVlNvcXBrS1JWQ2R5MjVIOGVh?=
 =?utf-8?B?Yk9qYTM5TVFFYWp4OXMxNytpQTIxVWZBdTFvVTNRdGdpZHhkb0NGQjR2NzRn?=
 =?utf-8?B?cy95em9PY2xuc21qbUcxTXFSVFlVeG9IRk9HeUYwZWl4Y05jTmZHblpkMm1H?=
 =?utf-8?B?ZjZhSDY5WUxhNXNvTkdqV3BwOG41dmVlbVJIVEJKT05TRnVhUWw2cWNUT1oy?=
 =?utf-8?B?QVJLQTNiVE9XNEFkYmpKQjh6cUpHUDNjd2FMcGpMaFlZR0sxaFh2b1ExTG5Y?=
 =?utf-8?B?cHZPb3VxVzNtb000dUdvaXdsWlRlTmFPVlZld1JHQU9KUGdJOUlYOUZBVU9S?=
 =?utf-8?B?a1RzdmcrUTBsNXp3TllWTVFJZU50RjlGU0pzS01uc0lBRjMrSXh0TzROU2dL?=
 =?utf-8?B?c2E2ODQvMStVWjBLRDVtTTRSVW00RUdGQlhTekllY2pjTnB1M0JOMnhaWTZ1?=
 =?utf-8?B?bTFVdDVONUVtd3hJdmxyTXgvUFlWWDVNV2VYVE5yKzlnaGR0Z2FRWHJENVZv?=
 =?utf-8?B?L2FBeng1a0xkM2V3UVdwNHpTVnlTMjQ3eVQxNWJUN05Ta2U2NFRHODZ0RHUw?=
 =?utf-8?B?Q1F0YVp2U0VXKzgxVkIxeFl4RDV3eWUwYTVQWVMvRFMyN3M2SHYvVFRad2Ur?=
 =?utf-8?B?d1AzYmRaeWlUejh3bnhpMUljK0xOZ0dNaXVnUWZXWnQwRnB3M2NJcUU4NXhu?=
 =?utf-8?B?ZXJSbW5jSnF3WlZiWCt6OEw4M1J1S0JsMlVRYUJKR1MzQWFENitRYXFLRlU5?=
 =?utf-8?B?NkIyVUx5amFjbi9JWTk1QUtQZTNwK1c0emNjckNCaGNua3J4cVpmM3lwZXUy?=
 =?utf-8?B?eHdRYkxsNzJaL3JoUTFNOEZReXhiVllKRk9ZWG1haWZWcFZ2MVdpY0VoSEdP?=
 =?utf-8?B?OXo3dkxNQ3Z6cCtnSk9iM0hIZVoyNHFCYXdxSFo3N3BjeUpXQW4yWEYxSUNm?=
 =?utf-8?B?bkY2M0NyUTI5VGtHL0RaSzZsS2Vvb0ZIMUpOK0wwQVhJdzM3Wlc0ejJyYW1a?=
 =?utf-8?B?Z284UGs1VWc5Nm5MU2xQUE9kZUZMMndrY05udDRJQnc4eXlKeFZLWUl1dGxI?=
 =?utf-8?B?cWZjVXRTeHNhcG1YYTF4eWRHeUgxZTdKVkR5Z1EwcUJkMUJGbUdpNkNsczlF?=
 =?utf-8?B?QVNlaFNDUndaWjlVVUNIbGh4MnlNOXF0bGw4WFR2bGpOWDJKNHFjbm9DTloy?=
 =?utf-8?B?VnYvQVdvU1JuOUdHOUhLdDlISlJ0bVJFUjZ2QWlYQnFNbVV1d1RkUHFabG80?=
 =?utf-8?Q?lcC3Y2+LjhJ84Sq1ANqwlDQSkAG7Vq+0EKtnTe0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79473da4-3a1c-419a-a61c-08d9716030b4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 18:00:19.9119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBRfsa+IvyMX7SZXZeIY51QvHrjigniW5TS27cgJp6ZCRx0ZRMiJRqnRD10scyjZML+iNYF2qVOVTVndOoLZ9xxItmdE4kV0psXmbbpmA6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4741
X-OriginatorOrg: citrix.com

On 03/09/2021 20:06, Daniel P. Smith wrote:
> The type xsm_op_t masks the use of void pointers. This commit drops the xsm_op_t type and
> replaces it and all its uses with an explicit void.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

HYPERCALL_xsm_op really ought to be renamed to reflect the reality that
it is "flask op" and we cannot possibly reuse it for other XSM modules,
but that can be added to the todo list.

