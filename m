Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700E45B543
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 08:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230099.397808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmbE-00088N-Qc; Wed, 24 Nov 2021 07:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230099.397808; Wed, 24 Nov 2021 07:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmbE-00085n-Nd; Wed, 24 Nov 2021 07:21:48 +0000
Received: by outflank-mailman (input) for mailman id 230099;
 Wed, 24 Nov 2021 07:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpmbD-00085h-He
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:21:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e2de90d-4cf7-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:21:46 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-uHtkhGcyMLuKadbw4kZIHw-1; Wed, 24 Nov 2021 08:21:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 07:21:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 07:21:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:92::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Wed, 24 Nov 2021 07:21:41 +0000
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
X-Inumbo-ID: 2e2de90d-4cf7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637738505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFqVnAENQDllBUSyGSfZlLcMsiVQyNCRqsfLcJZhe/w=;
	b=OVD4P9Kb+70hHiVCyor6mL3k8H+eIBIkjvWJYnyGrsG8L2NPcJobtrviZfZQO+Yrds90Rx
	v6QRZD8V6tPYbVxR7hG9iubn2Wo8HqtgwTOlg5A9ZK27kdQYuc03lTR0y3hvwbc2M3Kic9
	cxWKTqM/v4Z+Cc7nQSIBqq1GvmfWxeY=
X-MC-Unique: uHtkhGcyMLuKadbw4kZIHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq3ZVjOOrNbsNTWcnzx8mPoIK8XCiPpOxzkrRM+u6ODQpIzTsQinl/HEacFBdKarChSOd6PmzgDqAgh4odrD6BA+CzsSYB0+MFu6aoJG8i9DX6H9Q8yydeSt3OTCdLmcPYbhUhXTDz4+Qaif2MLe8cPYpTyZ3JLJV6e821SP16HXfVyTbVQGw1ndPY8tLmZ28p6JjnrWcC3LZN+XYAweMCATACe/TzfmjFx7/bf3Di50fHao4G2J++2t/wIHIgf2Ka5+V+QT8LfS6E6WRdQKMb1+ju1jhAb1dyqQUEA5umzLQInZ07vGUimpmlN0xICbhqg58tdP+xUphIFK69eXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFqVnAENQDllBUSyGSfZlLcMsiVQyNCRqsfLcJZhe/w=;
 b=b2/f7bWq9KduJF4WPO1j5Ph657Mp5E24IXJKmoDGq9TfsqiX6uWRTjSPOVHjCAZJwO6+btjlvrdriT0HqbPh1rDa74IQZ92Wb+E80l7GEIvBQ6tGdhQibPnpACMm5+1GnHtzq43l0o7yXyFjwCSxQDwGMT/Mb9RSwfEg9tx6STRQFDp2906nPo6v9lgMbm0Lzi/XAaYD7B4FPKG68XailSW/f3YTiTMoJtlYzFLVt2EWMXNYk2pxQBuEWPqma4yYgdKVP8lYgieouJkKqL/6apUstFD5aT0Es6d3nwAnrA8cTNtsQDspBM2neMrVi70NFb6OnWTDQrvxTYcv8BMSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <984703cb-37f1-c418-679d-d4cb6cc01ed5@suse.com>
