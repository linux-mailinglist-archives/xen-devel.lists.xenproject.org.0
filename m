Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47D489591
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 10:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255250.437371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6rG4-0002wb-C1; Mon, 10 Jan 2022 09:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255250.437371; Mon, 10 Jan 2022 09:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6rG4-0002un-4C; Mon, 10 Jan 2022 09:46:32 +0000
Received: by outflank-mailman (input) for mailman id 255250;
 Mon, 10 Jan 2022 09:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6rG2-0002uh-57
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 09:46:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e7f7c0e-71fa-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 10:46:28 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-bWz2iLnbN0WWWsdFY68HMA-1; Mon, 10 Jan 2022 10:46:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 09:46:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 09:46:24 +0000
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
X-Inumbo-ID: 2e7f7c0e-71fa-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641807987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgXwhu07CnDAEXh/Zv3hpsftmmfGtNpclCZwbyVF8Jc=;
	b=kl0QL0EuB8wJxlcberki5TERb3achIAizaHqsEm9ibN0UKsCddHqlT/alN4gVo/bbzJKsi
	rKB6MUU1FmFxYI12mTWo501pt/QjqvlF2QE9IOD6vrnVbjqbwjjmEOQY+wvCy8IQ7vdg8L
	n6UZ66HgveAykZHqwq+64XA5ZgCGNR0=
X-MC-Unique: bWz2iLnbN0WWWsdFY68HMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpPROOWR5fJ4ZYZkA8PUvJr51rFBAPp0vCSoRuFPkHAloguiQDcsg9qJB9iOpzH6WlgJ6Uvv+KA0Rdub/m2xXr+sPCqbRlMRECbyE9B5NJx7t5OgulPMs4He9hbUUwrR0CMPMGN2n23cUAjUsLov+eekxs1MXuhuPh5YBk3st04r5ehx+Vqdy/wJ5LkyF87HDVM1lMXDHbcmcRcxbEh/rbZsySsNobzLs0Wb3Cu0GpXGLm6iaI5qL5elL9F6xb+tyfauP5wc60c3Rzy4UKPEHLDC3rzJ9dYscsn1hciFucnD57Vjzc2pNmUU2T4uQQHnKR/8Pmy0B+Cja8thSuRd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgXwhu07CnDAEXh/Zv3hpsftmmfGtNpclCZwbyVF8Jc=;
 b=EEjIgD48F+yOMtRXlz1Vy9uOl7dNqBC6xGyTlwfu1CsZCzs6Xn+QWk4l4xHWCahvzuSZzaP0afruFqfA9PwSbTADYZk26JMyELDH9lQGshftLbfqX/pHuxKSLjvWX7Z6LiJkZjGgd0NOOtB/AsSjLe6bH7M2KqvFn2nCPGJYUnBo3N2EQJo5DgVnyal5y83xKnXcqGpf3I8hsmFYg8cIv+f09ctREk8Tbhab/vt8YNsifhyCIlg2FBPbifh24gpP9gTViWa/3vbI1o/ZstdlBP33RQk1+WO1KHg5p5BDss+iqr9hweevvnF29YFTp5sq7p/p7xYqfneu0A3cslU+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3baac82-0eff-f885-f03a-ba987c8e12b6@suse.com>
