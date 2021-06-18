Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04393AC8C2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144435.265840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBh9-0000ON-7B; Fri, 18 Jun 2021 10:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144435.265840; Fri, 18 Jun 2021 10:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBh9-0000M3-40; Fri, 18 Jun 2021 10:25:51 +0000
Received: by outflank-mailman (input) for mailman id 144435;
 Fri, 18 Jun 2021 10:25:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luBh6-0000Lk-PL
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:25:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99f34364-4788-4541-a3b5-f09668cf26e6;
 Fri, 18 Jun 2021 10:25:48 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-sFUrfP-xNny13gJQGRFChQ-1; Fri, 18 Jun 2021 12:25:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 10:25:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 10:25:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 10:25:44 +0000
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
X-Inumbo-ID: 99f34364-4788-4541-a3b5-f09668cf26e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624011947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sxI3txB9v2hvNDBVrrSYN+2xPMzrpPdCoOLA7Q3nSfU=;
	b=jnA5pyDynjRRsKOAHJP1b0LqSb+EEWLqTXFy7cKXFHCCdp0VGY272pNZLfQoftVPnb5Ubf
	aHH0nKjyqHIaqZTIIQ/J583v9cavJbZdDu25ZR6oFx3KzNxNy922TrK0CZy4QN+phhIUNf
	pfJYU/pj9Q6UzCjb0/gs76/5cRXUGNA=
X-MC-Unique: sFUrfP-xNny13gJQGRFChQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhkRG7zbee8Kj75ldtu1o6tukLGmW2++sTFaFKwApk/5w5Xf7I68+rigAhnFKA5EBShX6NbgnscVZPav150H5iUTo+Gj9M+YuOCdqO6reOg07M9ZZHa2HlDlakHM6vIix6LS7sj9IZw4FobmO1LZ8PKk8eVAp79XXQt2ataMMEYV2zhiROkJLTtH31OnACTimPbfE2zbC1ZOxczGyARa60OIAPQeMv6xIoDjvorNwDIzWmCf7racapKGADqarOw0Ma37Ayn/qq7Y5/9kv/grKLQsiTQiHFMXYSSn3scSOytV1TG/KCaWZAsFM1qBTjfc5DkFvawiaKqvmYFylvYX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxI3txB9v2hvNDBVrrSYN+2xPMzrpPdCoOLA7Q3nSfU=;
 b=CGG/seglcFKuM2fBoPNImN3t/XAqA4xyKzNxMtIu4DdQZkOh9Pf5veiEkXUMxWzq7+w1kPr7ZCirnU3/ut7ELrBAxZpRItxYhXqVI8rM7p35YsvmbAGDmPmatlEXqxkHj4vFnZ4pezzPR92OQLVG1dF8eFBJNV20vv9U0h28nVg0XEj0ky0won8/0cWDQuFBR0DefwfQyr8zuKNMODPJPBlzwdiS+fj0Qz1W1pdh4rxXS8jtzST0EhPo9tFpKUz6tcd/UW43sikfByCGVZomrlckMe1knr7P1Eca6VohEfGvEJJ6W6n4XoqLnEqqvuigwZSqajUNi/nK3xC+opN3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 5/5] libxc: make xc_domain_maximum_gpfn() endianness-agnostic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Message-ID: <99979695-e53e-7764-85e1-64dd4cf9447b@suse.com>
