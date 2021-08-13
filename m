Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2D03EB599
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 14:33:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166782.304429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWMz-0006Rd-HY; Fri, 13 Aug 2021 12:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166782.304429; Fri, 13 Aug 2021 12:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWMz-0006OO-DT; Fri, 13 Aug 2021 12:33:05 +0000
Received: by outflank-mailman (input) for mailman id 166782;
 Fri, 13 Aug 2021 12:33:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ewIu=NE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mEWMx-0006OI-U9
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 12:33:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9974a062-fc32-11eb-a28f-12813bfff9fa;
 Fri, 13 Aug 2021 12:33:02 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-MtFkcKSZOVqltWI7ViIKaQ-1; Fri, 13 Aug 2021 14:33:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 13 Aug
 2021 12:32:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 12:32:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 12:32:57 +0000
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
X-Inumbo-ID: 9974a062-fc32-11eb-a28f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628857981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DvMmR/9mCn/kuHaEconYQz8kajc6oHyUAPnssf+vABs=;
	b=NYsE8G7DzNIYAFfkhKCi31EJr+Lg8k6jGLoxXRL+6jdI7hlkaWmucmTN43LzE1D4eFvOZh
	H+NjvglsoO71Oz7/+sdLHML18WZdVkK35Z+DtSi6HHX+7HZRG5LilMpPb0b0mg3q6lJoul
	mPSCMmov9fNfSe8bu6gjD14RFSsnpj4=
X-MC-Unique: MtFkcKSZOVqltWI7ViIKaQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKeh5vs8CswjGlkaVwYwDBG6oZUmso14IvoCnPgMnHkYpPRWSu8meEtcUoZmjFbR7DozD55pSUheV/Nm/UGxEMRKhM/I+ncwBDOnhXDCksIFYOQOOxfnBSA25Au6ItVZwHr+JC7i3j3vc1otOIJXjo3ADe6c37kXCpa/NcjgIzxVHYF+IT+U4Qx+Xzj1eXQ/DFCSKUn4cBxxBpYNRcwnRBEFdmQMAoMwLGE020b8omHSZ60RTWmZbAX0xEfBGL2X9+pZkWw4ayvyBJNRF18XEOSAz2RuhdLo2h0p0Uo82CpKe0Sx0nkt54IhtjQe5MAWQ+aw4+xN2r2jMs9bDnQm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvMmR/9mCn/kuHaEconYQz8kajc6oHyUAPnssf+vABs=;
 b=K8gSL6GJKrdx2BhklurPkPEUmoMs4LnCCo3BVojtH1RcgUiO/fNA1CN3guB/CfaKGT2k2Ps6eJm/acoWEs9wpy3tnYBXQtJooU8RKr5q7TeRAR5SZiK8VyJ3xiJJuMrFd8brVRrkjh3rcEdKlWaD7bXP6kooKU7aO3AeZnUytmJnttg1WYjDFunkWiWhQ33dr4iSsSlThRiP2cpq7ceUNdAWexxEpKzPqunWswWMqyCG5KRStIc/CRmw250h/X3LK4V6DaboGRmW70cyEqHyBBJ0yqWGNOnF96cB8tIObDlKslqgGKx0oZ15APYQlZkRppn5o1+oP+/nrcfE4V8TLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V4 07/10] xen: re-define assign_pages and introduce
 assign_page
To: Julien Grall <julien@xen.org>, Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-8-penny.zheng@arm.com>
 <58be6daa-d8d1-1907-c549-585f56075a99@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22a377a2-86c8-9c9f-1249-73c9d903269c@suse.com>
