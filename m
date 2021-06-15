Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C9E3A86DD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 18:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142335.262655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltCG8-0000Dr-Bh; Tue, 15 Jun 2021 16:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142335.262655; Tue, 15 Jun 2021 16:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltCG8-0000Br-7H; Tue, 15 Jun 2021 16:49:52 +0000
Received: by outflank-mailman (input) for mailman id 142335;
 Tue, 15 Jun 2021 16:49:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6ws=LJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltCG6-0000BS-Px
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 16:49:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a5bff2f-dbd8-40bc-a7d5-1ff03c290516;
 Tue, 15 Jun 2021 16:49:49 +0000 (UTC)
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
X-Inumbo-ID: 4a5bff2f-dbd8-40bc-a7d5-1ff03c290516
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623775789;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d1iVAy6xdnaWv2tPO+fDTe4pChBoqWCdfeovOkk/snk=;
  b=AKZPwIQPTCad3LcknMqlLq2+VR8T32/lIs98zKFXLhTlyqt8z50KxFU0
   rFQrnh9gW8lVpbRqY3jITz70NKy74+HQuaythNg5F4IJ4xqUP2muwVIbg
   C1WWDrupZsOFflaylQgRuIVME1Viv4HJR3QHJSySvHd9lAmrPL1r6gSVq
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y/+kGFqlzsQoIarcprcwhK6zJ13kFKVAxRs3gVTavZZ1bGdIMgvLe4csR4ol0pZLVyrse7uycc
 gICOyQLl+jU14bEv4yGObea9PGpDyVZMXwRfkg2jc1Ye0sk65QFYSfGo5MQkmnbWdHGK7Tsi6+
 DSpWQoBm+UiuGb7TGTxKURyknX/nN1tSZcl3MN5devvfA62EGs2PIfGdyq3HicQdZy09wouqqE
 HvgNTTH3KZESWbgz3Fhyi3d3XrccrsgCInRQeWPibMIVPjX6vzm4A2wUHrrKJB814dVbKPmcTL
 n3A=
X-SBRS: 5.1
X-MesageID: 46254637
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zePY8q2jCcBrohKIOlPSoQqjBLYkLtp133Aq2lEZdPUCSL39qy
 nOppQmPHDP4wr5NEtLpTniAsi9qBHnmqKdurNhWItKNTOO0FdASrsO0WKI+VPd8kPFmtK0es
 1bAs9D4HGbNykZsS5aijPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46254637"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnNlTW1yCAPaR6MUy3JhrJDqkpwlWb1xd+I7XsEWj/iNahLB7O4ew/jtP9BKAmVgmhYX3kKYZsbWAyimAdv5MLew53Kslf3IzgAzYYU31fghhFevnF4Q8zJb2XPtFihNWxhyNEO0f73vyjvTDi7Zt7UlLk1OGOCq+UrCdAKXDy7rNiBKrz+EoXb5PGbrnXbHEuBcIeC+Q22mqMU7iPkUinit+LmgShzEe/pVa4WWdszcIeUr1FgKOK0GWEnqnhr/TqtbmLeE9aftc/wMHxowbMBCMRwQ05Z28seLoPau1qYpH8x+WXgpdpf3fDXt7OGo3W0hEsALdT4O8AFVAhGRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbLHhndlWfPbIjpZBwRZA39NCitsbsjUprrUh9jKPyI=;
 b=ld43lgm+mK8XCGxEyvfKJhE5zWg1D07+qddI4uj5StLHu3KHK10N6yr9yZ9Gqleoa2Jb5RwdpJ0168r+w92nGgzewJTX7xr6VLh8EzXMaawOKS5WMvkX54gV+gnrIURCcmanuERIp9OGnrYvogcBUiwHESj7qcg9JgK/V8CToyG4WsJqnRm2Iw4b9S+/C/E8GRjL1+xGCiZjlNFdVYNM95HTnvRScu10PklPW/T7BooR3Oun9IFDs0xJC3sEXgsquMri6r7dlc10ESNXjw7YTMdx5jHhLmtf2nSESAjoGGstUV7iI+DGSMAfcleBNZGUHt12ABORCTODGSI5jZooug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbLHhndlWfPbIjpZBwRZA39NCitsbsjUprrUh9jKPyI=;
 b=qpzXyAEbWZLB3iRL7cp2cC6K81KkhwFztgBtsg/zV8vTrHRqcTm8jcsOvjmmy5Ws+4temUoT5X+Cm4gq4rIMk57Fyx8mx0S8sfDs9+6rBPkidLNuyfUzsz06QMc84GEy0QFbc/181E3tsH254mJ8gH9MEWN1+ehMLwVOYstkT3s=
