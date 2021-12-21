Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB947C119
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 15:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250443.431363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfga-0001Up-SP; Tue, 21 Dec 2021 14:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250443.431363; Tue, 21 Dec 2021 14:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfga-0001Sg-Os; Tue, 21 Dec 2021 14:00:12 +0000
Received: by outflank-mailman (input) for mailman id 250443;
 Tue, 21 Dec 2021 14:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzfgZ-0001Sa-HR
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 14:00:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f913780-6266-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 15:00:10 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-J3-zA4geMnSeZMQi2wk9YQ-1; Tue, 21 Dec 2021 15:00:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Tue, 21 Dec
 2021 14:00:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 14:00:05 +0000
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
X-Inumbo-ID: 4f913780-6266-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640095210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+IQehem7mOLSAZ6/KgK8z91BqxQoaUEJU3w7hNuw44=;
	b=NgouxKRZLj31b/C00u+zxPe7X7OzCTYNfmfF5GbRELFArtb3Tl1P8Hj/O42yvW9+yC6VF0
	gGwW+otSkh4wkcuCJWNjCLPyzaFSp2X8E2xjXr2YJE1q+Zjqjpo25biYvgA9KJhPeg0dWc
	SWZ/x/HbyUCyn8zy0suSapxYZc8eM0o=
X-MC-Unique: J3-zA4geMnSeZMQi2wk9YQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWTLWdt8eezFQ/mR32IoxLOywBJnn2oSY39/9misiP6aV5Wh0ve8Ndu1tusBvxqRq+ZRzqZ9nJRSvQHDQJSPMvlD0OojY7KbqDcvVhHUrgOJawLbEoywP7h72m+jGp1p6Pq20+JO34IzrmeoChFujq2pX1JDkOkw36VX74dNy+NPL12JWaePpquOCNIJxj8lBTxpDPNQzQ4XLglyFqAvMl0Kan9w/ElTV1pBDocGIJWP4dI0ht+HRxxpnenewtBCjKyJZGoRVaSkIb24d9tjM8Z2FFmL+v1v+hetmRjPgQAC9IOn9pImw5gCQSBqe+dyo4gAtmC/eeUlofrQZIfAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+IQehem7mOLSAZ6/KgK8z91BqxQoaUEJU3w7hNuw44=;
 b=c4wlc11uO9ECvWhZDGsGWe4CyLTsxUeV7M/vxMB9i+/DR84uh/s6aXDdua0xIWTwG03Y84d4+0LKfEkaT5b4dvy5M0rqyM4bh1g4Vh38EhJAnnT/teYc1GaEOtbWfudg/idhcRTmSZnnMVzdK+qV9pRK15/zTVwJ3unXG0bRXWSbVF88Wm1meyBBLLsHTk3Ey/xOr/txKSMQ4mqzIVriBW7B5eWDiKVvIXSIWUaKNK0ViKg0eJKOoK1Ibcdi07lESGe/GdQIgdL/eKw8QrFsf6Xs/PqWPURHl5sP8nTFwNnrSpCXMdiEInZOdEGeYvupdkM3b9H3YcS0Zvckra3zsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b76fde35-ce23-8256-f5e7-daa4e4a3a470@suse.com>
