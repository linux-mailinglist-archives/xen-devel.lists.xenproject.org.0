Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D13F5DC3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171277.312552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVLq-0003nv-6l; Tue, 24 Aug 2021 12:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171277.312552; Tue, 24 Aug 2021 12:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVLq-0003l9-3f; Tue, 24 Aug 2021 12:16:22 +0000
Received: by outflank-mailman (input) for mailman id 171277;
 Tue, 24 Aug 2021 12:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIVLo-0003l3-MC
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:16:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15461f9b-04d5-11ec-a8cc-12813bfff9fa;
 Tue, 24 Aug 2021 12:16:19 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-kwXTlqotN_awH80w1chk-A-1; Tue, 24 Aug 2021 14:16:17 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 12:16:15 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 12:16:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 12:16:15 +0000
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
X-Inumbo-ID: 15461f9b-04d5-11ec-a8cc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629807378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NXTAapnVYTNHAKIRL90F3KbzlRs/OJiVaVGYxo+StY=;
	b=FDk/5tM4NkJZE/NlKYnq5phOFYofvLLtnNN5wxZ7a9ibBkWMZi67Wc6JmDrvHdhBnBTv4i
	kPEmDUztA6PMmZI4cCyZpesHUv9yeBKoVNIrAs19Mvk9gXK541ABapJ9MLCDdUV9/eD11R
	bpSzMe0zDrXbND6Le0JEqplvykcvo9c=