Date: Wed, 24 Nov 2021 08:21:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/3] VT-d: prune SAGAW recognition
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
References: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
 <4e801190-ad7e-32da-da87-985e1b6a76bd@suse.com>
 <BL1PR11MB5429877092DD0AF8A8C478DF8C619@BL1PR11MB5429.namprd11.prod.outlook.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR11MB5429877092DD0AF8A8C478DF8C619@BL1PR11MB5429.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ec0fa5a-eb34-4aa0-8c12-08d9af1b0fd5
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54706DDE8A30758822AB80FAB3619@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TLnruiRUZtGBJQzR4Vo9+tOmpFkh5jrUAEcCnDpDrYFq3gTu/yqibAJ7vsIpMuDZuj2gtzBvCdPTz33Ctx9K2fIH5mI09vqJ/32uXZfFZDG3h0bCBJGFopQS/WYdeGadW8zRPq5qbIYk8+9auvTI7bAVFmRBw4YmUv0YviEEbSmt9VF+n8T9+6xMDYIfbY24pO6ivuUuSsHKbLnkJembXlF7M5Wu/BxjVlfIuBJ38ubXOai1jppHoswwixvfXDs4JMJVNDa+IkDzEGQ57lBtuY19AGXOggG3jAJseuS+R0T7FH4jNMVShebeCCv9itlF5dI6SoivFn2USJ7OkCl/TnmV783YvCTgFfpsKh3uQ+zVB8EyJvR1m2V/SG+7QolqYmu1fKc0hv1kYpzfUGRPX4X1kWeic94VvmgxRVFhPXLtevj4IUuTEoq3H9g2LgoCk7cEvdfrrViLhuHM/0HIzymgl8jH+c4g1TS+hAgAWJB7dCSr+DqGV1d27uoRdr9M6sgPaOnDKjYKdsZNXjCQaHlR5KumwPDUyf5Y5ceStaR72yZnjJkZYPRkucbl8LwVEcE7a3k1ZFprGhWRbvscFKrTbqjEjCq9EuZ+ZfEWgsxbt1Lemo+8+FRo0qGp2in/vAMez+CrblQU6nu0mw8sOkiZhacoZ/GplU8cqFTetW8Sbxh26fx/sLH0u4JCH9TFg/XnskyD5k6tJfqw8svHrrhebcaaP+2MIfrYWIEzKfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(508600001)(4326008)(956004)(53546011)(186003)(316002)(38100700002)(16576012)(26005)(8676002)(31686004)(36756003)(5660300002)(66476007)(66946007)(6486002)(66556008)(2906002)(31696002)(6916009)(86362001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OCtZRSs4Y3o1N3RxMlliM1dYUzJRSVBsazh5U0ZGUjFpbEVHRXY1alJRYkJ6?=
 =?utf-8?B?RE9ZWXpYRWs3NFpCa2JadlZCQlU2ZVZTRlJPUUg1YVM5QlhzcmlvNW9kTGh5?=
 =?utf-8?B?eUgzTzg1cnJWREZOYXZaM2dvTlB6bjFSc0JCY1dxVzFjS3R1UzZPSmVOS2p2?=
 =?utf-8?B?eC8ranVNd1g2V0JlaWllQURaUWJ4anY1UnBJSlZQTlRPcUF0cmhvMTVWenZI?=
 =?utf-8?B?ajBJMlU0c2RESytTN1Y5R0lsWlZ6ZEFwSVZuazR0U3RQUGFGOGJ5a0dIRFBV?=
 =?utf-8?B?TlVxSThNdFY5YnRObm5nbTI3NjBLU1Byek5mY1JPYzJ5dHIvMGNtUkRUNVdD?=
 =?utf-8?B?ejU2RVlPMUxuY21yK1BSbi81dU5OOEo3dHZ3WFRvaGc3V2VQaXo1YjhDNjdn?=
 =?utf-8?B?LzQyTEZLZU85MEZWTUhjMEhHNUVNWUJxS0ZZVUYrdzhiQ09FeDRIalZ1aTUw?=
 =?utf-8?B?bXlYSzRWZWYwNldZUmpKWmRWazMrNHBHa3c5SFVvdDIyWWo3ZWRMU0xZa2ZX?=
 =?utf-8?B?eWNVQW5zS2MrVnc1b2EvbGxqWEVPQjQ5VS8rYmR5VXhqK0hqS2xJWmdNL2JB?=
 =?utf-8?B?SWlFWFAxS1k1VWV4SGYwK2l5eC9GaktFU0ZNNGtHUUZud2Q1VjhPYWoreUpX?=
 =?utf-8?B?cTJPOGJNamNlaE1WSXBYazI4RFZHck5JUEsvc09ldVA1eEcyb2ZWbE5FYnFn?=
 =?utf-8?B?bXhVOFozdDNtbXczd1pybkFKMjk3NEZCUTZ0Z1drS1RhcHJzT0xSVUhPUk1q?=
 =?utf-8?B?UHIrMmdVUkdqSWVCQTdiL0RGZTk2eGZuQ0w1VzUvRW5KZ3BRTENJM1Y2MnUv?=
 =?utf-8?B?TXZZZjRYYS9oR2wwWi9XSGdjck52aUY4YUpITlA1VldoazdQYkhnWTBaOXp2?=
 =?utf-8?B?aTU1R1ZUa3F4cU1MTFdXSUlKNVZsWmg3c3BQdUEzWHlReVdkdjlpVEVQWGVX?=
 =?utf-8?B?djFVd2VNZCtlOHZWUE1naVRhdWlwQzdVNktpU2hpQ24vNndCV2poNTM5VjRN?=
 =?utf-8?B?WldGbEtIdmFleDMwOHdveUlRSWhiWDBoSC9zTThGMHZILzA1TE1rQU9iZncx?=
 =?utf-8?B?NFN5MVBoOVAwZFN4Z1hkZFpJVmlicDF0TWdoWWdCSEM2OThMSXR1RFpKakFV?=
 =?utf-8?B?QUV3dFlQRk9paU91M2pKVGlJellGVEQyTTBEV3pUYk8xQVlBODc0d3FHbjNM?=
 =?utf-8?B?c3MyejJWVFBaaHRPNGkrejNNNFN0ODA0cmZmWmJzMUJwaWtqV0ErTFV2U1Ur?=
 =?utf-8?B?dUN0VDh6V2E4dmxGMlYvSkM0bjR0UDFkRC9CS3I3NnZ1NlRlandTemZwbFdt?=
 =?utf-8?B?V2kvcVlJcTVkZndNcXlNb0xyOFZoZ2R2VEd4dTRMbnk0WStUajZYV2l1U3gw?=
 =?utf-8?B?STFETnVtcFBjZGtJYU9PZExzUGwxdndWem1kR1BQUnlRVCtIR1E4MEJITXJw?=
 =?utf-8?B?SUpFYldhYkhmdnViMmJiMUJhQzZkaFhFZE1QRnFnK3pGQkZaN3dJZnMwZmpH?=
 =?utf-8?B?VkhCK0VXL0hmdmlMajF6VThUcFhZcmpkUGtPQ3R6dENkYW1MQWxTWHo1cWJ5?=
 =?utf-8?B?TGlZTk0xU2kyMUE0Z0dPSm8vVHlydnYxblZGR1huYlBYNXJCM2owbjZEY01Q?=
 =?utf-8?B?eEFXUXdPUEtyRE1IUmZPb2hnYUlqSmNyNDJ1T3k4TTJuMHAvWWhERmprU0lu?=
 =?utf-8?B?b2xieDA0eGpoemR5VUdVSVorcTR2V21JMFFFMXpCMUlzTk1ueUhPK0F4VDE5?=
 =?utf-8?B?TnhHYnhzM1N2a2xua095OVFBT3JKZldkSGJTV1A5d1BzN2wzcVFmQlNvODlB?=
 =?utf-8?B?cG05NTBjbG1qU2kwbk40L0hHNXJhVWhNY3dHd3VpcWlKbCszY2dYTDF6cGp6?=
 =?utf-8?B?ZlVnTHprMUQ5eUJRa1pJU0lvSm1GdzhzSUExc0xwZm5RVHh0NXA1Yy9QU0Jl?=
 =?utf-8?B?TmhpY292VnhLU0hDcjRvczE0eXBXb0FqclRzRmhiOXdROTBwSk83TENFU1dG?=
 =?utf-8?B?Y2UxbldjUC9BcmhGQUZyS3REWXBhN3FnYndsMHFRZk9yQVZVR05mWjAzWlZT?=
 =?utf-8?B?ZVV0NU1SNWh4Sk5sakpKeTRuV1RCdmNnazdpdVo2V2s4UURCaUdPaFZyUlZE?=
 =?utf-8?B?Q3EyU05hRDZscVB4WDczTUVBZXk1eFdJbHdTWEs3dkdtTTRzZTVLbklqa09i?=
 =?utf-8?Q?G4CaBMWK5zPE/L+kHTRbGjg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec0fa5a-eb34-4aa0-8c12-08d9af1b0fd5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 07:21:41.5856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/EUTR8D5mzs50Zz8ms2W/KK95CttWLI9pCpTpK0YhkQ/dTAOiP48gn5lOjzuy23o7Ofckjy+N0bFD5JkcTzAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 24.11.2021 02:22, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, November 23, 2021 9:40 PM
>>
>> Bit 0 of the capability register field has become reserved at or before
> 
> Bit 0 of 'SAGAW' in the capability register ...

I've changed it, but I thought the use of "field" in the sentence
together with the title would be entirely unambiguous.

>> spec version 2.2. Treat it as such. Replace the effective open-coding of
>> find_first_set_bit(). Adjust local variable types.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Strictly speaking IOMMUs supporting only 3-level tables ought to result
>> in guests seeing a suitably reduced physical address width in CPUID.
>> And then the same would apply to restrictions resulting from MGAW.
> 
> Yes. I remember there was some old discussion in Qemu community
> for whether guest physical addr width should be based on IOMMU
> constraints when passthrough device is used. But it didn't go anywhere
> (and I cannot find the link...)

I've added an item to my todo list.

> anyway with above comment fixed:
> 
> 	Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thanks.

Jan


