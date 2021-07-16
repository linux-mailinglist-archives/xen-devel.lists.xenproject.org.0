Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06113CB35B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 09:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157069.289898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IQC-0002OF-WB; Fri, 16 Jul 2021 07:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157069.289898; Fri, 16 Jul 2021 07:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IQC-0002Kn-SV; Fri, 16 Jul 2021 07:38:08 +0000
Received: by outflank-mailman (input) for mailman id 157069;
 Fri, 16 Jul 2021 07:38:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4IQB-0002Kh-23
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 07:38:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1f8efc4-e608-11eb-8950-12813bfff9fa;
 Fri, 16 Jul 2021 07:38:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-mpya36VCPSChMBwTrf2SfA-1; Fri, 16 Jul 2021 09:38:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 07:38:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 07:38:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0287.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 07:38:00 +0000
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
X-Inumbo-ID: c1f8efc4-e608-11eb-8950-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626421085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4Lra1NQSNlxKXfen2jIx+E+ykyuj4A1BD+bmvFbKd0=;
	b=C8LiPATp9AIoSVRNoYH6JpQCtOPK7zQa51ed5eRWxfcCvQ/CGg5Rbsps3WqBun4w6BnFbY
	c3CtxSHZAjtQdzSxaQ11hylDqj/J7wjRGfZ9bo/+FhVG9zDCqOchsT1zOQ+7KR1rStvwTy
	Eq/IBZFZdgt0zU8DFFUNSBWSy06R514=