X-MC-Unique: kwXTlqotN_awH80w1chk-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4NUZdHrOWlY5CUSi3XHhYpyvzSOzBVJzSkmGxgQKVYCXbZQwfZa1btKJ2AuMLLiTP94JnqbmuQFfsLFaYz3UyNmd3vnebGU0WXIU7oX3WuUd4fcObbu6WXGgBsmmoBecaQ06tpBiak2erRYH/Oly+VRQZD/51vkC2ooFKO8aJEtp8PSpXxzRNdyRfBji4GmVzFp2FDxEf0P5Kn0CaKfazfR17dhopDtZ9Vwt7I6BJFVAz8ddcwSLmnzudclb6+SqbqG8cU4HqB347IVtz8HiKp7Qq9wdOtsrdkosro1Bg69YkhkkE9k1iIL98LrgZevb2gHaDELjQ81lLjwjFOFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NXTAapnVYTNHAKIRL90F3KbzlRs/OJiVaVGYxo+StY=;
 b=fNnyF6ojL/Y0iWKDeDZgjrsEUlUCQMltOJCUPDTUmW0D5xEg/ReZ17MO9Pz7NEHAK+woY1L3T491hwA7FockXwE9NNpiZkiZcsMXAwJNWDWY2tXRkMAh8E3+RcSAk6CedVyA7DOcnXlt99X4LS+n2U+J0Cz4JJt6l8b79e80HGbYjrj2PL92rh1Py6ZG9oWXpMrFCOKvM15r1No4Ltq5wSO0M3pGQdQyYXgYakZUdIVmAk0d9iz8haGoKtCI6i6funU648gckpIrZ6GqB8yA/kKW8alqYq/i5yDlktuZFRuAJFDa8v1g/HgqmdIC3RaiS53UJYlG2UVUH2PpwBoZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 2/6] x86/debugger: separate Xen and guest debugging
 debugger_trap_* functions
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <7925a89cf830e0e3705a8700fce09a408fcfc27c.1629315873.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf162154-a988-ffe9-f6a0-40351f654d1b@suse.com>
Date: Tue, 24 Aug 2021 14:16:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7925a89cf830e0e3705a8700fce09a408fcfc27c.1629315873.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5469eea-9721-4dff-a53f-08d966f8f856
X-MS-TrafficTypeDiagnostic: AM9PR04MB8147:
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8147ABAFDF7EB31E8333D730B3C59@AM9PR04MB8147.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QYCuTsqQvBnqpAdmz6eAhvNj20tUSS4P/9YMox0suUXmRGmRrKYFM6KRcu/7TMF9g6/f7my6hNpHzg73E+f0rtJT/ONRNSr5JxW2iXW5pCyfysYNrHTG5k+vJN8sBzQLXtiWfaDe7cjvS/dQ8tdLWHCiz5S7SZUCYH97iooKiyQ1imEV/Y0lAdKxUaPGMaHJ5I2tNClmVfgN1oPLdAE9dglvvn2KckckuaKBCYkW1yYr2E1TYWMZ9prKazslCrwQNyTebEFHFF3LCmxZrjC62zGJ9sCQkSMPGjovq/dlZ+GoU2yIGheQu+yb0GH8vgGNiVeB61lhuHfY7LBVFOZKJ+4gN0pAtrVNUXgZDtnBuSeMDa//8hd+KXQkfTFgW0bDTBK6qMgWheLY64YAJKvSS1WUT4sViwmwu+MQnJ8cMk5MEWbf5N60MnF2pLirMBCrw9Z0+14ieLK0UTE+tsN1QfTHkwzNO8I9vykode8j/3UCt23SSsIfx0WZkVq5dBJ2kiZCzG7d/ekk3RjGdiajswYva6LhBRRwbhM5E+tdLHbaehUcN5k7DJRHre+weDM4wVJUqcGFI3zG3XtCEAL0wQ8NjbxdfxJKYnQAk7Mwy8aUOs8iFohHGoflIE71+S06MQisPcqMaJHE/oYyVIFLAY5EnS1DLuRFIsR+iZG2hzuU3CElMLkqnzv9wrNNcx9E3O8AR0uKxfogUmf49eG5FT53qrB2KynhorZgdzat6N8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(346002)(136003)(39860400002)(6486002)(38100700002)(2616005)(6916009)(53546011)(956004)(54906003)(8936002)(2906002)(16576012)(316002)(7416002)(31686004)(4744005)(86362001)(5660300002)(186003)(8676002)(478600001)(36756003)(4326008)(66946007)(66476007)(66556008)(31696002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWdyK3B3SUJLeXp1SDJKYjNVOEhjdGJ6SFI5WnpIVFdKUlF4S2Rjb2VwNWJ5?=
 =?utf-8?B?TkQwNmhnMU5Ub0JrVmhKTVFwR3EvaWxHK1Fmc09xTldXTkp3MTN5SHRSY1l4?=
 =?utf-8?B?eVg0ZUhTSEtXQkxXTUFJTlBPWi94ajYxdWFERzk3QlpYendkY0xJbFRacWw3?=
 =?utf-8?B?NENUaHdqejJHZnVwMldpMW9YSXhYbTJIVEFzRHdUdnlKZUN5TFRibnhMQ1NG?=
 =?utf-8?B?WUtwWG8vcWFOL21ERDRwNks1cWxQME03bW5yMmFqR0xnWkt4NE9GR0duZm1r?=
 =?utf-8?B?bHlFR0dWNFdmYUlkWVQ4bklyUDV0VGRZZVVIMkJzTTRnTVA4aDhzeEpQY0Qy?=
 =?utf-8?B?YkxoaW91bE5PNEJLN2lTMjVtN29QWHE1ZzduRXZiVmxPK3JrUmIzcE92Q3ZG?=
 =?utf-8?B?MHNreVNDRmlWQ25tallGNEVZN3R1RGlzRGc2cmVqdWN2OTZZU3haSG1WMFRy?=
 =?utf-8?B?L2t4TWV3VTNDRk1GOTA4TTZ4OTBQUXBOSzFTZUlmV3ZVZG1nbTdNWVIxSTVV?=
 =?utf-8?B?SzhqSEI5MDhWODhXeGswYnVmNUJNWFZEaURZTVRNRGZRRjRYYTN0WVlpdEVk?=
 =?utf-8?B?UE0zaTVUeXAzVWEvZ0pwT1NUaUcwRmxlWWNoZ09zbzZkUW9xbVluRks4UHpq?=
 =?utf-8?B?OE81QW9VTWhGSFdGeG0xL1lkQnBzakxtNW5SckcrbXgxckMxZDBMbFF3MitN?=
 =?utf-8?B?Q0JqUWdUaVMvT2kyU01Qdkd4b3R6aFlvQ3RERCtMYU9QRy9NdDIrdHdWQ3Fx?=
 =?utf-8?B?TDBydk05cDdKOFdTTjU0VHhpVlNzcFRCZk83NExGVk81dHkzRGpLS2pWa3Uy?=
 =?utf-8?B?THQ1UU9pNUdMT3p3SWxHMTJwTU1GVVUvUzROejZzT2c4azUxOE5Id3M4ejNo?=
 =?utf-8?B?d21FNkRISVFkSjZ2K2hsYmhZc1pPZDd5RUdQT1ZMUVp4MTF5V3BXWnBKQ251?=
 =?utf-8?B?S0NXS1dtMVJ2TjIybXh6UmEwc3ErSkhTSXZsczBvYzFRYmNXS1FGa3hPZVp0?=
 =?utf-8?B?NE9xVkk0Rmk1Mi9QNkxUcVFBUE4rQnVtaktvUlNFUWw1VkRNNm9nVlRabkNL?=
 =?utf-8?B?MUhHU283WmtNancrcERyeVFGbzk4aThCWWQ3RmFLUElZbkJPZzl1RXNTaXND?=
 =?utf-8?B?YUZGSUZTeG9ZRTlTNDZrdjJpODF5VnFRNk54cTdvTzRhbmt0OEpsNFRIYTlK?=
 =?utf-8?B?Z2tLZVViSFNGTTlIWUxubzVMS2MxUzhsTHVTU0U5QnpTWlVxOWVIVEF5TVFr?=
 =?utf-8?B?NnUzeDFIelBrdEtUTG1rUXB4ZWxkUHVkU1UwVEZTOEJ3ZU5EZFBLc2Y4S08w?=
 =?utf-8?B?SCtyV1hWeTZReHRYc2g5d2p3MjZ0UUVoZXoyRDZQbVFhUmVHTWhDRjJHSklI?=
 =?utf-8?B?Y3ZyeFQrOXYyalJTUFF0VlFXYVI4MDBCUlR1VXh5ZWE4MC9hdldZa0Rja0lp?=
 =?utf-8?B?U3NVdHJWZUpBYjhITVU2RzNibDBYcEwzck1wNVlldm9KV0JPdXUvQ2tPRXdD?=
 =?utf-8?B?c0hVNDNoL2pRT2xYYkd4R1V2VjFPVXRvSUQzVUc1RFBuTnZKL0tpK3lRVkEy?=
 =?utf-8?B?Y3FuZCtISUdzZm11VG9ybjkwcU92d0pJQU9ubWVXRThLNUJYSVBqczQxVkM4?=
 =?utf-8?B?d1FQK3BxV2twNDhQS1IyZU90QjE4L09SclFDbURReXZ4QmtaSEN6QmJHbjVE?=
 =?utf-8?B?L1ZpdmluZ2lIVHNFVHllRGpBNlZ1alMvTUp2L2I3UEJWYy9BZTFGRVB4ZlFN?=
 =?utf-8?Q?r2P/mOaBD745cwGexeywen8lQpBS13YIryTKgt6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5469eea-9721-4dff-a53f-08d966f8f856
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:16:15.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaqHZR3J5QsdK2iPyhfZS48s2/HxChtUIErFc2SY6WPWAMEeJmW8482Ts1dDjpIjz3B7gjP9g6B0CZUz6/TFfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147

On 18.08.2021 22:29, Bobby Eshleman wrote:
> Unlike debugger_trap_fatal() and debugger_trap_immediate(),
> debugger_trap_entry() is specific to guest debugging and *NOT* the
> debugging of Xen itself. That is, it is part of gdbsx functionality and
> not the Xen gdstub. This is evidenced by debugger_trap_fatal()'s usage
> of domain_pause_for_debugger(). Because of this, debugger_trap_entry()
> does not belong alongside the generic Xen debugger functionality.

I'm not convinced this is what the original intentions were. Instead I
think this was meant to be a generic hook function which initially
only cared to deal with the gdbsx needs.

Jan