Date: Fri, 18 Jun 2021 12:25:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0194.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c3b44d0-5fe4-4a20-efec-08d932436e58
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617390A7D033E00387757577B30D9@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wCLpK66B7R6eYuHMUV25pMvQYcNcvotjHPDiO2BAwEfO04nZl7uDGE84pUrd++OkNXi+vHZvRsSt/UFjDI+oVVDbj80TrCt7E4QBqVXfQLntLRBoSZpreKvZhUZ+QXZXlb+Q/pkjSWKDbr9b13CgIbEfctW4vp0tTbVApjyaq3II72P/iPnzk0pCN0x68UqYoCOxb4BHfmm9Mkz0L9ZfoRReg8N2KkT42HioybdsO8PGjzx9Fkt0G6uMFleSJs3C3pu/wD1ZvRe5/5xoOF5rQBsSitWz3sSZ25Nx9HQdsAVX8JHOa0W1sCPopxB37FdZ0rwwJVWdoArjwqs0i7Y3m2xKKmOKas0HNq+IhukKVlydtVWJxhKPoXrjZEA4miTVbG/de1FcYZw/f3wpvwNZS6WnuZhvvmtN7T9E7C7vFo0mulzGtPW6JFbipQmer+IblLj5aOm/xaXz4PnRLC+HU/BU6oPf/GZFkPjIjOTJupgcnLLtlE2TmaGbochywu2uX+lu6k62dPOLcZBxVQVccBN8ePAsfJPSu3TmosfchqUFqrnOx4JAm9ep/JZQDGr6juftpqBcyS3jggoqMdYRpnrbChzsu+N7OMUhsMDAa+0vvVO/jfYgDUQM4FfbQRIuAoMFkjeULO3vo1enp5KEvtIWdNMrvypgpPhlpfq1QRiwzb0HXlL++xx5GApM8c9E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(366004)(346002)(136003)(107886003)(66556008)(66476007)(54906003)(2906002)(316002)(4326008)(31696002)(31686004)(66946007)(26005)(86362001)(4744005)(6486002)(956004)(16576012)(38100700002)(8936002)(2616005)(5660300002)(6916009)(8676002)(186003)(16526019)(36756003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3ovTEEyVXQzazk2YTFwOWp5NlFKTVRwa1htblZQYms3d2FTNWJleldoeFVz?=
 =?utf-8?B?ZnMrRmZhSlVwSkpQaTg5d1g2eWZSbG9XRkJsbVdoUWR6WnR0b0NJajgwTVVF?=
 =?utf-8?B?Qy9IdVBrUzJLcExMN01XamdicEY0N0lEOHRycGUydUtKakJtVnBQN0pBdkxz?=
 =?utf-8?B?aXpWSndicmpmK3Y5b1JXL2V0U21NYm1tRzIzOEJXaUUrS3lKMzVJaDMyMkRw?=
 =?utf-8?B?SWRGa1RkMk1aMWV1MGMvazh3WjcvbVBXelhUNnhXS0JMUDNic1NybEtTUFJN?=
 =?utf-8?B?eTI5SlZkZmJXdW9HYUk4THJBRVdBeEdsS1hPL1JqR3Uwdmk3cHh5S040SW5G?=
 =?utf-8?B?VDVTYXA3RStBSzBERm9VY05LdzdTaU9FaVJna09MVXBGaWpkeXNIcU9wcWZH?=
 =?utf-8?B?cW92TUNSUk9JbEhpTS9QbmtnRytHeE80d1ludU9pMk9TRVJjSnhYWnhCOEdF?=
 =?utf-8?B?TnpsNmIrMktVblJtc09aeHI5TEdDSXN3OElCVlh1dnNHdGEwd1lpbjRDbVhS?=
 =?utf-8?B?L1E0MkJyUFBvN1hralU3WFZDWk9pV1hnN3hNOWdNTmxZdDFYeDY5ekhwV2Nn?=
 =?utf-8?B?dHZWU25wdlRtTnpUNkRRdGFCVEg0R09lQVlEbzgwS2ZLZVExZFYzZUVCR2M2?=
 =?utf-8?B?aTUvWHYzU1Zib2NiZkd4M3ZETTlCaXcybWc1ejA0NEp6VHJXUkpNTkJUai9H?=
 =?utf-8?B?c1JVcjFNcW5Td20vSnpla3FVZ3VVWERQaGNFSVVZSWt1SFR4WStmSDdiajY1?=
 =?utf-8?B?MFFHbUZBQWloS1NzNjZldVVDSUdyTnVnMmh2dEd5UEhSY0pQZ2h5NzEzNHl6?=
 =?utf-8?B?dEdIcWR5ZmRKcXF4QkliM3BsbTFlR0Jkd0hRdGNSWlM1NmhvQmNCZjZJa3ZO?=
 =?utf-8?B?WGoxaTVQcTV1aWw5NWJnbjV1aVlZR2RnKzZZaGEzYkdrQ0RrTmxzZHFkU3VE?=
 =?utf-8?B?RVp6UW82V0dSS3lvR3QycWNpNjF4MjVlZUo1SzUvOXdhc25SakorS21vc3hi?=
 =?utf-8?B?ZUJzVWFFckxhOVN3cDhaVjJNTStlakx5Y0JveXlKYmM2elllRisySVErT1dh?=
 =?utf-8?B?SzQ4cmFtbllUVTVjcGVjMmJHSnpLUmtuSlVZeU01cFUxSC9Lb21KNHFtb0ww?=
 =?utf-8?B?TTF5cUtFWXRsM3lDMnUxTzRqdVhlL1NtU3VISS93UzdwSVdnS01xV29WN093?=
 =?utf-8?B?Q3JsejhzNFNFYmE4R2dld3IrRmdJUjhFdEp6WExKNUkzL3RKazQwZ2thS2tR?=
 =?utf-8?B?clVka21uWTFua2NTeXdnUWF5R3FXTTZPVU8zS2laZGxLOW9ONzgxSEF1bXhN?=
 =?utf-8?B?dGxtYkpRTUlPSjR0V2o3dkVKbVlNaGhpZDRkU25VZ24zanZBQkVSUFhlT21E?=
 =?utf-8?B?b0JObGxKYTQ2aTFSeXovbUJISVhYbFFic0xuQnl6TFpIWGVUQ1dJeThDWVRa?=
 =?utf-8?B?WTVsSER6WHUvaFNxMmRxYWlpVEZGenM2SDB5WDVDZnZDblhVZWVhczFQUmpy?=
 =?utf-8?B?ZWIweXlnWVhFSEd0cGFhZzh1RWlEbWhuaUlzcFhLMnNWTEJ0Y0VCcmlscWdp?=
 =?utf-8?B?VGZiQklPQkxIQkdEOUlsZkVycmxHUWozR3ppVzh1SnZVY1YyZVJkRDF3Tzdh?=
 =?utf-8?B?NjIxVzFUOEFVc05JamVHR09QQU1HOGZ5UEthamlaMjhMNUYzRHgvSk03eERQ?=
 =?utf-8?B?cC9FelQvNGdhWFFYVUJtWUxaL1V6MmQrdTF5TWk2VGYvN2QzdWp2ZFl0NnhE?=
 =?utf-8?Q?DJDdid09N8iw1icEIBvsEqXz/f3jMz3LZw9wfG1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3b44d0-5fe4-4a20-efec-08d932436e58
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 10:25:44.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MW9I31JvzbzpD9FV6w6hi7JhiS3mFtmJdy2WDuWQ7+Ca5p//GA7+PhbqCrk4OlShOPZ/AyKkDv90o8sHAER/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

libxc generally uses uint32_t to represent domain IDs. This is fine as
long as addresses of such variables aren't taken, to then pass into
hypercalls: To the hypervisor, a domain ID is a 16-bit value. Use an
intermediate variable to deal with the issue. (On architectures with
arguments passed in registers, such an intermediate variable would have
been created by the compiler already anyway, just one of the wrong
type.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -856,7 +856,9 @@ int xc_domain_get_tsc_info(xc_interface
 
 int xc_domain_maximum_gpfn(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns)
 {
-    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &domid, sizeof(domid));
+    domid_t xen_domid = domid;
+    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &xen_domid,
+                           sizeof(xen_domid));
 
     if ( rc >= 0 )
     {