Date: Mon, 10 Jan 2022 10:46:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, Bertrand.Marquis@arm.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220108004912.3820176-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6da0db27-2db8-4ca2-7064-08d9d41e10b6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54725386CFD72BD358B3AA36B3509@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BjR2p0M/d/0eOD6wnNiNvyIZ/AejSya0GyQcGBZEJthnk5MC0Zsv7V1URCpcsqVGIugvu0pkpNU08sWNiPAY/jY08AqZzAFdtUQeF93KYUYsT+Ze0ox6VotbtUMPl7syYVzoC5BnFlA48zPDmk4lHggOp0peZApajafnpwWGTyTdInCCQ1LIgxG/R2Cn0oE2iQ/HtnTMN00QgDGT/JZda0QCp+8Brplle6WNNa3hrS/VjhiQqcN1aGXsnJ0cA+ig1gMvgTYnM1rNzdMXlX8wWVfnFRsXTV4/dmBzogQboLouE+bFWHB6OmhzKqbuu3SAT+hSMDe052HYOyOH5zRJsR9JH0BPHui173IeKG9hJglIGu9tIwIf7CuH58/gwHAE/fU4djxHUbkH5RKrkKw4R+YJV9V0cwdzz2Fwl2Yy71oxTBaCD7ezFGNFy9I6oL1whYXlkeSn8DSDQV7t7VlrJhtqC/RCm9nCzkZHHTnpmmLzCKTneJd0dL76gGDnFZmYq0eZ91cF8/xl+ZyhotCp2jLl9lnU1vyHr60zG2t2sNcZyYLDp0FZafBhQFl1Wj7B3h7xpKznl3+k2eLoVVsvuuE1gFxzbsecV5oFJ4G8FeEroUbJLSKfK+5bb5/lagpXoj1BgEQ+ttA1aqrvDBFuSzRT63D2Xav6B8fpKEcuhimGQyOM8SBSbS+f6PrHDPksFagrEhojUhbIbABg5oryVWHo0tMC8LzmDi1rqFWC5R4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66476007)(26005)(186003)(7416002)(6506007)(53546011)(6512007)(83380400001)(6666004)(66946007)(66556008)(31686004)(86362001)(2906002)(6916009)(31696002)(316002)(4326008)(508600001)(36756003)(6486002)(8936002)(54906003)(8676002)(38100700002)(5660300002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1VCWFZrMkJ4Z2ZYaGxoeHE0alJmaUpBQWFDYVM1YmJOYW5iSXA1K0UvYW9B?=
 =?utf-8?B?REUzZnNUa2JQU0MvZjdaMndQd1d5V04xU0FRMGpiYWJxdUZWbFdlNE9xcFkv?=
 =?utf-8?B?QmpqZ0xJQ3dQdDBzTnQ5L1dta0tUUm1qMEgzdkhxOUYvc3FBQXRFcnZJdlRj?=
 =?utf-8?B?TU5KUktjSUhES2VGSEVJeWpEOWxWK09GZzVZK1I0Q2d0NzhYK0QvU0tYMTg3?=
 =?utf-8?B?RXBHMjlPR1ZDTVF1WUZpeEJOcFh2M1Y1OHQrWTBtdTdPNm1uTTV0N2tseFhK?=
 =?utf-8?B?SmJ2OU5wVG90SFlmUFRDVk5uY085SGIrV1p1dThwMHR6MUFmb2FvWG1BWVh5?=
 =?utf-8?B?ZWVuR1kzcmM2WkFsV1VFV0thSUt5blBzQmpTellGN0xWTE1VMGRXcjd1bWt6?=
 =?utf-8?B?VzRUWlBTd3ZvRmdEZFMwbFJ5cjk5T0F0dnk4bDdRNnVnMXhGS2ZqTWZOVkE2?=
 =?utf-8?B?OFlmZEEvWDczSmhCSVFUYjNDaGMyZi9teTVlLzJpVzlXK2FWY2ZheWNIazE0?=
 =?utf-8?B?aGtvSm80NmxUS2xLRVN2NktoTWI5RDlxU01uZU0vVHp5NmhUc2c0cDd5WmlL?=
 =?utf-8?B?K0R1Tm9YSXdMb0pGUjdLZW5hWVZDV1NGbXIrRDRtNlZENXY0STNydFp2UVdN?=
 =?utf-8?B?ZjNpWHJkN1VLZnlVTkYzbEVhOVM0UDJIZmFReEovR1Jnd21mWDFRa2ZabzZD?=
 =?utf-8?B?M3g0NU52YnNGVEJ3aHZaQ2dMTWZMZ253YUQwaDJBbVhpM0ZmaGprYWZoVXNY?=
 =?utf-8?B?WDI2bm0wQm1INWhweTRSYzh2L3BkUXVwelJLL1c5am5zVk9DT2FLL2hMUmJX?=
 =?utf-8?B?MUhUQ2VsRFdtVFhKYTR4QWVjVkxnOVBDK3hFNDlHNkZIbTJCSkJ0WWQyWk9n?=
 =?utf-8?B?R2wzMlRHdm0yU2Z6cGhWR1N4YkN5WWtaQWtLbFlnTXc3NFN5ZzlXMjRxeVlW?=
 =?utf-8?B?bGltRW8rMzJ2ODFTdzgxZHQ0OCtvcXA3aG1VMllqSnh1QnNJYzlRczFXV0ti?=
 =?utf-8?B?eVNXVmRIK0NadDhCaW5aTlBUcjYwek0yQlpTTWR5QmZON1FhSHVrbktiM0Iy?=
 =?utf-8?B?WUFWSzJadEpMdkJsUzRUWDJhaDIxdjRyOUhQL29QNnZ2SGwwWUtKd3F1Ylcr?=
 =?utf-8?B?WUdUbHIxcTBjc3YxenhkdW9ObGxSajgvRlI5aVpaMU1SMXozeHV2QWIyQVJW?=
 =?utf-8?B?bWNCTkhYQTQ0enMzZ29BUlRCZGtUNUJEVmRvalhiMDY2MTBMOExQMEpEVmFM?=
 =?utf-8?B?b0tsTDNuTEIwSjAwRk5nYTh0RjE3YzR1ck9ocThKRGNZM201R0lmSWp0UnpC?=
 =?utf-8?B?OHppQzVhOE4xSzFHU2JuLzh4d3AzUnJqWjNjNTB2Zk5pcVJFekIrUVRzWTZa?=
 =?utf-8?B?YkxMMmxtYjZFTE9xblhUUHJ2UXpOb1hzZ0pqdTlRQ1J2QzJrd3U0QjVLYnFr?=
 =?utf-8?B?VklXMDFialA3dE5yTXhPelp0eUVaQytocGcvTzZ0YXpGUW4zSEtnZVBCcWtj?=
 =?utf-8?B?SHBZU2pRS3I4K2FBdytMdUdSc21sTTk1aTVzbWhnUnRhUE5salNLZzZYMmg1?=
 =?utf-8?B?WmNXZUJTem9lWjdMS2V5OVdFUDNjMHE3TjdCcEdEK0J1bHRpVHZodHBGQVp1?=
 =?utf-8?B?Z0RwREJkSGFKdEZsL2ljOHJOMGRQQWdzNnJTN3lMZDlSVnRkNWhKeWY5Vkh2?=
 =?utf-8?B?MSt5a3kyWmlHMTEvOHFsblFzZDJpUTI5ZEhKRFpKZnVvZS9Ubjh2L1ZsQmRE?=
 =?utf-8?B?ZFYzb3plRTVvNittV2o5a3ZzOVd0aWUzZnUyamdIZHBQVE5Sb2FDbzArVnZu?=
 =?utf-8?B?WG94RWNUbUJGS0R6eFFzWHlTa1c2QU5IU1BpejRLbU0xbGJjeTdRUzlZZnZw?=
 =?utf-8?B?bW9BUDhHN0c4V25XQzhScEVnMllYTWIvQnMrK0NWMFp6c2lDMmRMVk1CREVw?=
 =?utf-8?B?M3ROL21SRndHYUlHZ1o2ejB5WG1CeE5SZVZ5VVRFT3h6RVhZQVpVYkc3U2hN?=
 =?utf-8?B?cXY2cnIvTFFhb2hONDNLYmtINXJ5QVlWSUtnTk9YYTdrVmtlMFNZc081K2RJ?=
 =?utf-8?B?MEpQVGExOUp0SUFHMmp3dkRyMkNYTU56ak1ja1dTcGs2Q2RQb0pSNW1PYVpG?=
 =?utf-8?B?MlB5cytZemt4b0dHenkxYithUkJsME9hYkpLNVpTN0o2MnhlelVVazJvMGI0?=
 =?utf-8?Q?I/KR8t4BJv5YngUF6bhynm4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da0db27-2db8-4ca2-7064-08d9d41e10b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 09:46:24.5394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDC/egeC+O8kCqpqy4e7DQnq8q6Z6yogZ9PSkOspZLMCXz876LjonCa/rk4ZuseOvOYXv5DpxQib/Rep5v123w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 08.01.2022 01:49, Stefano Stabellini wrote:
> Introduce a new feature flag to signal that xenstore will not be
> immediately available at boot time. Instead, xenstore will become
> available later, and a notification of xenstore readiness will be
> signalled to the guest using the xenstore event channel.

In addition to what Julien has said, I'd like to point out that Linux'es
xenbus driver already has means to deal with xenstored not being around
right away (perhaps because of living in a stubdom which starts in
parallel). I therefore wonder whether what you want can't be achieved
entirely inside that driver, without any new feature flag.

Jan


