Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93900651E12
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466857.725815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZHY-0007bP-2j; Tue, 20 Dec 2022 09:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466857.725815; Tue, 20 Dec 2022 09:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZHX-0007YM-VR; Tue, 20 Dec 2022 09:51:31 +0000
Received: by outflank-mailman (input) for mailman id 466857;
 Tue, 20 Dec 2022 09:51:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ZHW-0007YA-Ly
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:51:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e077e9f0-804b-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 10:51:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:51:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 09:51:28 +0000
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
X-Inumbo-ID: e077e9f0-804b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzLSezhJ7oM2qQegkobI9687UGgohz2ztFeC+abIFeou9gkH6WqlPbUEFffWQG7GE9vWxzayrABsy9VHer1faDSn32P469KIcG3JvVAHdQ7TliYzbNISlyODrM6Z+sl9Tut++2kJNyWjlfB/UPwDsANvyO1peJx3WFVo+d/AZy/ACgYC8s80o4KE7ngc1J8oFuQ+7pZu41S+In/xGDr3EMC+T/WCZ7hkTejbiZI6bOLGRgoP5jcrfsSDXGygF0GGBHnazJWN3uKaVXMQD7hu/hO5URwqn/tcLKJz5Gy0WxCnxTq4npGeOcnDemFQOH+oZfyJ7LPLombPrcaezugeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0pwLeTur9mQ5MuOVH2MLC0uL5FB7U5JhVxqMT7ShEI=;
 b=Ccd/QN2qGarhh9/28fCwdLE4i+MZyLIGmN1M8nWxLlFqGAATUBx9wM3SxcDHJBkwyKgvGFqKO678aiMKgdnXGSRehvoXxJ67GwzHnYZNTMfT/8myWArgy3X1958JYIDL1msH2XzuXQk8BT3XkAO0fOOQlrbBPMmKJeKlzGkJi0HWeXs9dvnB11kcS9f8PIYbGhSFnyj2LUC3c057OhJQfPDtjYhXkaCHvhdCjuzpok9GEYcar0oAFSk+AEJiuYnxL6W43y3iksJjzkU2tN0rNaXnFuOjVN9BykSxSfeaHcEs4WJQsG0ObL8BSwau5paI/ne0geK27Sk2CUsmdl3YVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0pwLeTur9mQ5MuOVH2MLC0uL5FB7U5JhVxqMT7ShEI=;
 b=Avd8mYZ8JGOZ4Qi/SLFyUfZRBvNI/cw0rY+rzUDEjaI7FwLLlD7piuBmLcj7tOHq2nG/v2TqsordffH2CPT74HB7CI5lUoVqjEZQilRyR5yUY9c8ROSa/rDNqw6HvLx2Iz4FqCJZOu0MuVoFmlL1sCHjOL+qTnnOXOcUNK5fjOz9papj7nvTfd8Oh/9eg8hieoVSFOnJMzQSVEHOPmmVtQ5LtL0HJ42LLe6Pz4ZwYZ9wWzXC/9GWJ+w2NqytBveqYGYcZ4ssR0/3Ir7kuEKSkJZh1KxZy7V0Cl2lEKDyGQxfeaMG24YiIPqseE49ek9jQgjlqhbVe9vrkohg67b8dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77931264-71a4-edeb-0749-9de77bfd9c1a@suse.com>