Date: Tue, 21 Dec 2021 15:00:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 29/47] build: replace $(BASEDIR) and use $(srctree)
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-30-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-30-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0116.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e16caa6-8cce-4595-ee10-08d9c48a3119
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51651AE3275ECC785500753BB37C9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ecdEdQxLNf/ux3Z5o6mwabe+6NN2152cWLDnMj/5ZtqGkfIBEODbDd/mXqzkZnrv31fKUbGgMIfEudw69gdkjCArVyq5gqakmQN7GATKid3MHBhFEjIt5G74sPFFeTurtwe8qfMoE8M+aPM02tOSndcTZyZfs3+Ksfjr0SqsYevaWvXqeUk3DsIR2CaSGvmTGJ1uGrtkdK6zMMZ7LEfi1kbuqU8Agx5ix75IGe6iJ34+7M6lXprHLnhiqc/04OC+c9KKOdZvSmoo9J3LYF6skyJdR77vWfEN4JWgDPeaARVxubKJ1rBiXhyi9PfVNpHBUVESDi2p6h62pORFJo8+p1Zw2OXwEqGhID1Nh4hV2JA8TfJWBuJx9y+tFWy4Uqb1D+oyDW1oEmjrZFfUwBMz9bVDN2QqbvftQRNoNSXGvPUpAl595SSujBd+HFa4Idk3b6XWVflQvpDF7IDOC028jG66MkPI+ZuM0DUJfLTvAMKjFffUzFT9qEjFUY8cHIwnv4KqgDfuJfONedVBI4IKH/vUODXcIv6asl5tf8w9u98mBpnpuLtH6ndotogC2ROR6J33nA/zYstLoZI/MA3F4Y7o0WgFA37pVzgmjEr4BNalA4J2k5YM3y4mfjtYFsLECKx79M257NbhEle/1MAeOAq64SbbD3G66C+sTM3Xv4bAmWoE3HeGmSk8LfsHjNkF8fRyZjDJBpiBIDC+1QOQrPsWbks+oXpsHfwdcBAN0ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(31686004)(6486002)(8676002)(31696002)(54906003)(4326008)(2616005)(8936002)(2906002)(7416002)(86362001)(4744005)(26005)(6506007)(38100700002)(53546011)(66556008)(5660300002)(6916009)(316002)(66476007)(508600001)(6512007)(66946007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azFZZmpaWFUrb0E0eFlvNU91R1J4WVU3d0lDZFVLQnBwUzh5VHFBM2lrZXRP?=
 =?utf-8?B?ajhZQmgweWJER01naGdBQ1dmRjhGS1lLNDRMbi9DeEIvd3JQcEc4bUNXeENC?=
 =?utf-8?B?QXRWTHRPUi9VaFZSajI4dW96SDNZZDQ4cVZVc3VPb3EyYTg0TVNjWFllQzJ5?=
 =?utf-8?B?Sm5RQ0lZWmd2M0xTa1Z2ekM3bXRRWDRvQktoNnM0VS94QUYzU3ZReEhPNGVD?=
 =?utf-8?B?cmhaLzFIcjNMVk9hV251MFNUL2VucnVvTWlzSWRwaEVlQkVvT0dpaUlQMDlH?=
 =?utf-8?B?YXlrMHRrbEpGOVFrOWxZaFdibjZoM29sVFJlVk9RY2w5NkJNWlZLUmQrVjJy?=
 =?utf-8?B?TEk0RjhaempuR2M2VWtJQVBhWUdMcEtxdWNTZ0dXK0djSXVCMXJpR25zaGps?=
 =?utf-8?B?WDFtSnRhUWlHT04wMk9KMGVsdE5EY0N5R1prYmxZMkdtbGNwaHVxNFFzVHJu?=
 =?utf-8?B?WWxxcWRNQ0QyWmg1VGFOSDJpZ2JIdzBvV001UFFhcmsrT3VQVUVkWHBMdHho?=
 =?utf-8?B?M2RRWUM2SDNDR0QweFIvMkVUMnlwbEg2RGRkUTNnaGdQWDFkMlJCOWJJaTNO?=
 =?utf-8?B?bDFlVC9aS0pYUFAxYjhJemFTdjFINDEzZUY2em5LNDNDL21lbU0vUk0yRXNa?=
 =?utf-8?B?T1VHcHlqdENZeXVyQUcrSUlTUmZscHpaSlRnb0liNEdLSlhIallBSjViejkv?=
 =?utf-8?B?bTVtV1B1UGcya2RHSlp2cjVCajcwcVIraTZSeDJIb0JlbFJGL0N4S210NUwy?=
 =?utf-8?B?ZlNVdWJraEdwVS9Fc0U2NnJJeWs1SUlwZlZFWHpENDR2R0NWekVralRhZ1RY?=
 =?utf-8?B?dWtPM3YzcC9ML3NSUFFHMEcrSFVjQTN2ZXBadENveG1lY2h2N051R2hGczdE?=
 =?utf-8?B?YWRRWXJsdldpNjVSZSsvb1NaeU9MNkt5aXIxNFYwRGowaThpMkZxV1RuaDQ5?=
 =?utf-8?B?a0YrbnVLanZtVTJ6RENrbVFMVks3WDFmM051Q0xlaXczNEZLZE1SWHhFTXVh?=
 =?utf-8?B?TGU2cDd1TVNtMnFVYS8rNmxhV3pvdldDRm0vN3ROcit2TGhWd3Y4aGhiSEx2?=
 =?utf-8?B?WTYzNnZaR3YySDFIVU1MTm8xRzM1OGtGa295Q3ZYRmU3Yk9pZDFIbi9zUUdi?=
 =?utf-8?B?L3N3TTllY0d6WFc1WEJsSklTajV2L3hGUW1TUnFFaVlCL2NzUlBRYWM2ejVB?=
 =?utf-8?B?VmdqOTVjWTNYMVlic3JoNkYwRlNPTGx2S2FZWFZ0eFJGNGVPTTcvWlJ3bzRS?=
 =?utf-8?B?VnltVzlHNVVHcDBrZVlERTRPajJ3cFlLLzZ2bzBCK3c2SHlEb2diM1prWHNo?=
 =?utf-8?B?a0w4TUZndVZ2c1JXUjNCUXQ4Zm9OL3Q2cnh3WHFZc3kyVFZWcGllSVB5SUlO?=
 =?utf-8?B?TUFCYm9QRk91NXI3ZEsrSFYzOEE1K1h3a3A4TndVMUg1UlBDTEQ3Q0pPUUo0?=
 =?utf-8?B?Y0hIcWNFMFVpMEtmSmxlK1BpdVRWYUJtSS9YR2Fra2tERFl3YnprMFN1QTlS?=
 =?utf-8?B?M2hsRy9QbE1YbjJ3ei9xc0k4UTQ1b1lYZlF0SkVHZjA3U0lxcnlwWTJ6VUtO?=
 =?utf-8?B?d0JINzlaMTVQTWV2UWk4NzhTVktVZjZDdk80dUJZU1hLblpaeUZ6NHAyaTBD?=
 =?utf-8?B?RDBhWHkrdm5NUVp4RnFvTUlOV0tzRlFtMEt3S0lBcWsyNVE0bmhyUDMyTWFZ?=
 =?utf-8?B?ajJ1cUZoRDlDZXJDN2tXNG9IZ0xRNjdtd2lVM2hMS0RONVdyb2VaR0s1WU9Z?=
 =?utf-8?B?L084V01aKzczUGNqbjQ3Z1BzNWRndUlMRlJtU1o0a1c0WkVPNUg3ekFIcVhn?=
 =?utf-8?B?QkxvRmFXS1JJY1BxcGFjak51SUFoVzR0WE9BOUpIRWw2Wkc1bjZ4TFQxY0cv?=
 =?utf-8?B?YVM3eXQrSDMrYzJWb3IvcVo3V3JnUUlEMjE1UkRXS01LN0I5L21iMS94cmZC?=
 =?utf-8?B?Q0t1NmRSRXlLYm1WMlNMMnYyWkNTRldZYXMrYm4zbnYwcEI5cHl2eTdyalJG?=
 =?utf-8?B?QVJaeC9uS3A3TnFGVWREZDFHVEVUS2puNFhybnNGWEtCNnpJaHpOMlFYL1dv?=
 =?utf-8?B?WXg2WjJycTNyT1loekoydHBQcGxPaXdVbDlONUt4SzRiWGMvaDhPWjRlcXdj?=
 =?utf-8?B?elUzNVdyWTB1ZzlBdkhPUFUzWXVucTZpM2dXU3JsT0xOdW9YOThJUzJ1TmhC?=
 =?utf-8?Q?pVJMDATZmTEXTFyCR5Fs6oE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e16caa6-8cce-4595-ee10-08d9c48a3119
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:00:05.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78iizw+uYfVJ3ZqDCKAajn9MYcjlALqB81y9adKUBjQMCCPmwjjQw3kvYOnDfMPW6I86TGR3PaTl7WWM35WtBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 25.11.2021 14:39, Anthony PERARD wrote:
> $(srctree) is a better description for the source directory than
> $(BASEDIR) that has been used for both source and build directory
> (which where the same).
> 
> This adds $(srctree) to a few path where make's VPATH=$(srctree) won't
> apply. And replace $(BASEDIR) by $(srctree).
> 
> Introduce "$(srcdir)" as a shortcut for "$(srctree)/$(src)" as the
> later is used often enough.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

One remark:

> --- a/xen/scripts/Makefile.clean
> +++ b/xen/scripts/Makefile.clean
> @@ -5,9 +5,12 @@
>  
>  src := $(obj)
>  
> +# shortcut for $(srctree)/$(src)
> +srcdir := $(srctree)/$(src)

Might it make sense to generalize the comment to "# shortcuts" right
away, in case further ones appear? There seems little reason to have
the comment duplicate what the assignment actually does.

Jan


