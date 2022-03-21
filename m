Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3794E262E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 13:16:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292965.497565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGxj-0001OW-7E; Mon, 21 Mar 2022 12:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292965.497565; Mon, 21 Mar 2022 12:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGxj-0001MS-3o; Mon, 21 Mar 2022 12:16:39 +0000
Received: by outflank-mailman (input) for mailman id 292965;
 Mon, 21 Mar 2022 12:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWGxh-00018L-Kc
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 12:16:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0fcafea-a910-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 13:16:36 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-0pt6AOa3P6i1egGZJF2flQ-1; Mon, 21 Mar 2022 13:16:35 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4482.eurprd04.prod.outlook.com (2603:10a6:208:73::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 12:16:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 12:16:33 +0000
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
X-Inumbo-ID: c0fcafea-a910-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647864996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQkfecoMdgagqN1OtqFPPYZXVTztR/dVounJZiIfhJs=;
	b=m+ZJrjHREkBhcC2bniBApU9XTU9cs7yZw93wTXgB561oyxB+Bp5BOqXJshHg0I3/74/aLy
	7dqCdrrngtGuFhQjxm+jERIk7lrJ4uf0bCCCraEw4bOORs7qXmE2PiZRjscJp4vjRt1Jkb
	aWCzX4n3Fw5RCTVVBZOQR68j4z9Z+dk=
X-MC-Unique: 0pt6AOa3P6i1egGZJF2flQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVeBX9zMGn5PXHYVMUJDW56g/l3qvxTZi1F19M0vHI8iYwujXQU0yjMXuFK7TPYh1PEx5aqu4g5OLbT4tmVksIWIC4sKyTPJ07Hv95ks8k3gofoXTwY6srlN6/9h0V1JBowKQdiKAFQW6P9i4Go+r+1KLenld4acrjE46eeAsDCLw8004p0wW62Zue7nK7jjQrtMFJ/nG/nMBD3sbKkwKeHBSOkbRtxaiXH07msShMN8V/vx1ZiJC4y4gaCUNe8PeuZMDtcBn3pFlDWWkqdRhOetvL4YFY2xBSzTs8f2hfAOpgNZ4QMMmBWuUePq5lnTpib+sED2RzHLgeMXgAT1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQkfecoMdgagqN1OtqFPPYZXVTztR/dVounJZiIfhJs=;
 b=Ou6RKdHnUzoaBbQONnAjQR+HaFstQCLnCh10U+aNGJ9qiywHYpXHzwbFGQjcFRfcOTYEIpwoTJd+yHUZhKIuPoFMkvHi4aDPTdESy3VVTlCLZ9XQFj9Uz8YsPK4tYHFAGvpudwEk6WZBLeARFdRsAkkKfvN3cp/auSxAJQJCrAXT0uRl8ei+MG0djlldsM6MxzUzmR4gcZVW6DX9xh06WMJDSKSNteehadrFWAP78XkkiTsS1lGjE2/hFjitHyAdhhbFmvRixOhu4prOr5kViC6UXRKX38XTSgFtN5eOwX1wavRINiL5TTzuvWWWU+FN6y2Gl6jXyxhBtXenI3bb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca8f13e5-5e3e-e64f-2711-4730883a24fc@suse.com>
Date: Mon, 21 Mar 2022 13:16:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] x86/vmx: save guest non-register state in hvm_hw_cpu
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <e79bd13acfd73c105ee1399295c99cec153258c2.1647532323.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e79bd13acfd73c105ee1399295c99cec153258c2.1647532323.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0034.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7c41177-1bf5-4ffa-4e24-08da0b34a36d
X-MS-TrafficTypeDiagnostic: AM0PR04MB4482:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB44824A5D149CE59AFFC79937B3169@AM0PR04MB4482.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V8LNQgsVNqV3SKatgQneiWfO3/mlWAa7okU+Kq3bwJxH30T0zpHRxNvjY9F6+yQS8fkwtkGeYLHAH1PuYqfNrBUsvply/COBfE+7o2+P4IMkTiwiqNpNK3EhlvhWk9dqbzNDoiDfxZshMVHX/1NryPqXupd5LpGLADgmOXryfQ43gzuCGfn52NgRN7T2ci81XgcwuKsBp9SCludgrIOkezxMLFZVIyn7d5Ic/leRBUSzo15f7R6CgOvEKU4zuQ7z3yW4xhot6qFlYXtUtDpxHGs9EDcRXGzKssi9Uux+CCHscTMFtIfE51ZtkD3hrvkGhWvyYXqnMTeI9O+t63w/2AW3C4sfkFQ4wJY+yc4Om4YMRa/V9Z8oSUfW0HpwCweOzFLpdwQy9R33lyhvaZ5WQwKnSXIKBdZwvy11D8ZS6zhQZlbD/4FAHUrHOSuUw/pIR6xQmjCFIZb6VByyRDh/TUOgbuvR/76+QXTIDnmWBXgMTggyngj08CK3c4kn+f2ycCxBBQS1M6O4D5ggZ2xESGnMt31laJPiCb3OE9OwjR3y6qYAG1vfl/UzS/2jBsul2C5QeuiptvBdaBLgAuamNKwHkapPyR7tVovypJtbn6jsnTyaPF6UFddwDpdrrbeh+hw9e1FgfolKqNtnX2QDvt6mF/J4KrxoekKbeVPHJ4wF7flqE5eMyVoRUCFEEISB3wzXyUl8Fwt5lpp7Zzqr/NTEbU7lmSxfSRoD3nbJ2U4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8676002)(5660300002)(2616005)(86362001)(6916009)(316002)(83380400001)(54906003)(31686004)(36756003)(2906002)(53546011)(6506007)(6512007)(66946007)(66476007)(66556008)(6486002)(4326008)(26005)(186003)(8936002)(508600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWdxOGVlYkNLMUtrdFh6YXkzRlN4S1lXU1Q3RUZUd0x3QmJSZkI0QjhUZTIx?=
 =?utf-8?B?dTFlY2JadXJoYzRHUjJrWXJXdDhxV2NjSDY4QmM0Z2lQTjFSQWhXSFd1UndT?=
 =?utf-8?B?eWtEZldRNmxjZHlhaFFkUDZwbFNGOVg4d250a2FlZkwyc1VuU3NnYWtMRm91?=
 =?utf-8?B?N1B2Q0dTL01tSUZBQ0o3VmRlWkk1ZEhFUXlxVWF5THBWL1IvcWRWV3QrTkRB?=
 =?utf-8?B?MlQzdVBxSzdXc1ZMQmFONk4zajhOWHpnTWhubnBIV2hGamMrcjRVWWtpbTZO?=
 =?utf-8?B?UEtERTlubXVORDU2Nkp0UGFnL0JrbVRUZEtOVWJuV0xjZlU1TEJnSXRaMXNC?=
 =?utf-8?B?RldCVDFqQ2h6ZnQ0NXlJQmNRekFMTkxsVXBkcXM5b21JeTI3YmpnZlozZGVT?=
 =?utf-8?B?bDhGUkdSN2kwZ2V4WFpBV21rVHR1K2JNZTFZNU1GNEhSbUF3aWFwTUh6YVQ1?=
 =?utf-8?B?SDQ0YnNWWkRtOXRkNFNHdW14a0JkRTBhSE9LbjluUk1YSHZjcXoxbUhRNVRu?=
 =?utf-8?B?VHl6Ny9PSTc4T3dxNmNXRkFHUWxmbXB2L1NQSnJHLy9xSDR6WFhhekFjV05m?=
 =?utf-8?B?dFdwTkxWbElUVFVNOTR4cllCTGlKZUk3UDRIREgrSXVCUlpKUHg4NVJUczMw?=
 =?utf-8?B?aVNMLzRNN1lKMTJxZzBhQWNJK0kxODRiVTRML1NyNXE4aUVNWXBZT0hhSTd4?=
 =?utf-8?B?WEdyNGpqaE1HSTFiZjhMMzk4b2pLL3NUL3NmQ2FqNzdLZ0dKTlhIUkVCR1JP?=
 =?utf-8?B?N0lPa25zRFFaMEFzckwyVDlpVFhNd1F1WU1jem9NRXNGeFpLWFJYSWJmWlF5?=
 =?utf-8?B?WmtlM1ZQSkdmQlV3dDNqUDBkaEN1aEo5OXJuRzNUREs2c0pjWWxvUXNEQ2JN?=
 =?utf-8?B?RnFCNGFONDJPL2UxUXZTQnVNUDJxU1FkSUtBWW8xYkVrZEJxNWtqWithSW9j?=
 =?utf-8?B?d1lwVFIyTXFqVUZSN25xS3NqbGR2bnYrRDhsNDA3OHJpTmhycjB1K2hWaFdB?=
 =?utf-8?B?LzArOW51WnJYdFRNNGRhdzFaUTZ0VWNBLys2ZyszWU1nTkNNVGdvcy9qdDh0?=
 =?utf-8?B?Wlo1TCtWOUtlNXZublFQa1lCVGFQM2lOOHY3TFZROUcvNUhxK21yTlI4QkFK?=
 =?utf-8?B?Ym9vdzlmVGg0U3J0V0Z0WmVETU1aYzZRUzBRRjdkbElPdWZJT2hJTHo3Wm5R?=
 =?utf-8?B?TTlSamFoNHZqSmFkMWxMU2FJdkg1ck1rSXoxellMazlEbkR4c2EyL09RTGhO?=
 =?utf-8?B?QlAyU3RIQ0FHYS90Tmg0N1B1ZUpmdmxUa3JhSUdpOTNkR3Bac1gxeEpkbWs4?=
 =?utf-8?B?VSt6WXVjZ0hQVElKTjlVd2ZWOWlKT3MwaERDdWdiY2VtdTdGcWpuZGl1QmJo?=
 =?utf-8?B?Q2Jua2VIVCs4OW8zRXEzaXJPcFFmVUxQNDh0UDM0aW12alBZNzA4aW5tTXhH?=
 =?utf-8?B?VkJuanVvbGxMOHlwWFJ4ekpqcDFMOUxOR2l4cHFjWmJzYkRPTDZPWHJueVAx?=
 =?utf-8?B?b29mUWlpeWt5aHRvc1hpL3NIRjJRYXpJbEtkdG9hVXFKdmZIaXUvNkRSeDU4?=
 =?utf-8?B?bU9hbFhVQ09DemVIWklUUWRXTHpHZVhUM1NSNnZseHRnUVpmeExiSVRPcVlH?=
 =?utf-8?B?YUpzZnlpVklkUmlrNHpmMFNqTytpL09TRTBRWndyekZiRGYwYU80bmVUcnRa?=
 =?utf-8?B?a3AvR3BONnArNFViSnRGOUtrM3VLbDhaYisrU08yQmZ2aWtpVnphZGloRHBr?=
 =?utf-8?B?ZHJFdUNwbytROExsWjBqaGFwZkoyNXVqTUZmQ2J6QWpVc0d0bDZaYU9RN3k5?=
 =?utf-8?B?U3JGMVRGbEg4UU9nQmRlL1hkYTByZ0ZNc0lVb3llOFpIR3B5ZGM4QW92aEtP?=
 =?utf-8?B?YzdHU25XcVNnT0Y3SnVUYjBlMGthd1piaWY1a3dLTzJnT2ZkaVE0aDM0Rlk1?=
 =?utf-8?Q?G4laHeWU+yLT9ZMlsIa0iNF7ZWJO/du7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c41177-1bf5-4ffa-4e24-08da0b34a36d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 12:16:33.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kU5lIsSTHL3XFNdCTM7gvm1F0LSowQtfR09/EGuxyBgrxUrgs7faupST0hGmbfQPBeRANWnNM78ISspPur72nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4482

On 17.03.2022 16:57, Tamas K Lengyel wrote:
> During VM forking and resetting a failed vmentry has been observed due
> to the guest non-register state going out-of-sync with the guest register
> state. For example, a VM fork reset right after a STI instruction can trigger
> the failed entry. This is due to the guest non-register state not being saved
> from the parent VM, thus the reset operation only copies the register state.
> 
> Fix this by including the guest non-register state in hvm_hw_cpu so that when
> its copied from the parent VM the vCPU state remains in sync.
> 
> SVM is not currently wired-in as VM forking is VMX only and saving non-register
> state during normal save/restore/migration operation hasn't been needed.

Given that it was pointed out that e.g. STI- and MOV-SS-shadow aren't
VMX specific and also aren't impossible to hit with ordinary save /
restore / migrate, I'm not convinced of this argumentation. But of
course fixing VMX alone is better than nothing. However, ...

> @@ -166,6 +167,11 @@ struct hvm_hw_cpu {
>  #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
>      uint32_t flags;
>      uint32_t pad0;
> +
> +    /* non-register state */
> +    uint32_t activity_state;
> +    uint32_t interruptibility_state;
> +    uint64_t pending_dbg;
>  };

... these fields now represent vendor state in a supposedly vendor
independent structure. Besides my wish to see this represented in
field naming (thus at least making provisions for SVM to gain
similar support; perhaps easiest would be to include these in a
sub-structure with a field name of "vmx"), I wonder in how far cross-
vendor migration was taken into consideration. As long as the fields
are zero / ignored, things wouldn't be worse than before your
change, but I think it wants spelling out that the SVM counterpart(s)
may not be added by way of making a VMX/SVM union.

Jan