Date: Tue, 20 Dec 2022 10:51:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 17/18] public: misra rule 20.7 deviation on errno.h
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-18-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221220085100.22848-18-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: 45189b83-46fc-4c4a-7c07-08dae26fc3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9kXaN272wJDAKBM0Rg4s1WgaaLueIUft3FtrdI4FOiKdDM1uGfBxDiDvZLbsxb0GRSjP57+5BQ6zaqlY89UBBO5JcmmuVsfpEvIC1gbKrE5Hd7EUnZ7gAV9oRbR3siRpfEHEsaCasDWcBgdsCfvDPCgupeducPjo/Yv3y8b2btwv8D6/fav4NiZbhT6qxQcsOZkU/lb0fITCT9VM9FayHxgI07CZJWIBnlMfIeNuJwC2epCprHSQ/rQ70aTJgrU2PGE+vG4EaGkJM2XfnaSe3Rdn2XYEr/lLowED2fa8/i6Krso820uceRJjySYVkjQx4ErHWnCg7EIRsHR/N0DLIAfHg5Cn9Tr2dTxEbDrIOM/vjJwzaUSH6n21xyOAGRLxDAmzTplb92fSzBhXUSqXrW3AYi73hDTrqakBRGTzyWFzzXCnUCrJwRIS30gmXNeP4DZ9PkFcUpngHIiOJ2HgPBNZ1lKpFedospwSggJ9gTg+VocXZXK+GGNEj23NITLvJOXQ86VNm4jsENcr+dbFU3rTbUzhcwth93eDB4kO7022uxDA7ZZAVYi1UyE8OUi3QWKANptaX7m8g5vEcYUi5gzpUWay6yy2pJNvQ7soTR3M7/4rX0cR7B1yWpG/AzHGD7o97QSBatNsorsUMW7MEjc+PrVfJnNmAPdW8UGADJ3nDNuGB7Kp+BwsaGFIDs/GpZDOlI6439ZBdqSLzgeiaaucB2BvmWYK3wfm1gaWZi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199015)(6512007)(186003)(26005)(478600001)(6506007)(53546011)(8936002)(2906002)(38100700002)(6486002)(36756003)(5660300002)(316002)(6916009)(4744005)(54906003)(31686004)(2616005)(41300700001)(66476007)(66946007)(66556008)(4326008)(8676002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTZqQ2J5dStHejdqSnMzL2ZIb1NuY2htSVhiUlo3Q1FnVlhBYm1tbmlrMlZx?=
 =?utf-8?B?aC80WHBPZWlFR1NFNHA3YjlraTErdHYzL3JVRkJNaVEydHlrZ0pwZ2QrV09H?=
 =?utf-8?B?L1ZKbFZ4ajIvanZONEFmVS9odjk1RGV2a1lIc1BNdFVUZE1IL1pQcld3cVRH?=
 =?utf-8?B?NjFQdmdTM0hzQUNsV3FyeCtyeVRqYlpsV1pMTVhFSTEzdGNaaCtoY3pVTGZw?=
 =?utf-8?B?M3N2S1dobkpLTGtLL2c1NThyVmVnYk8zVzJhL0xtdEIyZGUwLzBKZnF6SWJr?=
 =?utf-8?B?NTNiSlFWbWkxSmZrMGE2dll5MDhZd1VxVkhWb2dDdGtzN3Z1ejhFT0wwa05P?=
 =?utf-8?B?UHBIVW9pbVI2MmdqNTEvR1JqMHUxWm1uY2ZWK0hoZXpDZnN4SU9iRERWRVIz?=
 =?utf-8?B?QXZhSEM3YzNvVjRYUGlLUTB4N0tJQStCMEFoL0Q5Nzl0eVk4YTZ2SjJDc1hX?=
 =?utf-8?B?aEw3YzFod01kbUVFR0IxL0NwMWJqY1ZFMmtsV3I0dXZJQVFOL0dhbVUyVHgv?=
 =?utf-8?B?dC9WQkZYWENIVkJVaDRWRFlZQjA3VlNQSzlQenZtOGxQbTZ3cUcwcXA5QzY5?=
 =?utf-8?B?ZXB1ZXlBMVhWbW5rMlZ3Z1BUdjhaWE1NUXY1ZTJTcUhIY2tFMkdCcXJ5ZFZh?=
 =?utf-8?B?aFdSUmJub1lwdnMxVW1DbWNaejBCeW1HRGttSTdCcDdkWGgyc0FWTXIzUUFZ?=
 =?utf-8?B?ZVc4RUo5ZG5tWXIwT2ZNNXdyelBaZzBNWGg0U1lLQ3FxZEtHc2xZTXhIY3dm?=
 =?utf-8?B?NEx3RnpXTkJLOUtyVS9KVHZCdm45dTR2UWFPOGtsdXdxVm1ndERMWTluVzVs?=
 =?utf-8?B?TkxXSVI1dXdObVBuRllvQmxyTnlqWnp3M0dselBvaXF0Qk9WNHpWMWx2Wm1U?=
 =?utf-8?B?QmZuREZHVCtwMkhhbkZzdjVFN3hnZnpGQ1pQSHJxSEJPRkE5T280UTdPREN4?=
 =?utf-8?B?UFJGOUtndTlKb1dZek1iWExrVEw1UTdkT1BQNFVRTHZBbExTNHdEaEd1ZTU2?=
 =?utf-8?B?clZrbFQ3ZVFmbUxEWWpWY1JMWTljbmFnTjYvcUtpQU02RUZRZjg4UmJwek1J?=
 =?utf-8?B?Q3BvWndhMHQ1RkpVSXJ1OVlJYmwrdDlEenp6M1pSK0M0UGEvS0wrbktqVzhQ?=
 =?utf-8?B?eUUyUUN1N2ZxbFp3QWhxeWN1dW5IYStHWUlOVW5pTjI0M3FaY3F6NENWUEVt?=
 =?utf-8?B?N0hiUmpFRk1lTHdUU2xOdjJtejlqdHpnYmpRa0dBRG1SOUJGanFKaEJ3ZWRo?=
 =?utf-8?B?KzM4SEpEd056NkpFeVRNN2pVYWp3OFhJTXZ6Z09EZVZSdWhTOFlodEVjOThz?=
 =?utf-8?B?VXNGZjdPMHR3cnZJYlhSeE5yUndJQU1ZZlo5Y1pqN2FsUHpBOTY3Um5jeDEx?=
 =?utf-8?B?QThvOE9ESlJncmlrNldFYy93akJPazNpamhuOTlpMzhhMlZCYU9hakJQVjJE?=
 =?utf-8?B?RUswTXMyOEIxRU55WkhtTlNmWFZtL2NsL21EM0NSc242YWhNelRXSlJXZmdC?=
 =?utf-8?B?K29zY1dvTGo1Zlk3TlM5d0RQcmRERnpMY01hYUtCZHlMTTU0eUt6Nyt2cmRJ?=
 =?utf-8?B?QWxtRnh2NUZYUDhDRzBDamZvbFFOVTRHcEF2eVRVUWpPSFptS21qdmxoeXdM?=
 =?utf-8?B?MkgxRjRVZjM3T05LTG5ReWYxeDlFaUZNS3VGbmhxZWhiaWZMV1JZb2pVSm9Q?=
 =?utf-8?B?RXZ4SjN2T0FoQjN3QjNYTjdXNUNCQmhFbytBdStyVHZqNForekZ4N2h4Z2Zw?=
 =?utf-8?B?Y2NtK05TWjVRQ3VCR2FGTFdva2V1QkN0cXM4QTJaWlRWUzdGVjR5MzBRbnhl?=
 =?utf-8?B?R0NJOFEwZUVLWmIzUzM5OXBCNmtNM2R4ZW5NeG0zS2NpTmswUCtVbGxZQ3Rz?=
 =?utf-8?B?ZlczeDdCa1hqK0l2b3A5aWhLa0d1Q0IwNWx3Q3lqOWtKOEpDb09TMXlXTkFx?=
 =?utf-8?B?S0wwcDZTM2JmbkRhYTFDVHJyZGFheitHTUpNckhsVVIvenBBUWJ4eTVsb0tl?=
 =?utf-8?B?MmMzR2hveDZTbU1VOHlib1J0dGVKRlJxMlY3cTl4b1lPNkJhVTBwa1VRM1VU?=
 =?utf-8?B?amtFckRYM0syOEQwVjYzTUlmYzFaMnRxWVd3aWF5Tmt0UDd5L2FpMjZqR00r?=
 =?utf-8?Q?Xk+f94IkYd2unLD54zGz63Xtd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45189b83-46fc-4c4a-7c07-08dae26fc3c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:51:28.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfYFHSH7hjApZaAV0CKqaIn4j5I2xUYGzvuoie6/9CKs1i8yQY3lPJm8IFt17g87CVd7DWeULh9Lc8Tjzg6eKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

On 20.12.2022 09:50, Luca Fancellu wrote:
> Cppcheck has found a violation of rule 20.7 for the macro XEN_ERRNO,
> while the macro parameter is never used as an expression, it doesn't
> harm the code or the readability to add parenthesis, so add them.
> 
> This finding is reported also by eclair and coverity.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

But with the title adjusted - this isn't about a deviation, but actually
addressing a finding.

Jan

