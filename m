Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8B44C25ED
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 09:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277949.474806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN9TM-0008RX-BR; Thu, 24 Feb 2022 08:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277949.474806; Thu, 24 Feb 2022 08:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN9TM-0008Pc-86; Thu, 24 Feb 2022 08:27:36 +0000
Received: by outflank-mailman (input) for mailman id 277949;
 Thu, 24 Feb 2022 08:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nN9TK-0008PW-Rn
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 08:27:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d249100-954b-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 09:27:33 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-EH9uR_soNnWnWzKDoRUcqQ-1; Thu, 24 Feb 2022 09:27:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2910.eurprd04.prod.outlook.com (2603:10a6:800:b6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 08:27:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 08:27:30 +0000
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
X-Inumbo-ID: 9d249100-954b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645691253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFAFeSNMQrwq3dvf2PS+dxBgCGLjZYvktWV37T+uqIo=;
	b=d2FDS69kPERUWjX27bqw1Ay7kV9ej2rEZxjYmbwJbikE5WeSYawl5l0H1iQee0LxhxzKEY
	/NJtoKh301Neyq7pC4sTEsRMiDDWl4bcpXxhnRjqAiUBDX1S9Ft3FBFWwGwWo/M96MW+zs
	T5vKLh8C80g3FCtPv7bw/XqZyU0yDjA=
X-MC-Unique: EH9uR_soNnWnWzKDoRUcqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL90oqCK1YPCR6eg8wnEqtT8io3+S5yosXCanlBpqVPaWxamNY2f4JH9e9N1USvC4wabw4edqG97Iu5qpmoao5OToE952QwI9tKZealQl1YRhTvq3VSczNUqt+I4E+mSQgA++2vNn5XfdzP0qxCLMyB/Ic0l4mzyM0IwnV/yxszVZEtUCd0BPraJJg2LadR4d744VtrBuk2NAF3cJXNTwdR4ojgZZ91Qn/DmpiXLcUstj04G1MAB9GuBma1LiJRDv27v0bd5f9hZJLryPNJ+6ydEo7N1NzaeRqhVcEllbAgTuaJ0LazdN+az0Hfv1W51sqloSTw6wbGpePoXlPAMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFAFeSNMQrwq3dvf2PS+dxBgCGLjZYvktWV37T+uqIo=;
 b=YGON3ZGYXEzuY7DQs5LaAsed95yk4YC/MhTLk3Vj2VI35AP5kuiXi43aXq2ho5Sw/TkNlhc72vrkTxVJrnNSCMLRGIMjAEJPKxACu6wv65LGjM5o/gR0ThNZ99IB8KelUrMiVH8V5zFsONFl9UXYj6w6DkAQe1POcQZ7jwj+THhHKYAF5hkYoXTZiYC1UkLH97i+xfIVolyvLqyvyArmKLVXtqHlX6ctej2RQoVUW+KnE3dB/KyXYFmeK7k8ToJ5Y+IbfkI1u9tks2tkw+h64gdOrI8P6m64ZeNiRpTSa9TXYWJdJz4dY+gXqid+y+Tj/RGrzfMutXEYomOXUOANXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6befff41-528d-015c-3c41-f643c0b98530@suse.com>
Date: Thu, 24 Feb 2022 09:27:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/mm: Remove always true ASSERT() in free_heap_pages()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220223183831.5951-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220223183831.5951-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0087.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de09a04d-8c43-4360-0e40-08d9f76f7f4c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2910:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB29102506BEE0902B4A0C11FCB33D9@VI1PR0402MB2910.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SlfLFoYPWpy91Tp56n8RoiKUP3wgBWTGP3DBz1mobPPsaRHmtDrY7XreThglwyiiH+/cKoxa/uEvmZyWMhV6LjcHAt97PtB+BX6jQDmSMdRipsZ1u6tr78sVb5Dn6IEygGqqHIHGVgHBl5wlG1nQDDlyVk6NIbwJU1KPO+0GvrLxQD7MZh18HMjnfz4A9iQZhT1hKlxmnBrswSIkskQa+lPaZp0lGKWgEsIiXFsSU7DeuNu5zhy7pMUjSloTGjICzO6ZUKnlpns3oFWV2e0GesU2hh9zW8aKT8rqILWbii+0gZrnaOmQVMFkyHu1lUtWGLpPOwGc3iZm4rmj+pa6oGK2oEXQZCwf4ytSMMQiY4qX2+BpFbMO4cbKGw6HXy98dAbFGBo+Cd7Ilgh/OyvpCHhn0N2sXQOVE9XowgYd2MJhl7e7xIN9vCk1UJUnqNzQkZwWlhFgeoW81fYRVrAJ2jbfEDCEGxIs7YNqLC7f9n/gaz6rZkfZBmeE9tTFipTHxXf79wbL1my5d+WSxL+KaMPC3igyf8dO3qj0UgElr9r8x0h/lFwbgtCG6nJdXH+sKHodEeba3YibHfOK+hr/w3DSsPHPjIRRBDfDgfcOtVGH2QusS/hd2aGoZcnfiOFj88ykLXFYCg0x637R2ETsYquXFhVOOLUI4oWdnSMzq+MFmFzR7y43VgZKGOQIaL1oTejT7pHg4NVgce0iwcOCqT12fT38vDuy25goV2nkok8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6916009)(6512007)(6486002)(4326008)(66946007)(8676002)(66476007)(66556008)(54906003)(31696002)(86362001)(316002)(6666004)(508600001)(38100700002)(53546011)(6506007)(4744005)(186003)(2906002)(26005)(8936002)(31686004)(36756003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE9valk3R1ZpTGxaQ2EraHEySU55eTduU0NUS3ZWU2kveW1GaTNheUxqTHF3?=
 =?utf-8?B?WlJleGpvN3F5VUhQRHA3Nmc4ZTNZaWdhZHVkNWVPZTNNaEF6NSsrUHdQZnB5?=
 =?utf-8?B?UzFNREVydk1xYmpJa015d0IreHV1YVB1Q3NBY3Eyd0xLeDVhZ0prT1hENlZ6?=
 =?utf-8?B?VE1oR2RFQ3pJbjZjSDZRY29GMVl4MWNwcnVDUEtFUGlsWS9XejA4ZjdPUjFK?=
 =?utf-8?B?L2t4dHFTMFJhdHJHcmpNOW5pbTRsUnRDRis0YnBDM2VzL3pYVmwwQmFtc0Fp?=
 =?utf-8?B?SHNYeHRqSHppalE5OWQ2U2hoL1pMNHRWQnQ1UTB1ZnJ2OTFYYUNjY1Z3WTRP?=
 =?utf-8?B?cVlmbTlJSWNhKy9TMkU5UHBOd0pQd1BCMEdFZHd2R3FwUzhTMEVieXNHM3lj?=
 =?utf-8?B?Q1NTNkFGYnhxOWhWWDU2c2ZscE5jcWFwd3VuNnVhakduTGZTWUE3bFFOWmZK?=
 =?utf-8?B?amdFL08rWnJBNjZmT3lPelVOSllHYWlKL0tiY2NjRzdZT2t6eFZKTHJCZWt4?=
 =?utf-8?B?OWEveWtPeDY3ak4zNktJamRvNlZTbTBHYWdCaHNKZWUzVzdNdWp2eWtFRlU2?=
 =?utf-8?B?Rk04cVp2ai9INk1UVjJQZWoyT01CdHIvWmxSTFE2UklzTDAwVGtMYXRqb0hq?=
 =?utf-8?B?MUg4RkJvNEN4dm9ERVluUWZybDhxcWNpdndtSjhkWGNtOUw0a2xqL0YwbFFH?=
 =?utf-8?B?ZFFKZnRyVXJaZTJzQ29pSWZYR3ZkTSswZCtueEgvZUFYYWhqUG0yay81aDFn?=
 =?utf-8?B?c0pudUJFS2xzSGlvWHFtb08yeUZyK2dJT2luN0lOS1ZSQmhOZGR0YkJhQU0y?=
 =?utf-8?B?bS9WVnhqbjMzRHN1cXhlc3JhYWU3akNpVk5PTE9MR3dKb2lyamM3dDZjbEVR?=
 =?utf-8?B?VEtCSVdjMEx0bTVzeTR2RERRU0ZTQzRpM1gwRlJMMThRNFZVaVZvOXpnNG96?=
 =?utf-8?B?a1B0bEZhc3BiRm5IRTJlZEQ1cFk5U1o4Z0ZiK0dXa2d3MkF6Z0p5VVZHUENK?=
 =?utf-8?B?MnE5cysyNU5wbzVDT2g2L0V2Sm4xSzFJUkNILzhzek9TTmhIMzBhQVlSckNl?=
 =?utf-8?B?MU1NYWYxOUxZdWo4WW1kZ2lIZHRhV3hkL3R3aU4zbjdRUHd3VG9RTTVlRWhy?=
 =?utf-8?B?YmIraytkZFdYd3RHU3dyWGJVRWQ1b1J2MXN2OE5kQ1k1M2NqT0dWZ1c4aFl4?=
 =?utf-8?B?TFRFdFN1S0N0dmVDZVluVWNqdkQ1eGJVMjJRRnlJQStGS3BzKzd6SDl4S1BB?=
 =?utf-8?B?SVJ3cUY3UDNNUGFVUWwvQWw0L0ZseFh4YUttTlZDclNkVGJmY05rWnJVb2hy?=
 =?utf-8?B?R0dNOEppbFV4TWhHUnEwZUFRdFZxSzJ6ZnBnbzlydmNxT1hSZldBOTltdHlH?=
 =?utf-8?B?cXJrREluUUp0RTdzU1FpRlZBRVRKS1FRYUZzUDJpTnZXWlVjV05WWG1rNmwx?=
 =?utf-8?B?RWpNWURlKzVtTmJUWUZzZnphSWtsRXdnMXJnSk5CWHRQb29wdWM5TlpTM3lq?=
 =?utf-8?B?cHgyVmhIVVZWZWVQY3dYZndPM3lpT0YrRnUzUHBYNSs3eXVLT1lLejIvSVhF?=
 =?utf-8?B?NndabVhSektKU0FqU2pibURkYzNvTE9tUE5MTlNvRnFGTHdFOUs5aUxpcVlh?=
 =?utf-8?B?WW1BNWxsekRtTUNGTmhCSENTZ0Zpci9sdjZZQm1QV2hOMnNydXFqZFAwL25r?=
 =?utf-8?B?MTZweVFicW55bnhtL3hVb29NQXRES3B0K016SlBSZTFmVVdka1c4TWtYelVu?=
 =?utf-8?B?QlZCZnlxTGJ4K0xTRkRwR25YUFE4aWtIR29DcU1FcXExK2Jiblp5NWRSVWM3?=
 =?utf-8?B?bmI2bEVjRWVRRlFLWDdON1ZkdkJRWVArdlFocXNCdkhJQkp2MXNMZ3RXdzRG?=
 =?utf-8?B?THNWT0FVTVdHRmxHL3ZsRU13d0o1cXB4VE5tQm5ReEpGN2FOVkVIMmt3QjND?=
 =?utf-8?B?YmV4N2Yyb3JUSVd5S0NXOXdFay9BblBlaFg2cjNvWXJBeG9GSFRxQy9nd2tE?=
 =?utf-8?B?dEJUcFpBNmFodkJMVnkzbk9nSHhXZjJMOFZ2UlJ1d0x4M0pWS1d5K2RKcDlR?=
 =?utf-8?B?enJyemdKK0hldVo5VlYxcDhJRW5RUGxoNTM5eGRLVkZ0VEpVK1NWcG1ncU15?=
 =?utf-8?B?b1pOYi9KYXlQUzFxUjN4YmoySWJqQVN6UXp3blJTbkcxS2xXNk03QjlPZkpL?=
 =?utf-8?Q?V95T5FoG/BhLQeYrht0+KKA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de09a04d-8c43-4360-0e40-08d9f76f7f4c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 08:27:30.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftIX/X8kiVTWkqNzIujCU5GrThHESXmV/ijr/tPMFNGrlSXBDOvHkWJjHacVnfAAEgixY6JwTZbVnl99m0ZngA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2910

On 23.02.2022 19:38, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> free_heap_pages() has an ASSERT() checking that node is >= 0. However
> node is defined as an unsigned int. So it cannot be negative.
> 
> Therefore remove the check as it will always be true.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> I have looked at the history. AFAICT, node has always be defined
> as unsigned int. So the ASSERT() may have never been useful (?).

Commit f0738d2d3f81 introduced "node" as a local variable of type
"int". Along with this commit f1c6ac275100 introduced ia64's
paddr_to_nid() (backing phys_to_nid()), which was able to return -1.
Hence at the time the assertion fulfilled a purpose. I should have
dropped it in bd3e1195d694.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