X-MC-Unique: mpya36VCPSChMBwTrf2SfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaYnx0pI5gv1R7YMcDWTX8Wfg1UR5qt0ImVW1j5SBwz0pUoZl3D6kifz+lu/wPrB2EIJD5Tt5J49bRqoXTCnej/ZWpaXgGt4TlP77Juer8ysjs/xGCn6N5fe7Rou57Qm+ZK91PPt+FFiTmPI2i/pxm2DcgsM7DsBmr+f7hwoAY0VXg4LyvFfZ5h/70j0yFCLu3ADgekB9k28d4WUuBV84emHF8SpB/wiFdtVUeFBvj7hyGRcDcpe3m27exZExqw1CmjVnaH/8EEV+YjGy8QxqUYuYh4k0WTgZC4rRL4UUzPY6L4gg17vjYmgcb6G70frCwARpRykPkKjl6MHyWD8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4Lra1NQSNlxKXfen2jIx+E+ykyuj4A1BD+bmvFbKd0=;
 b=QuTi6MFCAfLXHAagseqTaxKnL3EWcshiKF+SfF7o7grfATO20+o2WnmI3GTbfOfE+oGIgaiCbW0LSmCPIES3z76LWRQDOw1v9C6Xda9DE/5JeoFJKvyTMhmFJQKISmDgocSdb2H1uecaNnPqreOLrU9WycWYi0Amn9/SAdLYGytO2EORlLuBI4C5LNYODUFTdzgtmVbRKT0iPGw2v4pAKoXWyW0NinxMABqblGJfakaonUOAJn3NwqRZKluO9UIoUwbgeCqcfWI8SgF8Ew0l8l/5Ya38f0UUFAawvNaOdJAllo+JxJUi8B48rkc3A+zrbz1Ugcrxv4dqe+vEZfMtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 08/10] xsm: remove xsm_default_t from hook definitions
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-9-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e60f1490-436c-8e2f-7c9c-99fa7a1bfc31@suse.com>
Date: Fri, 16 Jul 2021 09:37:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712203233.20289-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0287.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f8f62a3-4db1-4338-ebfd-08d9482ca3fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715040DF5C33569841BB24A3B3119@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U+jDkmXQrFgA2KP1S0cHg6KtebIV0Go8MzjIWGjplYhKc87gFDg1wWVQyLHEjNmy/Elz5r5IWxND49GECGZLoztO2NLmZHN1dconadcgmpL6tpLluzPXjmxGN7cKCv0/A1O/BuBqG9Gp0t7tOcuuXkitFPiq7v6oEj6ev6+RgCWxcHBFchwVU3lxfi+uQDVIAa/VBO4+NSNudIPx3ZJ2eUh4UArRi06yJeluoJ7JjvcU0cnpBVfdp1i8nwI7YYEh3UA6X1e+Dqq8nQuC3WP9n1Z1iiq2qYDBPTiK4ZM6QW7vNJ8UfLnSm4GjlyP3Akf1ldyBv17cT6xBBLOhWIadisMt/08mMklVshmOO4R19Yn9nz41GSJJgrY7O0IrYEqA0fLhTd9jEq7U7HQ4EVGZ6y6ZXGtvfvEVv96obEqktOZArSL9dgVJOKnTiD6Gor6fMRfemaws1+XAPmwSC11nmBV5Gs0Dx/3+SeLs227Gpqn8Gpgl8A2tHKXc8/UhOfe+NmJrx+THXb8KxpJPag2FPqmJy6cshSUy+Bi9SkgFrJvCIVUZyM5eys8cCBzPxwqr7MWphzWl4K5uw0ZU822b+Hp/RLBjYeRaEdUelRTCTInXD3sSNyuS1ZaqwkI/Ar9bjCesrTlhXAGycbF7QN5AaNIyqz7qRFktXu1RmgQun92ELy0/NU5UYg/Q1u182X52a3UumQk69HtFTioZeS2VJxfRc7f7Opu3ikCCWlzo+1I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(2616005)(6486002)(956004)(54906003)(38100700002)(8936002)(16576012)(316002)(2906002)(8676002)(478600001)(31686004)(36756003)(186003)(86362001)(83380400001)(26005)(66946007)(66476007)(53546011)(66556008)(5660300002)(31696002)(4326008)(4744005)(7416002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmtCWmNXK1hCTHA4VklPUmxvamcyTnVYVFFPSnBqSzJVcDNyaFVVNWZqdER6?=
 =?utf-8?B?clRtbTZoTE5ObXJRSHRXR0FVdkMwNERzSjdBam0wdXNaSEdGdFhicnBZaUF3?=
 =?utf-8?B?ZE1vNjlmaGdLL3ZXTDFvWGt3aHQwdDBJSE5sVWFNUXkwanpEbk9WNzVVU1RS?=
 =?utf-8?B?R0M4T011ZHIzY3ZzN1FvdGprOEVyaDdiKzg2T3ppRnN6cDM3VzNqa0xEVHZV?=
 =?utf-8?B?L2JpcnNLamh4REtudjl2UWZWdThSdkFoVXF0V21uUk1FV0FDZkFUb1p5cTJG?=
 =?utf-8?B?NVcwYVlCQ0lmdnVDN0NvVVliR1puV3J3OWRBaGx0ODJYSVdDNzBoTXlNeU1m?=
 =?utf-8?B?ZkJsNWljbGZPUG41bTUyUmJ2TEFrM0k2MHZ2NkhsVlNTVUgwVS81UjViU3M2?=
 =?utf-8?B?WDFqZ2VKRW5MQWxjanJIWEVjdGQycW1PazQzS1VRa2t0T2NObXM0eFdLWG5L?=
 =?utf-8?B?NVJyaHdTejNUTW45b0tzNlE1M093NnVxN2NqaUlXQWNJM1NSR0E2eWFXV0ZR?=
 =?utf-8?B?OUpOM1dIODhrTnFvaHJablRxaHhqVDlNZ0krTDRyV2cvQzlBcVQxdk52YXg2?=
 =?utf-8?B?em1Uc2RTRzh0bmFxY0VyZ2JMdlA3S0wyMjdFekhCM0dCaEF4bWtVSXIwNUxZ?=
 =?utf-8?B?eHJweEJsQVJSL2FyZ290V3FYMHV3M0RvU1RVTkZuQ2x5cGJORVdXaUxabVZz?=
 =?utf-8?B?Tk1vNVl3emFQQjhJOENyWGdRZVp0UHJGRHcyUFlaWkczMlVDUytyeTFvMGRQ?=
 =?utf-8?B?UnI5NW9sampvSEZIU2xWWWlVemhISnJRMzZYeThJcWpZNDRzYU94TXdtTXcz?=
 =?utf-8?B?YTBMMDlBbTdlcVhTWEo0QUdhTnhKdWIyS3NmN0xIV2U3RVd0dVc3aFVtVFZQ?=
 =?utf-8?B?K3NIWnliUWpnRmZnNUdJSDFka3VaYnNTUllJcUVyQnFYR00rWndHVUtZSk9u?=
 =?utf-8?B?OWtybVhpVUdNOXFyNTJZMzBlY0NxVkErVGpnd21qRWNqVThZNTZIclFPNWxn?=
 =?utf-8?B?TFg2ZEIvRnB5cHRNVDhUOVJobE0vRWl5dXJ5aEdHd0FtSnRxVU8wMEp5Zldo?=
 =?utf-8?B?WktnSldMV00ybUJWQzRsbGdncVVKbWVXbWV6dzNtN09mZUNhSEVSaDJhdkFY?=
 =?utf-8?B?UWhqSHF1Tnp0TzJwM2F1TzFPdGVxaHpMYStYR0M2QTRtaW8vczNDMWJoR0Ru?=
 =?utf-8?B?ZVp0SkYrZUJKYXdPQ3U3RTVGL1RkTmlYTnJ5czE1ZVRKb3dNQW11TEVZR08z?=
 =?utf-8?B?YkxwODVZZFlqYTRvNERncmZ5aHNzVlUxSEU2SU5acG5ndkdtSjVRdWFTSmR2?=
 =?utf-8?B?QTVpWGJ5cGsvVnNjM0pCSHR0SnBPcEhia0FsVDc2REJRU0RSNDdJTnpnOXc2?=
 =?utf-8?B?RGlMVkc4VU1yenJvU2V5eUZDTFEzWUFGNFBJTEMzRERYRGFSNFhOcXA4OUJQ?=
 =?utf-8?B?djJmWm1MRUJTSE9CR3B4R25aQVR1MlN5QXQ0Yk1yM25qYlN5WUlFTlZ5MCtt?=
 =?utf-8?B?aVh4UUZ5dnZiSHF1MVNraGpSanZZUnN6OFVmOHRGWHlPdFRKZTN3SlpsT1Bo?=
 =?utf-8?B?aGFvOXFUamhReUJISWE0M0ltdmlqR2dLTVRNdWdveUdhZGd3VllaaEd2UlJl?=
 =?utf-8?B?akVVSktKTEdXQnUwaDdTWDVNWWtaMFFmN2JBZHI1bWV1cCtweURpUVhDekQv?=
 =?utf-8?B?L0Q0aHZWTVJwUEVmblZxU3pma0lYMlJCSzJ0OGJUMGNhaFRwZ3Jkd1lNa1VD?=
 =?utf-8?Q?TIS7WiwfwiWuciil8Df9W395bOPMu/QhxRbhkN0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8f62a3-4db1-4338-ebfd-08d9482ca3fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:38:01.8191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yO35ry94z14xkc4C2zpmqTr+NtbbJu6nWV7pqXSsoUScMYtRGEyxmeyCAdSFqmwo96v3wbIRLrLSgKLVSSbmIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 12.07.2021 22:32, Daniel P. Smith wrote:
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -30,53 +30,53 @@ static inline void xsm_security_domaininfo (struct domain *d,
>      alternative_vcall(xsm_ops.security_domaininfo, d, info);
>  }
>  
> -static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
> +static inline int xsm_domain_create (struct domain *d, u32 ssidref)

When you have to touch such lines anyway, may I suggest that you also
take the opportunity and drop the stray blanks immediately ahead of
the opening parenthesis, to bring this file better in line with
./CODING_STYLE? And as just said for a later patch, converting u<N>
to uint<N>_t at this occasion would also be nice, for the same reason.

Jan


