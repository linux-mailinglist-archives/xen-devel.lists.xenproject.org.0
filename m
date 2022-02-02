Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4854A6FA9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 12:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264056.457013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDYP-0006Y7-SK; Wed, 02 Feb 2022 11:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264056.457013; Wed, 02 Feb 2022 11:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDYP-0006Ve-Nv; Wed, 02 Feb 2022 11:12:01 +0000
Received: by outflank-mailman (input) for mailman id 264056;
 Wed, 02 Feb 2022 11:12:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFDYP-0006VY-83
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 11:12:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0f6f79c-8418-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 12:12:00 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-hVKG5FloPZG4GNNS6gmDEw-1; Wed, 02 Feb 2022 12:11:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB9207.eurprd04.prod.outlook.com (2603:10a6:20b:44e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 11:11:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 11:11:57 +0000
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
X-Inumbo-ID: f0f6f79c-8418-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643800319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zs0xCb6mFQbQyXIWsB4X6l675Xqy9x4YoPO6Zjx2mo=;
	b=YnzgUTrhMhsfU5QzvkY+l3eGKvLXBgpUvBKJW9ul3gTfH1jNmT6w3+vdrnNRoFN4ZfT4aO
	5ktnoAzOGfKofg2xta53zCj+gdkYp5td8s9owZFVEQmnyIOJ5/SnLMos8EMCqdrPrWz9UF
	JxfGeuV/GE+vV54L1Wdf6/VXGBk7KNQ=
X-MC-Unique: hVKG5FloPZG4GNNS6gmDEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXODshrHtmJG8hSvNBXk3WMVDd2Lw8Lv3AIFcaH2iyCsuhZhjBEqWailQu62Swov9IRfxLGiBFgjImtKNh8OxRPVqsU1UIzbA7naGRQpUjqr2bCEHjR2JImRXuuYiZX1W/lVDdO5l7Zq0rxdZM2Ip8sR4zhM2lXv3gjkspU6WMG7kLZ2KRAjEOEvq15vxSmFPtS63knTE8zMqP6ur88yl3OHZTkFQIAfv28wRvtFM7mMpoci069/qBe85mbqephe5J19CZdPjehsvvwAocZmzQF3GqEknthZKV6sNS/7oxfBkrxuppuotIBA7pJjZQ/Ml99CuFQw66htuty2QtA4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zs0xCb6mFQbQyXIWsB4X6l675Xqy9x4YoPO6Zjx2mo=;
 b=bhnVMLTM4BFrxGq+EDe/LcMLqMQVv7m9eGDLNf2hcRYznf3jcPqUQRVDxs+KUhf1S+HCHSot0GjUG6mt4joAy204wKMql5E5+8OC6NurdKT12rtqf7tm3txdYfIzlBMqhjS2KwedVqUS0AM9kzQh8shYEPguVf1nJqFqA3wODpfzmD2JKgkP/3hlrSHECzbJseQklywJip4oA6SrSMx2jQtUcpqccDf24sN4G4KzD5MlJfCy9RHQMsn0ii+p+ZdFyGa0AL6EPJWUejLN5kRBlNissLthgC/VXS/E7QCwoXOyONtNcouWjk3191TEr+MnFKCqSqIyq9VLJBaXsEEmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0161ac2f-e0f2-378a-4931-98e554bd9353@suse.com>
Date: Wed, 2 Feb 2022 12:11:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-9-andr2000@gmail.com> <Yd/9W7GFO51GE0ch@Air-de-Roger>
 <37c2374d-c0f7-23b6-d2f8-e94d1348807c@epam.com>
 <2282e7c5-ba1b-e2a2-af4a-84a894211870@epam.com>
 <YfpeT+VMWiklDWGf@Air-de-Roger>
 <7d4c128d-f6f0-8dca-8ab4-6138ed6cd61d@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7d4c128d-f6f0-8dca-8ab4-6138ed6cd61d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 395889b9-a60e-46a5-5bf8-08d9e63cd37b
X-MS-TrafficTypeDiagnostic: AS8PR04MB9207:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB9207DFEAE2661ADF4A40453BB3279@AS8PR04MB9207.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5lvxZrQ3ubfXed3HV7ChXruwfuRB28+/VEz5hSO5lkpOHcbSVSCsvwfZyyCuraWCbWijGY9kH2QhAGkKC6FdMrvRk1MZAKR7nowfm+zxupyLVxlIWSc6/NKnZQLtVe/d0KftJLq9IPNymg/oAZZvmajHwFfS/dJqeHbWjSBW7mx7XvWP6CQWtHTkaHmp+aIFshRh9LMArMBJcFux/fP/R47HXCeSdU7k+V4Sey8o7gyX8WW/0MI19QZ3WdsY3hUzULXsjQsMkOFn+0LNJX0IQxqVxgCQhLP4OPzcNASC8QhyxXvcriWcoEOJC6/cB1oP2zmkBxutiYUPvbG8lcuMlkgn6D3UlzYNcKzFVSTaKmDcI82TJeOQs/L1vbsNzpFKYurznw2f2hhjFpOlDdlcnnCGAddIns5Hxe1OQAWQ0TPhxF6DaE/Zqk8ssXnOCwInMWeNbmX9jMbsdjNH1v2Uw4a5ciuJ7XA0C7RTgnwYAoc+v2sJNe3mefV9uWA/2097Pm42t3s2YquC6hCXgUFp3Zu7DlE5BczuW983YAXrQDuD01hIv0NUt7ZvI/6lmN4Mv/KjkTojN3MklZ2s86VeNIGwek5L9dnrUqJytKwGzdI6nF0ZzPrlq9b2MB+MI3s0N2g8w+5U6E1+rnqr4LLNNH3uviqLqwFWx2RupAvEOC+NDMulGLuLTzgUcKCTzXx6w5OZt/rgIxe6GwNzQ5Hammr84mb37Na860gWq/8eaBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(4326008)(7416002)(66946007)(38100700002)(508600001)(66476007)(66556008)(26005)(186003)(53546011)(6666004)(83380400001)(5660300002)(6506007)(36756003)(8676002)(316002)(6916009)(2906002)(6512007)(54906003)(2616005)(6486002)(8936002)(31686004)(86362001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azNqWjRUVEFKdFRERHk5R0xNcHdhMy9Uanl1N0lkWU1zcTJFbUd4aGpkOTBC?=
 =?utf-8?B?TENveTVxdkhPUFhjVWxVMjVheXovNE9aeHNDc2VmSklmY01YTTJEVHk2bTIz?=
 =?utf-8?B?SDdEZjNiVmZ2YnVyV2xHWWNBY0U5QUYzMHZyaUQ0M3RLbHVuTVNkSnQwemRl?=
 =?utf-8?B?R2JEdmNNUHB1OHkrNExUU21XRUR0NUlyb3l5THBteUxjWENTQmhPbUI2S2lX?=
 =?utf-8?B?NFc1Y2lmUjdqc1BFTy9wTTg5M005eU1Tcis5QlQ1NlM3aWc3MTZhQjd6V0VW?=
 =?utf-8?B?WURqQUpIUHVtRGQ2Q3ozN2NlSnd0WUZqOWxnbno1R2VUcDl3OUtiajdDeVB4?=
 =?utf-8?B?bkhzZmFYUnY5TjV6V0t1NTFwQWVDek9wV3kzVFY2eS9VQUtyQWhJMjBGVGJY?=
 =?utf-8?B?TGtjTEZWbmM0MHlJbEU1dU9IR2xKWG1hODduaXFzRmxWR3BnVFNIK2J4U1px?=
 =?utf-8?B?VEtyeURESHZXYzVOZXFIRm04VEZIOEo4cVpmcDRHWHRtaWlrWXZkdjRGa2VH?=
 =?utf-8?B?S05MVTVCM0xWRVR0ZW43V2FWUUVOdndkMG1PK3g3U2t2OFhEcWZ3bzZEbkIr?=
 =?utf-8?B?ZjgvVWFMTGdldUkwcnFzTnkwQUVNallCUFBVVHN5Z1p1TThBdkVjTHRTekZY?=
 =?utf-8?B?bVRDWUd1cEFRZTFEUjN0Um5pUVhBVG5rNUl2NjM5aUEvZzIxMTRtUHlRZi9j?=
 =?utf-8?B?RjE5bTRWT3gyQ0RITGp0dHF0SW5BQWIwQy94eVhNTnl4a1dGSVBGSm80RGZD?=
 =?utf-8?B?MzZqckJud2R2ZkhNTGN4b1pObFRKTFNMTGRwNGpCZlFIcVpsdGliRHZFSTFo?=
 =?utf-8?B?ak9KNC9iZlNrTTRzNTYyWStGSDlxL2o3TGFmRGZUbEhQVjYyb0Rma2FmOEVN?=
 =?utf-8?B?eHhRY0x4bFdvZkozWnNnam9sRXcvSFhBeG5OY1phVXR1Q3BSUGlzQTNwRTNr?=
 =?utf-8?B?RG1PTnhiaGFHRGZMWG9yNy9WTVVrd1hVRm1wd3dLNDFjcFpiV1NqZ2VRWHkx?=
 =?utf-8?B?TjN5OHJydjhFck9lZjVGSnEyaGxIVHh6MCt6ZlRSSUV1Z2k4aU1ERTI0UWVn?=
 =?utf-8?B?OFhqcHBBOGwrTmJUd0o4aDZMb2UzSjVBMFk5am5hTlN6VEs5a241K1lCbGVs?=
 =?utf-8?B?b2owejh6MHMzMnlXQkN6aVUxTVlpZkJ5QnFCOWV4MElLZHNGb3U5ZXZPYnJm?=
 =?utf-8?B?QkgyOUNRTzlJSmhFSEVwSnZuaTJVUGNyZlloUi9NRmNHNVkxckZJWlBJcGdr?=
 =?utf-8?B?R3lzZjl5Q0ZQY3p4MGtOZG4wOUM0SkZCaHAvRjRyOFMzbkh6TWFoZm9FaWRn?=
 =?utf-8?B?MFVWWnBtYTlzMHgvdDZmdDFxZlBxbEZrN3NtSjVVYTFody9CMUhqQWM3aU9w?=
 =?utf-8?B?UlYrb1BUQXIweW8yMndVdUlkSnhLOUkrTy8vT2FwdVVSdmNoMDArb3d2NHk4?=
 =?utf-8?B?UnZ3cGt6K0hvKzJZUDNKOGNPZjdtWG9PTUVOZGVsMjJYMVNadVhmNyt0MEVv?=
 =?utf-8?B?dSt6TEF6aU5NN1dSa3FZT0N3eGJjNmVlaUY3eHNCNzU5VVBheWtUSDI5ZTRJ?=
 =?utf-8?B?YXR3TitUSzVsbEhXTmw3YnpVTzVCbTZTeGJmd1pGcFZvK0c1RHpSbXBhbGJQ?=
 =?utf-8?B?TU0zM1pEWGorNVp4UnhBNk9BczFkTzR5b0tzcjVDOTVCSW9DbUw4VldUcFVw?=
 =?utf-8?B?elZrMmljYmVNUUo3OHhBbDIvRzNkQW02cFFqQllYdmI5UVRqZU5QTVBXbE5N?=
 =?utf-8?B?QS94aXFvMERHaFhNbUZDUHExMjhVdzdjSW44UW0wbWM1UVRaRzlNK3RLSm9h?=
 =?utf-8?B?L3gxQVFEQ2FESmlkSnVwRm1jRlI0SlNUckVJSjdMdHJtWVFNSGp6T3QwOTY1?=
 =?utf-8?B?ekRpVzNDUUtuQ3p5anZoREpjVEU1NlRQdXg5bFFYUjV4VG53ejBiRDFPL3Z0?=
 =?utf-8?B?bmE0S3ZKL3g2ekJzeTZjcG9QL0J1Nm1DdlV3QXU4emkyWEx2c2E5Nm9kMG9o?=
 =?utf-8?B?WFlxUVVqVit5eXZTbTVPZFVJZWlZR3RBRUVGVnc4NXZnMStDYVNFSTdvakFj?=
 =?utf-8?B?ZzVicGlxZSsyRVVvK2crTjU0dG1HRFUza01hTXNKZUxTSzcrUjdvcjNKNTdW?=
 =?utf-8?B?Q2VDOWcwRm5aK3QvSUxTTFFidG5yRXR3RXg3V2tDVFJEOVg3NHhUNHFBV0kz?=
 =?utf-8?Q?icXvXCbj3RaTMn0aC6pTMWw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395889b9-a60e-46a5-5bf8-08d9e63cd37b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 11:11:57.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0Gwhvy1peqbv3FZn/DXFqw/B+A7armOh2G1/aIIi3n1tHVzqHwPogPN0R1t6IHgLU2/d6XnqQD3Of8fqodnZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9207

On 02.02.2022 11:44, Oleksandr Andrushchenko wrote:
> Again, IMO, adding such a big piece of DEBUG code instead of
> printing a single DEBUG message could be a bit expansive.
> I still hear your concerns on *when* it is printed, but still think we can
> allow that.

You do realize though that the mere act of logging a message may cause
the need for preemption, and hence logging messages in such cases is
detrimental to forward progress?

Jan


