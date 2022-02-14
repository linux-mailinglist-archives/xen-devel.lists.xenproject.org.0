Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E94B52CE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272317.467107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJc2U-0007OC-7D; Mon, 14 Feb 2022 14:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272317.467107; Mon, 14 Feb 2022 14:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJc2U-0007LZ-3y; Mon, 14 Feb 2022 14:09:14 +0000
Received: by outflank-mailman (input) for mailman id 272317;
 Mon, 14 Feb 2022 14:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJc2S-0007LT-DG
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:09:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae7b4f7a-8d9f-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:09:11 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-t3T81VKkNA6UCAdb9gcibg-1; Mon, 14 Feb 2022 15:09:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6836.eurprd04.prod.outlook.com (2603:10a6:208:187::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 14:09:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 14:09:07 +0000
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
X-Inumbo-ID: ae7b4f7a-8d9f-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644847750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T/Wg8UUDDKuFbkM3QvHxuum3jOuNYrYnWD02Zgbhh2Q=;
	b=lwaRnAw2RWVWoaP4C1/407LgS7Jj7ThEJwVv+WcTDNH263ACtD6HPNKWCWZRv11UTqBXwn
	aRCRQF0+Qk44gsmM1Vb24CZoud0sM0icV6ZKHURqL9xOxiMX1Tne0e0HF694XuCFKeWi5H
	UfvhXqOVP6ZDzb8Y7ESqXHGzO229rNY=
X-MC-Unique: t3T81VKkNA6UCAdb9gcibg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGydpSGFt4JB8LW6TzCV8JisJx8r0JCSvGVCgs6aG0l+V/9r1T1R0O4oSMW5HAp0NmCnWXE5mhgq3gf4t5mLU4DP4E63EafIHhHqaiMde6Tv1AeaS367GPXir+xHq8Mw58ZxHT84yHadRtjvwA2Xf1kOXsaA+zCFmjazhTq3qABkD3MaXzIPrGSJs6l7vsWyjblWlG+WpFAYNXSSO+8Y0AuzCv3ch1KGP4SZU9YuxBVEJGLFIbTANDfBySQi0ZZ+QL37u8Qcw8TCtAQG2l92h0hZ+KsvwkqGc3vxfp6dky7RBcg8kcJeaXHVUbb0Cw0uakAaZEb5MfMtHtedKKUq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/Wg8UUDDKuFbkM3QvHxuum3jOuNYrYnWD02Zgbhh2Q=;
 b=cfqF/HffRnWKvSjlicM2G34VZogELXRbaHknhYF6Sm2on6DX+nfBU011Xgpp8C7rmEOoI53VE8rCbCn0v01FHM90Zl0EpoMhIuvqaGls70zEAQM97nCLcfnVp8/bgdBAtyvVIDe3hjxWLFKA1KoeUh0d+WmaMs00jqpzx7XTfA3Qna6HstShusjM4T4WYVvXSCsj1l2UjkUCNh2UDp41bnEOXlN8d6R5mAvo8CWu3xoTZxAtdngMA/uuH68Tk0eDpx1EQIKPPpOEiiI08UTOlyxhNobrAooP0qgwJQGkNzEnd4Q2o1sK8xRYj9gRjTBohYA5b6mkh75fvrfHFzSFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3390f69c-d3d8-92d0-b434-0d4902d0b478@suse.com>
Date: Mon, 14 Feb 2022 15:09:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
 <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
 <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
 <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
 <f0e202dd-1f6e-4aac-1381-a64a7fd12270@suse.com>
 <ba901778-ce63-12f2-0a54-d56998090200@epam.com>
 <3538350c-0a63-59fb-7bba-fe460c0f1607@suse.com>
 <2a750ae8-9ca7-2e74-b878-11b98fcb4ca0@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2a750ae8-9ca7-2e74-b878-11b98fcb4ca0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:206:1::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1571a934-f857-4caa-e30b-08d9efc390c4
X-MS-TrafficTypeDiagnostic: AM0PR04MB6836:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6836256A4349D81C55A912F0B3339@AM0PR04MB6836.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HwHECRlf8p2j869/TwUHOI6UfJBMB6FJ0IpbxHBeCMg9HhkPhqCZedtnPkzXT9ZrMub1jZex5MCLg8tmAC7V1EioKhILa5HI2IByA0cURox/CicVACLSKFE0COqaUoDItpNIqbrVM4mY08sdgp3nzvON5PbJxt1RHVH3y93CR4cMWPvuceYhZq+qEo8cFYoBBArSd7ZiWqrf+Dz/k8rMU63NOvRGj/0c+dkKUIt4CP6N0G38cuQaB5mvnmfEwnIAX8jKyTMg5XMqcurZBJ/8P/7aKZKM10H/v/sbyuEDpcQkt5VunT8/prZHI6OSBtNOsoRMFF14XuBRWkiKNzNrbA/8LN62cCxWdg8lVyfk+m23SowcdqrpR7GDZp/sXLPt1xDuVh519udpzQUjE1B8Wx5o4vlQcFqYiTgRBWq0hDCv188ehy8xJtWXRNpDJaY8gEBHAxLVDjnjzaQk/uI78rXooHYbrslC0rQ2vYxmYQRO56fM0V7KBhs55YvqPkYyZEfHhF0GcNO6AEv+mC5ajjlPyJUXHnTNM2ZwRWUERxh+czQF5DFrwPjoX66vDfWhjLMHcW29r8l/70mCwRALxCsaMxCVfutFu+r5rFdHnUEwRwa8dkXbS0OUKm84220Tngu7cT5QpZ7o0/DV6F1m7v3bTQkC44xQQPjCty8FLBFAaAj9i4SZuv8rD3aWB5HybjrJqyyuDw7z+neNAyBfKiljX4o18YPgg8Kji57Ru54=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(4326008)(66476007)(8936002)(8676002)(2616005)(2906002)(53546011)(38100700002)(6506007)(6512007)(7416002)(5660300002)(4744005)(6916009)(54906003)(83380400001)(26005)(186003)(31696002)(6486002)(36756003)(31686004)(86362001)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk1ZV0VRNGwxTVIzVis5c3ljamQzK3dHTXdFWWRZZWRwUStzTWRMOElMOGEy?=
 =?utf-8?B?UTRVUGZnenNmVU5XNVFZUVJrMmkzU2tVbE1WMFBqQ1R1dkMrTGZ6QXhCaWNx?=
 =?utf-8?B?UFBBYUNzdFBzNXRTaktTVU4xVnBybGkvbllYbWhCR0VRcTVQYldEK1k0N3dw?=
 =?utf-8?B?NDdhMHArQmJhV0pOUWxzUzQ2N1RyK0R2ckxMS0lpRHp3TWlCRFFzMnBMK1Za?=
 =?utf-8?B?Y0dJcVN5UnlIc1dDQjFBM1lrUFVsWGtCYmk3U0cweGd1emJPWkNCc1JNbC9w?=
 =?utf-8?B?bWFMSk4vWndFMUd0YmFleHFlaEcrQWRienpMNDM4bjBJYW9NTkJJenc1LzNr?=
 =?utf-8?B?YXVBd3Y4cnpVQ3krWVpxYVhOT2gwNlIrTlFiWDJrbEpIMStkTDVoU09JOFd5?=
 =?utf-8?B?QVBETlhiZ2lyZFl6S29WQWtOdFRIQVRkaHdRdDEyV2M3eWNJd1dmV1Rnei8w?=
 =?utf-8?B?aUxNS1hlbGpQaS8vd0YyRzhjaTR1dnB0UnBtYVU5RHBTQndQbkRFZnIwRXB3?=
 =?utf-8?B?VlFyMEk2Nm1QZnVyMVpBZlcrSkdveWlmR3A4OG12ZlB1VzJrbzVQSGpNOUNa?=
 =?utf-8?B?MldsVVJjZTZMSnZKejFNa0pCQVkybjM5eEJ5MkY3U1RKZzlHRDh0bU81L1U4?=
 =?utf-8?B?SnEwelZoNTNrbUNxMkkyK0paUkNmaHE5WTVrWklrcXZ2ckZDVTg2NFowVXJj?=
 =?utf-8?B?ZE43S0l0MnlBMXdXT2M5MzUxZWpqc2NGbU9Eb2VxVHNtZ0diSWxUb2pOajdI?=
 =?utf-8?B?dmprTFAzZVpaWHhrZnRtbi9qRjUxWkRGTytJZGUvSTZ5WnROc1dnUzJlZEMw?=
 =?utf-8?B?K3hoK08yRmtpcitjeDRPTlFQNmdzQXJOOGdSdVlSYkRINitqbG5ITzdkZW4r?=
 =?utf-8?B?MVhNMktORUROSFBaUVZoZFVxcGl6bDdyUzdvVXhLVVdpckR4dEtPOWpKWXpE?=
 =?utf-8?B?Q0NmczRjZ01UV0grQTRNbXhqbGV2M0J6OGtPVVVWdWpwVGRWRkxUS3FCSHZs?=
 =?utf-8?B?Y0N0dVJDRFZDQS94SzRna0pIRXZ0anNHMGkzVEJjQnRiYW9VMmo5Sisxanhl?=
 =?utf-8?B?aGhRdFYrSFNkc2xGTGF2SEkxVnR3eVpBRUdIZGFHM05RdENRUXVFckR2b2lN?=
 =?utf-8?B?aXY0cUJKcXJaTzZzM3g1RHhja0NTKzJWTDZ5bWpXdUJFMFN3VlFiTlpVKzRS?=
 =?utf-8?B?ZHY2WTluMDVZWE5qNkY4OFo0dmdFTDFDVFVFN2lacjBHVm9NelBUb2lrM01h?=
 =?utf-8?B?cDZXTE5aSDRTSUh0c1FmdEFUWWQzeklqM3BWKzZiRUxjL08yaUZDMzVJcjQv?=
 =?utf-8?B?Z0pnYlBuWW5qQ21oa0xhQ2UyTzNWZCtMb2N1OGdkM2w3TDk4d05RUnRXTUZk?=
 =?utf-8?B?MGVrYnpoeEFZclNwaXZUVldEMEV6TDlyUWd4RUw4d1ViMys3dmJoSjFCbzhr?=
 =?utf-8?B?VGhPV0JDQjhsa0YzTVhTMkRoMmVobHNhUWF5aUlGaEhaQUxtTDZUdFVOUkNX?=
 =?utf-8?B?NDd4Z0JmUzdObzBadElUNnNEM1RrYzlldVVseTMvb0VrNXZtRUd1emZ1ZUh4?=
 =?utf-8?B?Q2h4SmdKeExVcGt6V1ZNK2FtNTlNSzFGMG8zL1ZBQko0b2k5TW5zVVNTWUda?=
 =?utf-8?B?enkwK2IyaHpEaEhlV2VNUVBXVTFOaXkxejY3bDN2RzVvYnY1dlpFbzRvQi9w?=
 =?utf-8?B?ZWljWTh5bXJhaG5Uc3pkNllzeEtzSmVENTdzc0JEUDlVNW9HamY5WkF4OEZO?=
 =?utf-8?B?UnpMVWpNMlVvRnNuMHRmVFhXZVFuQTBZZHcvZ05rSE9ETlV1SjB6Y21iVTJr?=
 =?utf-8?B?RlVSdU9rbXpHVkJpcGMra1RSMTBPRUEvRFJmMWF4a2dueWMrZVY4NmFNZ1VE?=
 =?utf-8?B?eCtKV0s0STg4WTBKY0lKMnc5U1J0TnZIZ1FTZkx1TkRhbWUvU010Zyt6V3dh?=
 =?utf-8?B?a08wUjVFbEhLcDlpRFBiSjVWWC92ak0yb2lESjJjVVBZVmR3a1U1QjY4ZjdT?=
 =?utf-8?B?L2drMFg4UmE2aFFicWtuaCtObEY4UmhFT3BYSlZGTVJRdTRIN0pvQXZySDVU?=
 =?utf-8?B?R3ptRVdUekdzcmRDbWhoQ1JROC8yTnM4cE9vSkZXa1ZvZzhxMWdhVTNiWmU3?=
 =?utf-8?B?RWc1S3RjNXVsYi93bXpPbWpaYjYrWUVSWGZQdDhpZmRjTTd5Slo4eWhJWUQ0?=
 =?utf-8?Q?ZI1gTajVz2tX7O/yn7Y9jec=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1571a934-f857-4caa-e30b-08d9efc390c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 14:09:07.7525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aJ1E/M1biC8p6NENJ3FEkPj8AJ/uaO8cxFznfjsUwT46P27VDCdI93F0eSB3k3+zTxschpbX9pXBnRcHJ0trA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6836

On 14.02.2022 15:00, Oleksandr Andrushchenko wrote:
> /*
> * FIXME: apply_map is called from dom0 specific init code when
> * system_state < SYS_STATE_active, so there is no race condition
> * possible between this code and vpci_process_pending. So, neither
> * vpci_process_pending may try to acquire the lock in read mode and
> * also destroy pdev->vpci in its error path nor pdev may be disposed yet.
> * This means that it is not required to check if the relevant pdev
> * still exists after re-acquiring the lock.
> */

I think I'm okay with this variant, pending me seeing it in context.

Jan


