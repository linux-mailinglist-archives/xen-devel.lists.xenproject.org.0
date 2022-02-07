Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631E4ABE98
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266789.460493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3EM-0006aP-Oy; Mon, 07 Feb 2022 12:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266789.460493; Mon, 07 Feb 2022 12:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3EM-0006Xc-L6; Mon, 07 Feb 2022 12:34:54 +0000
Received: by outflank-mailman (input) for mailman id 266789;
 Mon, 07 Feb 2022 12:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH3EL-0006XW-8j
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:34:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 581d976a-8812-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 13:34:51 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-Ui77F_qhMhWFKoNT2CI0Pw-1; Mon, 07 Feb 2022 13:34:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5415.eurprd04.prod.outlook.com (2603:10a6:20b:93::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 12:34:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:34:47 +0000
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
X-Inumbo-ID: 581d976a-8812-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644237290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4HYMEJVPW4eKi04+wILEJ/uWqOBbCmoano1A7sqoUI=;
	b=NCIWq6RTcMWSu4WEUF/ZYUscHhvZuycUaLNyidhiBIo+9mnfRHj9v6Ygu+AmvXchqQJNka
	8kb+BYbQOH2Mgl4vzmjrgHoM3386sBBQYowdnduZKYlylGXgdLMFxjGVQYOFfebV68xPgB
	hkz64nFwFqfvgzYj6xRDxBZq+db7U0Q=
X-MC-Unique: Ui77F_qhMhWFKoNT2CI0Pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPCunMMh6ig0r6QBgHcyCEJFx2uJLNuHcHLK3F8c7WRTEXMMPzzBglGbZBVhiGw7zStxjN8e9SkDwjmufjPztOqHhe5vg58M/X4J1isQbXo/CpMlnc55opnaJXCFKsaVLCRrCFf6Z9PSMhbvcvmWNSdplFYofC/Lz8dWossTg48JZ1TE4//TW+y5lc8ULKFUNN5cpZqLIZQ7sLl/SBLSfxqa+AjU4a+B1nK7LnRpjaeqI4zkTgy2vce5O2NL8xMvaDfvtQS5HU3T+assVqmqmlTQLNOR7LoUMcz2QdQ/Q+VXpEQu+HqGRJ8+f4qfEZxJ32FtnwnSl21/9P5gCPsftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4HYMEJVPW4eKi04+wILEJ/uWqOBbCmoano1A7sqoUI=;
 b=drNh7IWtVAUlPIZW2ZR2VgPLjuMVlCKfgHlaLme9xZK/0+EkrZXNJ71cD+homjJCqvup47xc6myKCZegeqw+OJPl/4GyINBuaQURAFn+xYPB2JTcZsoeA51ibESNZXp8HlJrB3jPG/PRP7w9TdW6KDzGEHReUPTfnRPTb85aKkQX3BA3SEzvZaASl4VPwI/eHzjMP/f9G5dDpAZ/xBE27/mrb24zEo2bHMEBGsK5oV3OnLNCb/R2RLmP7+SkKEQV0Hum4CrtDKOvZ2PtM4SgYJD0myxg8XLki3uNYFJlRQnDI0DRIDHA6Jk9pqPoh9mg/YTUgrqq1F3nEr9qv8Ewog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a71b7835-cbbb-74bd-d25d-6824f6f10683@suse.com>
Date: Mon, 7 Feb 2022 13:34:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0095.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31113e00-6e11-45a7-4186-08d9ea3639bc
X-MS-TrafficTypeDiagnostic: AM6PR04MB5415:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5415DC9159E87EBF8CB0E66BB32C9@AM6PR04MB5415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h4joJ//g0AEvTnWE7OBOXeoJMnYIz8c2tt9DyWACx0Qm5rOztDzfhrKSs1Q6/SJ8L0X704vDHc9LLamtHSMOWn0kHhEtqnANgwQsi1mlrFhr7bYbf/NlW2hQOXJjJ1rqVPDwjY2OkG9CB3cOTqnOVhQtTVOHz+hpaOnVZXr4Yd+dh0brzJqNYIhnE+VKJImpo30kGU/NPKrXsPuEsC4k38d5MShbdzQFc2hh6Cfb+K7R5F8xwcvQonutB0neJgmFCc3ahbJ2vym5nNCarJCSFHPrWtnc/6XMuuhMHxeZyKkfLvR56WTulnUA1BMTqk+9y/BTrK1zm7fDYB6oRLcVH/44eUyr34G3r3yAZxVNGdI0qAxe+/n6r58h5y5ARe5P+qtqYgmTwhUvlc2j3lQFoAoWlvvF7XAe/Ju1ZX5RRBLvlZM7QCOflJ285oJtrXI1TpBU/KlVxI8vL9MV+R8eIZK8uuT1OWuEdLtHh06zaKjX96QX3KiSfySXoc2evzjqdgbk/yPdjO8LhLjl2v+2e+LRY9L/R13Q0OBFZemSO6szSRUK7bDLQdtB1pusdZJpgn6lJVUvrz9ndQrPigFEB1lrpAFLOoQouAs3ADojUT0Tx6pRO+dOQjp+ZIZiElMrKxrRUR3Cq/cfCTY4sEXsIgV6CCPKQEn91Aa0yNW048lw71XD7mPhefs4ZNh+QkUfmTU+EApA7j01EPAueipWGh3QIDGoNx1Ifuyq7guG1qc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6512007)(4744005)(38100700002)(53546011)(86362001)(31696002)(6666004)(54906003)(186003)(2906002)(6916009)(6506007)(66946007)(316002)(7416002)(31686004)(66476007)(8936002)(4326008)(2616005)(66556008)(6486002)(26005)(83380400001)(8676002)(36756003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkpWQ3lIRW9iUkdTVjhvV2I1UnB4VGZjSTBUb3ZQNWJHOWQ0bU9sakVENEhw?=
 =?utf-8?B?TTdYQitkTGtBOHB4bCtkKzNobkxnWE9EckZ5eFNhOUllbVM0OStqTEx2ZDBh?=
 =?utf-8?B?aVVKdGw3eFpuM2hjdXBLbkQ4Y2VmYndaejlMamFtOE9qckl1WHBjaTAvVXhR?=
 =?utf-8?B?ejdlRnZWZ3BYK3A4a3gyYUFCSU5namorcmkzRWp5MnBRSFRCNm04VXhxMTE1?=
 =?utf-8?B?cWVSc0haNGFrZUxPY0YrbThvQ3FTOVF1ZE9nTEQzbDhyL0FNNG1YTi83V1VC?=
 =?utf-8?B?YzM4Ymw3ajkzRVFWT1NQMStRcVVDN0FRVHBTcjZ0SEg4dmVFRFNnQVZvVDZZ?=
 =?utf-8?B?UnpVMVVDdjJsaDBsT0orMy9vT2p2R0NzdVF1aVJ0cTZzem04cCtDQXIvQUlY?=
 =?utf-8?B?WUJjVkgzSkh4MXRwMGJxeUpaT2YycjU0d2xud1VUeFd2YnBNK3hRcDRRTDN2?=
 =?utf-8?B?TytGWmZxRnZZUW1PQURvMlV2emlZWjZ4ZjROT1pzQkNpdlRqVHQ2NTFESGxi?=
 =?utf-8?B?aERxZCtYZytIRGhNTVJCSDVoa1Rwc1ZEZEw5V04vbklBSjBDSmErQTFqcU5D?=
 =?utf-8?B?dmpqckYybjNaZmpaM2RrQ1BSVi9oTHVUelhyTWlwOWpaOGVBc1hvbm9aMnFH?=
 =?utf-8?B?QlpUVW5UbXcxcEJub01VamI2UDdWK3pmTHAxdmdQK2tXN1cvdGZqN3lRbHlV?=
 =?utf-8?B?Qy9JYTBkdEFiWGI5b3FIbEUxTXpLQjE4QzBQOTVqTFhhR2ZiTFdXeGZabzRW?=
 =?utf-8?B?Ynp0K2x0ZjJ2eUkwUGRLMnpxUTEydmpMcWdPRVRVdTl2VW9mSHN5ZWZvYmQ0?=
 =?utf-8?B?SVhlYi9JWHF4SHlOZkQyb0UyNEFvVEl5SnJOaUxBTnEwMjV6cUI0SjB0bTZR?=
 =?utf-8?B?M3o3aFRHNTVQOXR6NjI3Zzh5NHc5MDZyaFQwbFNjc2RaVE5QWFZWckxJaFIy?=
 =?utf-8?B?NUNFUFluTDloelEzL1hwc0RSYVBHeEErNm9HOFQrMFBzYis3S3ducUNpY0kr?=
 =?utf-8?B?UVU1OFE5aHZLWnBxeDRsWCtvY0FaUlNOS3hqQXdzOWR5dzNjL3dUTGZNMmZN?=
 =?utf-8?B?em5WZWlEeklsZUlIbksvWURMUkVvNm9nYVpmcXBqUGo5Qm82WFlhQTFtUEJZ?=
 =?utf-8?B?enJaSnJRbTFoajQvVzFxN2xvUTcyR05kY3IzYkt4di91RlkrN0U2V2VNSGln?=
 =?utf-8?B?N2NjM0JRczFEZGZ0ekRUK3BVMkI3MWs5ZW1yb3lmL2JGVVN5Z3pFQ1lGTzZ2?=
 =?utf-8?B?Vmt6N2lyd3FzakRQaHlWWTFscEFLU1RnYVZoaVpvQm9pelJ5YStFYVpReHhj?=
 =?utf-8?B?Sjc3U1QzVXVwb3N5VWpocjdnUEU3R2VxZ2tEc3BmWW1HNjRvc1pWSjM4MURn?=
 =?utf-8?B?NnFjT2JkaXhSditrWXJKdFViODFxSzBiS0hGOFViemxVRU15RnhEQ1R1amRH?=
 =?utf-8?B?VTNZV0JjRUFaV2xxV3hIVTFNSENaZ2dyRkwySmF0Y3EyNW9OU1dsNUM2Sm5O?=
 =?utf-8?B?L2tmMWRMSWNFVXl2TE1lSTNqeUNVck5FUDFuaTJ3dXR4dldtRlhWbkZvdDZh?=
 =?utf-8?B?eDlKOXBBd1RjR2Q1M3hKVElIZWxTSGNnQ0loeVR1Qy9ITlNuNDY3YTF1Rkt3?=
 =?utf-8?B?OHFoSjN0eVg0ZzVucXdDZ1BRM2lKdkNZaFl5ZEZ3Z2RuN2ovVUdHZHlCU3lz?=
 =?utf-8?B?YXdiTSt4YU5GM0VxeU5Gbm53VFpLRG9aQzlhdWdrM0huMGx1QmwrNm1jV3Nz?=
 =?utf-8?B?RU9xN2JneUJwaHc2ZUF4SDE2UCtjcytSWlNsa3pUM3NyT3F5MnlsM0FWbGlq?=
 =?utf-8?B?WkJ4c1AyY0hsZGZnZUpPUGpvenQyNnBkcUtib3VETndyVHZmNTVzUldsY0hF?=
 =?utf-8?B?VlB4UlNzbWtVRCtKeXFjSGJFdWMrSWlTSmd3ZFVQYnlIdFJoVSt1Vk8zUjVQ?=
 =?utf-8?B?ejNLSUtQeVhxOFU4Y3QwMmNFblVWN0FNeXhoSWwrWnZzOWlqMzVBNmlQbHZL?=
 =?utf-8?B?eS9jWWFFM1JMU0FmTkVDbGNWRndTbTVKWGtJeDFYbkkwU3ZHeDRNMk5hL3JY?=
 =?utf-8?B?Ym4wdng0S2FtRDdmVWZ1bCtWSCtyQVN3S0tROVpiZVpkaUpROXNyNHBZZTRo?=
 =?utf-8?B?Y2FSekhYa2dJZTMycEFoVWpjSjJVWVdBbXdQVUNqdkM0N2FvdXFIK1dOcHhN?=
 =?utf-8?Q?8d/g7YHCzsBABwchTpW3v24=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31113e00-6e11-45a7-4186-08d9ea3639bc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:34:46.9595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FETDjQtWLfMAPZbrK5/u4z+er255IB9MVKLJ+e0BabJ0f9RrZ3FvNuTeWlN2vbBdKw3Y4KYDKt6C6Ptmvl15Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5415

On 07.02.2022 12:08, Oleksandr Andrushchenko wrote:
> 1. vpci_{read|write} are not protected with pcidevs_lock and can run in
> parallel with pci_remove_device which can remove pdev after vpci_{read|write}
> acquired the pdev pointer. This may lead to a fail due to pdev dereference.
> 
> So, to protect pdev dereference vpci_{read|write} must also use pdevs_lock.

I think this is not the only place where there is a theoretical race
against pci_remove_device(). I would recommend to separate the
overall situation with pcidevs_lock from the issue here. I don't view
it as an option to acquire pcidevs_lock in vpci_{read,write}(). If
anything, we need proper refcounting of PCI devices (at which point
likely a number of lock uses can go away).

Jan