Subject: Re: [PATCH 3/5] tests/resource: Rework Makefile
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <20210615161905.9831-4-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0478f0b6-b811-c77a-afe6-b893bcb5c0d5@citrix.com>
Date: Tue, 15 Jun 2021 17:49:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210615161905.9831-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0454cd7-926e-4fb6-02ad-08d9301d9471
X-MS-TrafficTypeDiagnostic: BYAPR03MB3989:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39896BEAE1EDF1D2741CC890BA309@BYAPR03MB3989.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1isx2Wdu27Ri7pfOC3Ndhcip30YgG5teHPNC7H68UcKf5j27tPVwriLq2iEeaI0h9Yew99hADhgwtmJC6Zgu6L8C2yDWdPxFNiDdf4vCS/1ocPltVk2p6tHoL22WMlvLu79k55hmevUj17sYqXYqR34TX1FoFpeclPnShiNcZQAIE5ds7v2cxWhPavHUd4U9YscITHnxMIA5R54x6Nyg/Zh4o8y3MJa+PCGJz+unV7B0I9GPnlFQ3NfJl32G8hc8YnS4DWwSiPRuTF5RRRZgFEwKejXgY3koTHmklibfatFTJ2sEfWm76qnOH/rn4n36EbCE1IFa1vLO83qAOLfVBM4ZgmfG2pc2/QzaOvGmyfSCI0ycoCyGjufOSZL5iHaJJsDyNd1nG3ANDOlsFZkTUNPYfLVfRr+shDIrEsfG66NU+U5qG9ErHzPKopsFktIYFiNneHpc1ytYW27s+NKtKZmMZE00L190s+R050HN7iAJKXPbCZr+x2jPbNQISLsxkMLXugQUS9NGNgnSb/JdLDhyDZQZyWqYQc4fMxduml78x/uHpxX1PQdKUS7PlJ6gmXv55hIq67CIbEULxWizysga2XWrl3Pqtip0zA22U9Dia/IWVLtPhkoFWrXmfejx3nz1Or13K1Ie+pi5JKXvIoGrMbc1ncaYg1+jweRybhnse2zB4ScjXILIh1RthfzW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(2906002)(4326008)(38100700002)(478600001)(31686004)(6666004)(83380400001)(8936002)(6916009)(2616005)(54906003)(956004)(16576012)(5660300002)(186003)(6486002)(16526019)(31696002)(86362001)(36756003)(66946007)(66556008)(26005)(66476007)(53546011)(316002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2xtLzJtNzRxbEdkczRzR0ZWWTNqblRaaldSZ1cyczNlS2daNGFNMEtGZWsz?=
 =?utf-8?B?NkFPWDE5S0lPMUxEeW5xbXJDbGt6ZzZqTEo2ekVyMVhGYVRWRzhjY1ptKzEy?=
 =?utf-8?B?alZWcnBVaC9wNjBMbCszWUU2V25Nb3FrOHhSemo2NGVuNXA0Qmk0NEVSVENS?=
 =?utf-8?B?MFB3dmhTZjlWendtY1dGMUs3ZTI0MGVrT1hwcjhFd2E5ZzBaSjdCSEVHTFVU?=
 =?utf-8?B?a3Z4cXpSSGlxTTdjYVIxRDRzT1lIZU5XcEZVdGV1ZS9VeU5zZk5JbnpVOHVG?=
 =?utf-8?B?YTBxNTlzd1dIdEV1U3kxM09qSDVlS0VrVk9JVWI0bTJSdW1RRmppMjFYK0dV?=
 =?utf-8?B?ZGpHdFMrVDF6UEpvelAwUzNLTHUzQTB4WFhaMXFybXlVa2g0aW95Skt4Zjlj?=
 =?utf-8?B?a1F4d2x2MG5qRTgvU1h6UDFSWStrUHNMQWFRVUo1SXBha2hXMy9DNkZrbWdp?=
 =?utf-8?B?Q2kvaG43OXdOclZDZldReUZySURhYzNZcHJwUm1BSWluby8wZzZnWXNKUHo3?=
 =?utf-8?B?TVlqT0pXMloyeHVIVmFrVWl4eXFyRTZjejVDQ0dKVTFlMTBIMlVWNzJpQkpy?=
 =?utf-8?B?aUlCQkwrWGpaMGZNRjJ2MkxIejVlZ2s0RnYzM3dJeEZUMzBvSW1CeTIvb0pv?=
 =?utf-8?B?T1k5aG1UMlNLbVdQZndHRGkxblllN1lHeWw4UHUzbFI0cTMzS3ZsVFJGWktr?=
 =?utf-8?B?VUo1ZGhvaCtPRVQwaFp3ayt0NDFORlgvc2pkNTBRNCtLMERVekNuTlczcGgw?=
 =?utf-8?B?WGVOMkV1dXU0V25KQ2ZHRm90TVhveXZkVE4rYnZibXg4SEY0UVk0aXpndW5I?=
 =?utf-8?B?ejNjTEdMNGIrWWZ1QVUwRVI4VUpBUlRLY29OeWVkOVRjZlMvN0ZWclIwRzZn?=
 =?utf-8?B?MkcxRlJOV0hkNlJQcnZpaXdwS1cwZXNCOEtxVUpGLzBDOGRNdFBGM2dybGpK?=
 =?utf-8?B?dENneVZrMTEyWjFrZGtOVGxvREU0ZWd6TVlHOE5xQU51aXRBODl5NFowSFYw?=
 =?utf-8?B?Yi93aDIyc2dUY2JrdzlaazZpYTJZcHQ2dC9DSWY3d1RKNGVlSVdkc1p1Q3Ur?=
 =?utf-8?B?ekx6UFlxT0FlR2FBeTF0V0pLdVVUblZWZ2U3UW9ITXdqNjZrZkx5QjFPUGhp?=
 =?utf-8?B?aXRlN0RiMm1qTTRaQVBQNkdiSDE4RTdUTm5VUE1SZldoZmJqMlFnSkNlZWtp?=
 =?utf-8?B?YjI2Q2l5NEYvRkpIaHgzc1A0cm9mTzd3N1NKU0l6R2U5ajZWdFRQUDdUWExv?=
 =?utf-8?B?dU84VzdoTHpGbnRSMWhqb0dEVjUrNVVWZENQQlEvN3F2RlVMZzBGbitXUnVQ?=
 =?utf-8?B?YlZyd28wTzlZK2ZiNkVDbWF2VkpiQW1HNXFscHoxOHNFNXJ4Vjg4UmxtSzQy?=
 =?utf-8?B?dExCRGI0Q1JIQmxiYnFyRTRTSkszWlZVeENsWFBwTko4QkF3L3dEY2o3ZkVl?=
 =?utf-8?B?eVJxL2RXUjFqamhCaE9rTkgvTlRsbURTdFdzYXJIVzVsbTRjUHRsTVdvUVA0?=
 =?utf-8?B?eTRoV25UQXgzZ3AvSStkbjdJbWs2YWVZOExlVCs0L0IzNmhzTHA4N3l5aGFy?=
 =?utf-8?B?M1BvTWorcnl3MW5FRWUveUUrWXliRkpLOVNCdnFqV01xMm1Kd2hQclR5cGdj?=
 =?utf-8?B?bk5pWmJ4ZHQxaDhzS1A0Ni9WYkRkdXU3U2VuQkk3T3MxODFTc0xqbDN6Z1JK?=
 =?utf-8?B?NUcyalRmUCtSU3BsRnBOMyt2a3pLeWhuRHRiTUtCMmhUbHIreGZram5MUCsy?=
 =?utf-8?Q?qnZZjMZOheBlmKqPsmaDKYVxC7DQBN6mo2jqAI3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0454cd7-926e-4fb6-02ad-08d9301d9471
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 16:49:45.4283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yN1c99PjENDOG3h38o4hcHpjdef+gq5QJyKc9UbNisZLHQYMQf45oZQCIaAVD4CWsWJsKlS6+gcxROvdgZ5DANFgy7XFl3Nm4qvvhtirSRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3989
X-OriginatorOrg: citrix.com

On 15/06/2021 17:19, Andrew Cooper wrote:
> In particular, fill in the install/uninstall rules so this test can be
> packaged to be automated sensibly.
>
> Make all object files depend on the Makefile, and us $(TARGET) when
> appropriate.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> ---
>  tools/tests/resource/Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
> index da5e2a4f9b..b22eb6fc21 100644
> --- a/tools/tests/resource/Makefile
> +++ b/tools/tests/resource/Makefile
> @@ -16,9 +16,12 @@ distclean: clean
>  
>  .PHONY: install
>  install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> +	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
>  
>  .PHONY: uninstall
>  uninstall:
> +	$(RM) -f -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)

I've finally figured out where $(RM) comes from.  Its a GNU Make
default, and has ` -f` included.

I've altered this and later patches in the series to take this into account.

~Andrew