Date: Fri, 13 Aug 2021 14:32:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <58be6daa-d8d1-1907-c549-585f56075a99@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0015.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d33e870b-c919-40d9-1002-08d95e567b68
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617329C2BDCA4D22B5EB6CC6B3FA9@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u5YmreQNRVKmygq8P+a60ZePYuzVkJVO5A29NA+pOkUqC/L3ePhb8oZ2qvttTizPbkWOKVxNckMLpcW4RfmF5nlpfg7ksduWAgy7YW5Ejhe2iEylJFMcr+YUUEOnwCMb5oj/TH8i7WXRRuG4tdsKSTNllCxbvkXaLEvSMlOqR3sevXMMKbDjJWSfMyEn8geT75Qw44m1bEvfCoLE0J9gO7g2EVBHaj5/fzoCmvE4D4Hj1OYgpuoJMOqRwDFF8UD3sHUoV0bwJlgIZirMCwMVKRT3lLl3WQuqU2aodMxN1AG5r1gxxo+HBirkopmnOeeEHVxVQncG8UTNT0QRiqFWIKMblFmO1jyTFOow7It+rLZxXxyrVxhMPOcF+VnmxWCt2Tj8F11aC8U+YT2qhZMoWXcQwCmd8CtnjiewJT1ofWgTxosQsoDHhWFbv36Y5U75wSD6R/uCS5XAz/8SnRI5TxZTEKXPo9Bm971P+jmFWlV9rOqCPL4ZwvLLzii50ARV1idxynsJqKf6XBuJnnoQ2EHDBoB+92bxBtaam50vgaSZNPrR4krJYMhtr9z03aTvr5D+omq1ewa/Yg1jSrpDgkSpvr8gG7FLLT+zQYcduZiFwm4O6Hu43kury4FUZmmlEPGyB4x/LA25mdp+ntCa46q+iHc/ob8+9XRIQJIcYZVXENd3TLSAhCfKM6oKBCzEZKLRZ3FURiktsTUZM7iidN/X1GPIYsJagTwtz3pD8l8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(39860400002)(376002)(396003)(346002)(53546011)(66556008)(110136005)(38100700002)(186003)(36756003)(26005)(2616005)(4326008)(86362001)(83380400001)(956004)(2906002)(8676002)(31686004)(478600001)(6486002)(5660300002)(4744005)(316002)(8936002)(31696002)(16576012)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEtkanFiMlZERGNSdFBINFdVSG5sVURyNXg4RkNKaFRaYW56VkptTERqbENq?=
 =?utf-8?B?a1V5aEVqak52Qk00VzJZaEtKRG04ZUhoSU95ME02Y1U1QXFOTUVSUW9hN2lp?=
 =?utf-8?B?c3cxMjJBaDNkUVlTRVFITVdoeU9VSTdZcTMxczFEQVNxajhHSCtpVURpUWU0?=
 =?utf-8?B?ZFFsaUFXL3pFalgrVDUzOTB5Ym1OYTErVUlPUDVYdTdsRXNLaUtKL1FCRnZt?=
 =?utf-8?B?WDQyZHhndk04NFpzRktScWVMeUxCNEEvWkdHMUdOUnNDUE5PUmlCdDRXY3hu?=
 =?utf-8?B?NHBNeXJ3ZitrMGV0RVU2MkYydUx0aEViNW1lcS9aQWVaOERFQ3JCMDdZQjJC?=
 =?utf-8?B?WHNpdDNra0tHM25mQ2MzUXY5UTFsenZESXVCYU1tcEtzQWl0c2RYdUk5UUNw?=
 =?utf-8?B?cU81YVdWSEw0Y3F4TUI2SXN6NFoyZEVQaXFZb3ZHNWFOallVdFFub0Q4a1U4?=
 =?utf-8?B?cHUwRis1bitaN2hUdlFKbWRNNC8xcjJOOTgyM3NDR1JzSzU3dzFMTG0zditw?=
 =?utf-8?B?TDJmdlFnckQyVTgzMjRyZzE1eHNsWjBRbC8xOFQyZGRTSnJPeWVNM1FjU3Nj?=
 =?utf-8?B?L0JzZTRYSWRGai9VeEVycjhSNWZoYWVmbzdzSzJlQnk3YnI4WHFFcXAzKzRI?=
 =?utf-8?B?NEt0TXRYcXY2RHREMEt0S2pEU1R3bEF5MzJlSTNsenRpcnJ4WncyMWRpdkRS?=
 =?utf-8?B?d255RXdSeGJlZURwd3VodjdaendLMDZaMCttQUIvcTJxOENJYjhVM1d0ZGxo?=
 =?utf-8?B?N1E2d3d6djArUEEyNDdGWE9sSForY2Z1UFJLRVpJRUc0SUk2cGxTUk5Ja1RP?=
 =?utf-8?B?UVY0bURCWXJ5MStjaUk2T3EwZzdTS0FOcHlZUDdjb2ttdVpDR3RvS25oSEU2?=
 =?utf-8?B?Yk5qVEN3dEhLNjRoYVpZZ0gwQkc5ZUlDbmpKVW14cFFDY1UrZmp4dXFaNmdE?=
 =?utf-8?B?ZXdGM1Q3ZE5hdndGbEtWblNXeXlnU0RGdmRsWGZWUkdEWjFxeWk0cC8rc0Y0?=
 =?utf-8?B?TUEzZW5SL0pFZ2hueitxdmJSZ3lnQVd3VkRZcUFkVzV0Yit5WnZNcVdwS0Nk?=
 =?utf-8?B?UUJGV09ycVRmTiswVm05RzV0dGZjMU8xMVhUU3U3cXpKVlc4WCsxbTA5QmdE?=
 =?utf-8?B?ejhIMFRVdDVJVzZrekwrZC9pSk5SV1cxMnl2UlBpNmtWQmI2RlB4SWNacWZx?=
 =?utf-8?B?bkxBUW85UEErUDVRc1N3WTJrV3NHazRPOWo4eDVycG02akMweDdpdmI0ejYy?=
 =?utf-8?B?dVZKNmVHK0N5QjVCYVdRSWxMd3N0TEdtWktFYmNOSWRlWkpvNTdKbERGTFBK?=
 =?utf-8?B?Z2F1N1UzMmM0TnR1blVVeENGWEpMemFqR0NDbUNJMVhuRkpqUlFkeDVRMmdT?=
 =?utf-8?B?S3p3RElRanYrbHB0OEJIYXVqUHVQelRhM0luakRyRndiK0tJdk5IZGk3dHFM?=
 =?utf-8?B?RmZyNUlhWXNZQnVRMnRqSnNPSG9TUGN3UXZYRWlZVll5ckFweFlRaXRnY3Zh?=
 =?utf-8?B?VzdQSVVuaDVzS0cwZEQ2eWFwNUc2OENpeEhtUUZQZ0xxdE5wRlh0VG1oQU5q?=
 =?utf-8?B?enE5SW9BZzdCVTQ3NlgzdjBIaXRKek1IM1Y4QTRzek1LMTNJdElsOE9IQkJD?=
 =?utf-8?B?VkxuaExaVWtBNkFzckpPMVJJN1htYjJKc2pJZWExN3k5WmFIV243c2szYWRS?=
 =?utf-8?B?cDVOa1BmdlBGLzFsTTd2citadEVjS2xxZXNmVFh1SUhBNk5nMkFtc0duU1Nq?=
 =?utf-8?Q?P/hsHKGspSizHMYwjPTdm4SX7TK68RliuaM/ana?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33e870b-c919-40d9-1002-08d95e567b68
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 12:32:58.1860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMEs7xycnGN9A8eHtXaQRWMF+WNQ+V11gX2hfCBfzdOenTfuqQ9bbq3xR+q+qdN26HoG4RrvxmTQOv3qy6OdYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 13.08.2021 14:27, Julien Grall wrote:
> On 28/07/2021 11:27, Penny Zheng wrote:
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -132,6 +132,12 @@ int query_page_offline(mfn_t mfn, uint32_t *status);
>>   void heap_init_late(void);
>>   
>>   int assign_pages(
>> +    struct page_info *pg,
>> +    unsigned long nr,
>> +    struct domain *d,
>> +    unsigned int memflags);
>> +
>> +int assign_page(
>>       struct domain *d,
>>       struct page_info *pg,
>>       unsigned int order,
> 
> I find a bit odd that the parameters are ordered differently between 
> assign_pages() and assign_page(). They are similar interface after all.
> 
> I don't think it would be a problem for backporting purpose if 
> assign_page() has a different order for the arguments.
> 
> Jan, what do you think?

Having both functions with similar parameter arrangement would
certainly seem better to me, too.

Jan


