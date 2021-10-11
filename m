Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B29428D34
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 14:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205949.361386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZuad-0008Jo-EM; Mon, 11 Oct 2021 12:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205949.361386; Mon, 11 Oct 2021 12:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZuad-0008HO-Au; Mon, 11 Oct 2021 12:39:35 +0000
Received: by outflank-mailman (input) for mailman id 205949;
 Mon, 11 Oct 2021 12:39:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZuab-0008HE-W8
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 12:39:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 485ef178-2a90-11ec-80d8-12813bfff9fa;
 Mon, 11 Oct 2021 12:39:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-KpusYZ9MNa608_1NVqIxBw-1; Mon, 11 Oct 2021 14:39:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 12:39:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:39:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0402.eurprd06.prod.outlook.com (2603:10a6:20b:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 12:39:28 +0000
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
X-Inumbo-ID: 485ef178-2a90-11ec-80d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633955971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1HE2dfvuc9CnkzlTDnzsaV1VIoHjmm/8odqNlvgVSA=;
	b=iVfidurT6SvHT+z32Sw8WS1tFB94ItTYWcSAuMlh1f92qKf673gSBeAWWBC2ECQUIRqAPr
	D0P1enbjybj2ifn8Hi3u1/3Hv6H05NREkx6bL+lusrvLodG7OOWwMt9F9Cob3CwfJdjoCS
	IaUIPkmUkIAnSEYe+T/nGENDvtj0k+c=
X-MC-Unique: KpusYZ9MNa608_1NVqIxBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edBC4DTLqXIkjam25ZFRKbElzIIVHmfJ9ltTRUcVWfXzKIpFWVUA9xnPUNbrcSTcFNLwf8OdbiO1PqvV/fduH57kg9X/Qov5G6bjSweYi+kIpfFWeHi0zFPMm24Oa7oUOKoBHijP5mY7dqsT+zGR8hapnfRz5ZT7OwZEBUMjzK8Cfl8MhKrXNVAcWrsOYr1G0tF9oLbiEpF/HSGSfBlFe70P0/u+ObtMYJzTgyIm8t29dsiSbnSv85D/E/xVmkHNWVXAnsyfofpLUoK9RIg+dCUu19JK/oztRKqv9Y4yD6xzcmJskeJS6JaSxBP84ANrXFGSpgnDcJj4PXxP3ipRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1HE2dfvuc9CnkzlTDnzsaV1VIoHjmm/8odqNlvgVSA=;
 b=A6503ZaQCsBYMF6+8zlcQVwoeJGOAWIrq4JFQtzkeuDNsxaBhxDwFGKvDLkgAPWfB8jfjcfLD/gERdN13BPub9kPplp+iKUNocwEdbuUeS+ab/pFcxrurzxLos7NJGO4a0Pj091qMqeekho8m/IlSVh07am7Nj+rFVHWbO7IxIvH+o/tans/zWwOhcodBGpFdOpgjI/BQI0BAuWjkls+ovUAVJYMulWNsm5rE5LV14KNZ2CponId4N7dxe+zZS/vIpC4D61SkLf2OTPrVicIrIa/jhWBgydW+buQ0G1LAvUqFVHn878EDg27Abk2F/J+dmbC31UADbPS+7yiGfiSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 24/51] build: prepare to always invoke $(MAKE) from
 xen/, use $(obj)
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-25-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <430f6b64-e255-1250-1afb-a596a57ed1a9@suse.com>
Date: Mon, 11 Oct 2021 14:39:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-25-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0402.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3e3f039-cef3-421c-8c1e-08d98cb42ae4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087940E5A36C646FC6701C4B3B59@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D74YEXgGbRZ6/xHCQo2SFUEW8VoOeCIlbLyb3/b1A/9/KJBT1OlHnUmkbCpdpuO5CtxrU1bEaeJBZf68GPev1rLQDfDRPLDOd49ISgFcyb8ql5cgk/N7Dj5lEaqXBZftzwP2GAj2fJeai4jv3SQ9gv0JzofBAmHlRhQOTYWE/9axuMGgaGbd7EY8rGWhC/haKuP3+0SWVawAI2LsVOgJDA7ZfCUboBiopZBR6+CggHZqbgJt2bR3CRbK+Fa0dTkq7GGTT+oIkM1PAKcVgQ6V7mMEjq4ec5CzkLM7KRyIZSpTK36MVTGuLyVdAaQCdlCUtZQ9buu8yvLp7lNsmwdoFsDOSzpMRvBqArc4uznt5bp2O4s+L7USHvpA4DUjogvLu57w7cKZdkOCKqEczkR0rPSscuEudykkr2a/ArCGSwKYOnuajLbFXVA6KURHHU36RCtbYypck8oUaLi3t183ngMwpqB4vTHXru15UDFwjTp2VXS+5AgVT1sYx+KTrEFPf0pldYo6qbLsLPAyCiUbnikyXs2ORwYFG2Gzkp848q1F3XwcHuLPSJKn7Fzoju/2VjoXZyzvlvaZEkEnqLYoetGO7meeKUOW2IeK9tnNSYb162g/O3KItB2XpNVlgg/N3KF+sVIE0uluKM8JZil3jvPDNZGF42e3BfUzeDHnFIh/ae6d9ek1aliTZP8SvJ53bg8LEzSfh/yQMncWUph3Y7LecG1NMVyjJJvLGQMhmPAC8Eec9IgBZavM8UqCJvUK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(8676002)(53546011)(4326008)(5660300002)(31686004)(6486002)(36756003)(26005)(86362001)(186003)(316002)(16576012)(38100700002)(31696002)(7416002)(6916009)(66556008)(66476007)(956004)(2616005)(66946007)(54906003)(2906002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VktSMVBHenJwTXdkU0dXdHdzU3RteVZnL21zbUYzdjNJbnQxckVwWFNSWUVH?=
 =?utf-8?B?K0QrNS9sdDZGeEZ4bW9wem5CalBUUzB0ZHlZdyt0NktMNFRmektpYXNSbkZt?=
 =?utf-8?B?amJMVXFsUXppT1BLZE9jVGFsWVh6c00vU0wydlAxTnZnZkdnZzFRS09Ka0F1?=
 =?utf-8?B?MGhNajlqeU5vczlISXI5Zld0NllaTmdJRDV0MFp2U2ZKVGNFU0U0ZndrV0t3?=
 =?utf-8?B?K3VFWTI1S3BHdko0TnIwcTUzMTd4eUloVitleWlaZVJwUS9UUktlT1BUZUc4?=
 =?utf-8?B?cDZReUE3MytiK3hqU0VxeFk2SW9jZW9vNXEwcWdTSk84RXowVE5xbmZzbXhs?=
 =?utf-8?B?YVZwSldsYVoxUVVrSjdXL0NNOWFENVd4ZVZNQ2tKTGJtcmdoRDdaSmNPZnRu?=
 =?utf-8?B?MW5YdWxRSFZDY0p1NzREK3ZhN3pBR0VEcEFTUkdSNTlEaWJzZkRaSDlUZGFN?=
 =?utf-8?B?aHZHVEd1YVVWbFJzQVBIUElsc3BYTVVRYnZEOFk2cTI1Umx1dUdWUGlYTEdV?=
 =?utf-8?B?U1hrcUpxSGkwZnBaMVgydjZYL1FjNityTmFRKzhBZEFrYkRjL2t5d2FtZEMv?=
 =?utf-8?B?VTN1djdHUm16VDdFR1A2UnhpcHhqSUMyRUwxbWtXZ2JnL05EWktMcEZ0ZVFp?=
 =?utf-8?B?dStEeGxlSEh2eGRwM25KcnV2b1FYMTQyOUlaVHB4UzZGYitYbzZtbUZseWRu?=
 =?utf-8?B?VktoNVc1cnQ5ODJsNGxBeUxpU0dmVUMwL284djgxaVFwUGZhY0F4TWk5dklU?=
 =?utf-8?B?U2FRM242UzhjdHpwa1ZuRXpodVIxa2xlMkRIZWU4T0VYeUF6K0lsTkhtak5i?=
 =?utf-8?B?NjdLN1NublZqQ2pIRlJDM2p5cVZvQ0p2N0lyOGg1L04wS0dpTkdoSUNpSEpp?=
 =?utf-8?B?bVRNVWdwcllSdThtVXhvNmdXSVc2Qkt4U1JER25CUzFjMER5N0NFZTlEMVNN?=
 =?utf-8?B?aytlU2JzelMyZkZxZXlxSUJ3L3RISnEyQXllb3lSNFNOb04xV0FEVUd1Ykdy?=
 =?utf-8?B?cUhmZ1A5WU1XcHZhQXBMMGE0K0sveXpCc1hGdTlyUzkwb3hpUHVBYms0ZEFo?=
 =?utf-8?B?SXdWRERWKzdIUXdHVEd4OE80Vlk3K2JHdExpdWJ0VWxHcnhZYzJCdFBTY2l4?=
 =?utf-8?B?SGhuNG5ORjF4cUMrOTdLT2hzRXRGRzhjSmhVbUk5ZjFKdHVNTEdBak9zMUZ2?=
 =?utf-8?B?VTRoTzJmakd0YU8rVkxvTnlSeCtGRGNiYi9hakIrcWRGYS9KUzk3QVdGSFV0?=
 =?utf-8?B?VndKSHJJR2tkNjlJc0tPUDJWWENYRWFUblN6WkdObXVMVFlJc3l3NTFhNXlC?=
 =?utf-8?B?QXF1SU5kZFNMQk1wTlhyd0pkNnpVV0toeDI1WlhJcVp5b2RiT3F5UzhtckpQ?=
 =?utf-8?B?WWhSS1hmbHFJQkp5Ulo0b3NmTW9IMFo1NnpCSy9xZlQ3dkpuSTJSeUJmS003?=
 =?utf-8?B?VnhMb0dlZm1NUkNxQlEwc1d3UlVjMWRsQTI5SmppYU90SUNwOFVUVWVLR0ZZ?=
 =?utf-8?B?NE5kblp4U1ZzWDVna2N0WThYbGxyY25acWorOThvMjlJOWZ4NktqVktsczVo?=
 =?utf-8?B?VGl1V2NMS1ZhVkR0R1ZqZnEwQXFYSUVuVzB1QWpMYXpNWHcwRkJBRlo1Qys4?=
 =?utf-8?B?eVNkSXJhYTZBQ0VvNkdVaWJ5MFJOSlFTUGFlNjdpVGJVRTBSdHExY0hJckFD?=
 =?utf-8?B?bnVaak5hZFcwZG9TNGVpLzZDaFlZU2pBSjc2bjBlc1hHUGR1NHJJcU1jU002?=
 =?utf-8?Q?eCQI+5mGQLtpaK7mfoTMO0ug7c6F/ragcYoVLsC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e3f039-cef3-421c-8c1e-08d98cb42ae4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:39:29.2668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOrLABIs63/biHMQ0pLIl/S58Sq1nb41+Qw+1d+Ra8wFSgbyzRK8NVB+wnspx9j8mSxAOXj58pPHD3JeGLAerw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 24.08.2021 12:50, Anthony PERARD wrote:
> In a future patch, when building a subdirectory, we will set
> "obj=$subdir" rather than change directory.
> 
> Before that, we add "$(obj)" and "$(src)" in as many places as
> possible where we will need to know which subdirectory is been built.
> "$(obj)" is for files been generated during the build, and "$(src)" is
> for files present in the source tree.
> 
> For now, we set both to "." in Rules.mk and Makefile.clean.
> 
> A few places don't tolerate the addition of "./", this is because make
> remove the leading "./" in targets and dependencies in rules, so these
> will be change later.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless a couple of remarks:

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
>[...]
> @@ -192,25 +192,25 @@ note_file_option ?= $(note_file)
>  
>  ifeq ($(XEN_BUILD_PE),y)
>  extra-y += efi.lds

What about this? Does this for some reason also fall into the "cannot
be converted yet" group?

> @@ -222,14 +222,14 @@ $(TARGET).efi: FORCE
>  endif
>  
>  # These should already have been rebuilt when building the prerequisite of "prelink.o"
> -efi/buildid.o efi/relocs-dummy.o: ;
> +$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
>  
>  .PHONY: include
>  include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
>  
> -asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
> +$(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
>  
> -$(BASEDIR)/arch/x86/include/asm/asm-macros.h: asm-macros.i Makefile
> +$(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile

Isn't this $(obj)/include/asm/asm-macros.h ? And in general doesn't
use of $(BASEDIR) need to go away then, e.g. ...

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,8 +1,8 @@
>  obj-bin-y += head.o
>  
> -DEFS_H_DEPS = defs.h $(BASEDIR)/include/xen/stdbool.h
> +DEFS_H_DEPS = $(src)/defs.h $(BASEDIR)/include/xen/stdbool.h

... here needing to become $(src)/../../../include/xen/stdbool.h ?

> --- a/xen/scripts/Makefile.clean
> +++ b/xen/scripts/Makefile.clean
> @@ -3,11 +3,14 @@
>  # Cleaning up
>  # ==========================================================================
>  
> +obj := .
> +src := $(obj)

This repeats what is also getting added to Rules.mk. To prevent
the two going out of sync, wouldn't they better live in a central
place (e.g. scripts/defs.mk)?

Jan


