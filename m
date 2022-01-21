Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22372495A41
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 08:01:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259248.447316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAntp-0005bc-TZ; Fri, 21 Jan 2022 06:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259248.447316; Fri, 21 Jan 2022 06:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAntp-0005Za-QI; Fri, 21 Jan 2022 06:59:53 +0000
Received: by outflank-mailman (input) for mailman id 259248;
 Fri, 21 Jan 2022 06:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAnto-0005ZU-2d
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 06:59:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b98d507c-7a87-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 07:59:49 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-X-CqJ3ooPfGVmV6crym6Pw-1; Fri, 21 Jan 2022 07:59:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB5641.eurprd04.prod.outlook.com (2603:10a6:10:a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 06:59:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 06:59:45 +0000
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
X-Inumbo-ID: b98d507c-7a87-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642748389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhq1t2aynVzCs7E4CzYWMaJv6mh8jIHrvd6KQZRCDBo=;
	b=MGtQ7yekhtIiyv3GBUFIlQC0VwTTR3sVj/8Ie3yXbPULs2ZmSAToVHYe+NIekWt7VcnWJk
	Lf++DmwNvfW/gA0KHyWOzZYz2blE17K3S9N0KYYzMjlqxS7jCgXLEMIyRJWI5PaGLpYQJv
	mfha55U/GFsa1JHAAS84IZbS+eXSXNQ=
X-MC-Unique: X-CqJ3ooPfGVmV6crym6Pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFWmX1XtScApEvKIcZK8c9tkGT2nv4GgOUVB0bmyGRaXsfkCUN+nZ8yUTlDYlPZlNyuoSsOS0ycySyBBCq4ZoAmsVF9LtdyqhdEZ3KBNNg9t/66iuMYqojpJXMfMm8g5wWilfx8B7n0tiFWvM1sJi0uwg5weVpD+RdSN0ik41EsirdUBRg+eos5aLnsRlDchrdJVVKlwdiF3HrnWYihn60lFvk+aCSe9tct+xiNZAi678eiSjq/dfv9HG32h0U4ECXaoH45I7gFFBjh4L965n5Am+dKcgTetzOL+xN7Zuyj56P4/gwhMOID+SUHe3UJjoq7eFmaZFFPi3CjwR31t5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhq1t2aynVzCs7E4CzYWMaJv6mh8jIHrvd6KQZRCDBo=;
 b=dfwPCkMsgsYGP1sTERWzLdy4INHSCBcP4pLotHt0Z1B31Mflpmdm3AGJZMeqeAALllyjKCjfPBMaD/vGtATU3WA3Use4w2Nb3Fk1PaNvGliyw2VoWWzBI8KAqf69Upny7uug2VjggtQ4B4cXBXOmCxdnBh3pHDbEGd/dx5xMCSU/3T7k47w4HvgBnX3YG7s8uasZJ46HQc5UkLYBoJfjsmzR1LxAUQllF2k6SDeqbs/AWuBtG0jWrkg73b27HzVmka8BdPlt2gDfm1Nvb37cqNzotlZVAj5ekZ2h/g0xaKyW4y30lF+FDGK1zL3mfUHSo9s0610IK8HpFJLBSdoZ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86033c13-c444-aac1-6043-73ed12c78240@suse.com>
Date: Fri, 21 Jan 2022 07:59:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v8 00/47] xen: Build system improvements, now with
 out-of-tree build!
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Connor Davis <connojdavis@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Paul Durrant <paul@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0039.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 292e95d7-c62a-46eb-4e69-08d9dcab9b1d
X-MS-TrafficTypeDiagnostic: DB8PR04MB5641:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB5641FAEA4A77113FD522FAEDB35B9@DB8PR04MB5641.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M/xcsTaDlsUpA1PXiatLrG4dnJfRQkVi/O2qPVVgsEcLOThfz6sihIKeKUI7xvqTRnaP9bDngQXzGJ4BU4s9IC50bgKxkaYH9UMw4+e9lNXim9czX9c+why+83F8xXLBFu61MjmVUjhy7VWABvzT2wj0nNL0XBZ9gpJNzPT1eor48VsJYKu8kyj4zU61DqCfi//5X3X+It4WG3PTyjaLcJP6CqrjgjxfjDAJijuwBpJb6p2b8lHkHfkCnc4O7CvLf30t6kQXDLthapECOkLiaKO1B4DdMKg6/aKPIkMxQ99qhxowu9z8E0Tv1qWwY2Kw7i0tPm9W0xzCIGnHoDVm50RpiLeAGthT1kp+F7Zt8of62mCTDiJrMSMkVMnDVigzgbf7BJGN9RvrQ66eu8zVAPeG6By4WiU2PaJ8nRCuclPLtMD2A/UKzdyDhPrRBvmx5NZSFcQO5fm7aUpWa/QQ6abY3sUijTZ55kkhYGXtMbJOED+cxbNFlCIP3svrPebVQ99oOnaQo5RozhakDml5FXQyM8URDJaBJAN8v/OikE39ryNs0O8X3nMR/JIP6tGDgJzw9OsS29nHmWtJ7iNNqFn1jisymwlUDxUlA+Lbqpc5XuADjmJ80ztbiNFea4BspS5kZfRMYCtx8oaiFky/NZMT85mHuhYwd9fzPe1TcVji5fhu+rw3VsSRccDOG6VixuiIZhN7z4aXPlxJ6OzXBxPhBoQDDwADNOrwFykjHxg+E9XyYOHrkE6RcVfX3isiwtqkSioDN8weeT0nuv+dXvpUYcWdwirFBncE3sXQwn1L3NA7P6LKWMWCOZhYG1F1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(31686004)(6916009)(2616005)(4744005)(86362001)(54906003)(8676002)(36756003)(26005)(316002)(66946007)(6512007)(7416002)(6506007)(53546011)(83380400001)(66556008)(66476007)(5660300002)(8936002)(186003)(31696002)(6486002)(508600001)(6666004)(966005)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Lzc3aTM4VWhwa00zZW1mU2puNkFXSkYwYmtEYjhNQm5nTENMKzhpZzFMZ2pq?=
 =?utf-8?B?cTArQmlMc054bC81cU5ZZDQ1amwzUTNqSWZrMlIrRk4zblFmUU9Bb1BNVGhv?=
 =?utf-8?B?WW9HbGlBOW9PdGJ2ak52aEJBUlRYWUpyb21SMnN6ZStFQUZ0RXVtdDdRVytm?=
 =?utf-8?B?bkxuamJQYnpLSFROTDFza0IwWmxpSDJmalZOQlpWREVETjRpbFpYbVNwYUhp?=
 =?utf-8?B?WTVPSk9qbUpLZTNkRTB6U05OTWFsd0ZtZUJxMkNrRFU5R0UvcldLeXp2c2Vh?=
 =?utf-8?B?dWhnTXRaZUZ0N3NCUkRqN09LTDFpU1ZQcUtQQ3RlTi9JRFB6TFFiZFBYb2xK?=
 =?utf-8?B?ZTJ1aHNBeVFDMnphd09yT25rc1g4bjd3MkVob2Frd0gvdk0zbU1jeHFSa2NU?=
 =?utf-8?B?U0ZZWWdCVHNRTjRYQzJuZlBEM2tqR21FTlRzUVNTUnBnUWJ6T0VpMjRYcS9O?=
 =?utf-8?B?WjFWbzRzbUJUdnlkM3FRR1NQSW5SV0JTNGZ5MnVvN3NtVGFoaFVJUmc1MlBm?=
 =?utf-8?B?bVV4RVEvTEN1Ykd0QnlUQzhXaXBSL1pIa3ByTXVlaU1KYzR1dkJKU3J5S0Rx?=
 =?utf-8?B?L1FPMFVIOUlMYXF5bjQxNGNxSkFpekFET1c3SU9zUWdpckZPMnF0RmhIREMx?=
 =?utf-8?B?a25kZTQwUFJIUzhxZjMxV3NZLzdTSm1lVjVaWkc1bDlFSWd2ZW95SjFENzJJ?=
 =?utf-8?B?a3ArODBZVU52VHhvL200TU5XYjZiY3ZKVmE5VnRFZVJqcmZRMml4eEdMYXR5?=
 =?utf-8?B?aGlFVzNRMHdHUTJ5TzdBZ2JISWZFcFBXanRHL3JYUDJsTzhNclhtN0pPS3Z6?=
 =?utf-8?B?WFRHTW9ra2hyVDBSYi9GcGNFNmFzckd5WFowSEZTZFdWbHZuMUZ2a3oxR3hs?=
 =?utf-8?B?YkxkSXNRL2tKWENMcERWbHE4dUNRR3VnQjd2STVBUkFjTXliNE9jeEZkZTgx?=
 =?utf-8?B?R2xtdjFiMjBqaGF0cWs0NFNiUzVPdW56WXRzVDI3a211aUVsY25xZVFEaUJm?=
 =?utf-8?B?WklXd1hralBIcGh6OGtGSmJSUVQ5VjdQMXo5U1d4ZDUvM2Z0K1dZRnlJQ0cx?=
 =?utf-8?B?Z09MSUhKNHJZdDMvZXhsSE0xdE1wZ2NaM3BxWUs4VzdxUjExMFVaUHZ3VEFx?=
 =?utf-8?B?dW9ZQnlTK2M5Sko2ZzNlUUNGMG9OUWM3RUkrcy9ua2FkRDJQOC9VSkViVWhy?=
 =?utf-8?B?V3BBeHdyaTZ3OGQ3aWVyV3k4ejhzaHNlTTRXV2EwOHRud2pCbXhuOEVIZ1hs?=
 =?utf-8?B?cm5ldTl4NU9hcVVjTkhoZTZMQTBVMmZEaXhoM1Q2eW1MaE9PeTNkUkJjN2Q1?=
 =?utf-8?B?b3BvazJEcVVMUzNoVHE1N0hjem03Y3VlRXlZRlFoOVJDZitLUytaSGNSUUxS?=
 =?utf-8?B?UVZqbW1LT3o1SHdYQkJ2eUFBdVplb3IvV01wRFo0azFBVndlbUdscUl1Vm5m?=
 =?utf-8?B?YnNFUXBmUm5WN0NDeElRNnNnd25vTzRnZktLRnZxN3FwZ01sd01zZmg5TmFH?=
 =?utf-8?B?SCtZUzFsODNRYmNnQmZRK1VIZWFzeXN1THZJZlNZWGdGNUxjcGJNQXN5dDhy?=
 =?utf-8?B?dEVINGcrVUt3ejAybUJ0V3haQ3VRek9SbWN1eDZpaTFQWHZCSDAybG1TUk43?=
 =?utf-8?B?aysxVDJyQ1FQODRGbEJXenNWeDQ1RlVIdGlhaG5DU2hSNHJQTHc3WW9UUWVR?=
 =?utf-8?B?NDcrSFJHUm52NzlWVUpvUTBtMG91Q051QUlleFBTN01Wak5Nc0Q1NHB4eURo?=
 =?utf-8?B?MXBQMTNlVktDV0FEd3RYeDdLaHQ1cUVkK0JvTjRTREVibkExRnY1WFNhZEJN?=
 =?utf-8?B?SS9IZHpyWm5DR0pBMTg2NjZ0NkRvdGdEV3Y3YmtvZ0Z2RzAreUV6S3daMEd6?=
 =?utf-8?B?Y3pJS1AzTUFheHBRSUkrZlZRWjJCRDVOaEF0MVZmazc4TFpRMHB2OFdHcm1L?=
 =?utf-8?B?U2VqbldXeFFLNFFNenBRdnRPalU4UjJhZStnTGtqV2dHRElROVNWeGswR1Nq?=
 =?utf-8?B?S1NBWmhZNGp5ZkxIcWhIMWpTc1lrOVBySW9pYWx4ZXB1ZWlXVjBtRXdmMjFX?=
 =?utf-8?B?bEh4TlhtelhzZWhpOThDVkZkdGVpNGZ1R3BwYjk5elRJY1hYWE1PUU1IV0J1?=
 =?utf-8?B?QWdKaFJXM25QemhZQ09BSHlzRkI4NDNBY3VpMHlJaWVGYkxYcGROalVNTVRk?=
 =?utf-8?Q?Ig0n1rSy7QmAssVAXiafd8c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292e95d7-c62a-46eb-4e69-08d9dcab9b1d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 06:59:45.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYQdKrjBIK0UL6hZ5RfvDUIAD3yCrSb68EChjQYO0JYButnQxj+WmLW9PCdAYtnZDGOo+OnzGyOIMHlYh2aDAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5641

On 25.11.2021 14:39, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v8
> 
> v8:
>     Mostly rework of v7. With many patch already applied.
>     Some detail changes that are spread through many patches:
>     - `make cloc` recipe should now work throughout the series, update of it is
>       done in 3 patches.
>     - new patch "build: fix enforce unique symbols for recent clang version"
>       to fix an issue with clang.
>     - introducing $(srctree) and $(objtree) earlier
>     - introducing $(srcdir) as shortcut for $(srctree)/$(src)
>     - introduce usage of -iquote instead of -I in some cases

One more question: With an out-of-tree build, where do I put the
(build flavor specific) ./.config (not xen/.config)? I'm using this
extensively for cross builds and to override tool chain components
(to avoid having to remember to always specify the right combination
for a certain flavor on the command line).

Jan


