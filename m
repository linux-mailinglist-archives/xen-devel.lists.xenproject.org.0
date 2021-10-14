Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E028B42D2F3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 08:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209015.365341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maubG-0002cG-9q; Thu, 14 Oct 2021 06:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209015.365341; Thu, 14 Oct 2021 06:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maubG-0002a1-6j; Thu, 14 Oct 2021 06:52:22 +0000
Received: by outflank-mailman (input) for mailman id 209015;
 Thu, 14 Oct 2021 06:52:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maubE-0002Zv-Nm
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 06:52:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45ea0162-2cbb-11ec-81ad-12813bfff9fa;
 Thu, 14 Oct 2021 06:52:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-vzWg9o4FMuOCGyNx_D-0pg-1; Thu, 14 Oct 2021 08:52:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 14 Oct
 2021 06:52:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 06:52:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0037.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 06:52:15 +0000
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
X-Inumbo-ID: 45ea0162-2cbb-11ec-81ad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634194338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzzeDl+H1gQVuU0hMZFZK8q4ohVAMzKWic/c6ljoL48=;
	b=Zbw0e9y+9vgtCUIlz+msBJyzf6hfbBm0Ex+xBBFYed848ID22vu/HrOQ6nsbfjKz4wsVi4
	TbCQljdpifsC7ucVzvopWF8Tpem/nDI4rBgOGz27sg4yOYFtzJS2ckgtPu+x1k2TxXuNc/
	Zuk/uxpwWr4ZQHcJGGb/1Jgx/toLJ7A=
X-MC-Unique: vzWg9o4FMuOCGyNx_D-0pg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+RcqvZc3n5nrtwCJL4IBHo+rDChEQ5J7XE1FzNQCvhwjNyiS9fo+xdEVshLdtV5R7dm3Hx74LWQPWZiQJJUIOe8g/fVSfhRl6jQoUWM1tJbjW66ZtKndGRmUO/KdaBvcvn5rhl6ClJ9c1Kh4If/PgrIoTnBkJTSGUxEAFTw90sVhf02o85SRdlnTCYDRjXjNxBhptinqWV0188L3z5lW7i1/VTvorKF1twLtt7TMZnTd75lVz8zehXSOmFVEgEEOW3YznrHgips905yZcTM0TGInSCdTeiVLp0Q7Dli7Trc74FwhoxMPpQMvE/0FBYxX9Tdj0E7o1NU0AP/IQMHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzzeDl+H1gQVuU0hMZFZK8q4ohVAMzKWic/c6ljoL48=;
 b=NMrzAJYTTif+fKry/YxVg563GVmJhEb7PRAdZtRm3CO5rQgUr4oJMZZe07raaZYR0dmQIQh2qrmzCDD1R5+S4jJPIoG81vzodB8MWegmNBqSbXcBMAq96yktG9opwzAFttLJu/cE/xqkVwrZ6j1Dq378jHYlXYcuXYX3dxuJ8X/LBzITcQ7eV1/hFzFtEs6XvgEHqsOir7Oo2aW/+cUeduA8qhgJDWr0YKzQle1j4uOYGUaCsEX/1S0wtuFSV18gFHQZqPehXqlZowH1uUynFJQHxaO1JJdAwMZY81nqqDqHZVuIpeDuxoOCu8dMduf0wXEeJYxZRCNuIXS4AY7UCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 51/51] build: add %.E targets
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-52-anthony.perard@citrix.com>
 <377d9a27-e09e-38f2-9009-64c0b9e6ace2@suse.com>
Message-ID: <21a448d8-448c-262e-9d1b-dbf7de159209@suse.com>
Date: Thu, 14 Oct 2021 08:52:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <377d9a27-e09e-38f2-9009-64c0b9e6ace2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0037.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a63cebe3-2e63-44b5-14dd-08d98edf28c7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848D9ADA5BD24976A3A7AF1B3B89@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Q+BbbagqcEtPQQkobvmSVJ/Br8Ogo1vavL6A84pZscclVR6+B/i4eKV4T++lB+xBjDJy8LsOxyUjCl1R9M29tn/HR6rAS40dlSH5EpE7rGFgOPcg+g9EbdRaZZbX7J8yrGNCGJ7uxirLJqb5aBUCCDCSgks7hGlYJ0AV9f5BrRY2wVULdUErx7ssSaM47VwNWzrbfBLBlY++rZ7wvaUlzr6kvvaWlPbZi7kh8CrY89MNH2QPPY7On857uaPPMGfRCeP7YKKpvKLqa0fs8QikTVyLyG33ivoQ9vQzV4A4bTHO4CIXxiIs54xBP1zphrIg3jPkeUVbNMpDyxK2gSEjFdT8rJ7hiKPDGds6/NT8JETYBb19sM30wiSdpyLc+eUo75M4gezqGzE/rOhFpj+7+ShgrLCatCNvlIV4SQiseyYLegu2jHFnkP8ffwlgNTZQ7T4Pbfk6yrl2HGcO8kD3C7/N0t0DizyQw+TtcPuXAescdWgL/xm4eVhLGesQ0Nwo/OmJ2owur55evG6OX+COIAyVokbH/mztcaaCb7X8xr1i7UwpGf3ryKhC6fKVb4M4z1nk+HS27cbpviletJzvemWJ27lwYZWyyz35nBIJPR/Rl8bclp5INNlLOj0YnHftA/FOtPZe1fIEYa7DEcPdtECHeauZ5loLOt8y403JjzvwWjvTY3cmDZhD/MhBOU/xcqiMCaz+LxcjodR+qU397oIa8nnGBrOed74Z7EV+fM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(86362001)(2906002)(16576012)(186003)(31696002)(36756003)(508600001)(54906003)(110136005)(5660300002)(38100700002)(83380400001)(66946007)(956004)(8676002)(4744005)(6486002)(66476007)(4326008)(66556008)(26005)(8936002)(31686004)(2616005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzMwR2JiemFhRDY3dGFNQ2p0ZVR3ZUo4bGp0RXpVeExERWFJOVJldEY1b1kx?=
 =?utf-8?B?OHAwTEY1RVVzTElCRDZOUlRlOGUvbXpKbW1kLy8zRUEzSnU0TjhKdlZHNnBN?=
 =?utf-8?B?dUJCTFROS25RTkNGYnFZSzcweDR2YlRnUEg0dGNrU1NlemI2NTNtQU5kOWoz?=
 =?utf-8?B?MDlGNnJqTUp2RHpkWFRMdEVIMEZ6NXFHY3BWMGNEMXl2OW1EMUJwcXJlZ3hn?=
 =?utf-8?B?bStoZVZHK2FaZDlEU1JNNEplMHlDS1ZiK3Q4UEtDV3JjTXNFZTMyTWQzMWRt?=
 =?utf-8?B?QU13U1B5RzJacnQvVUVxY2JWRVQ5STV4cytWak9QNFhITmhMQkFCNER5a2d6?=
 =?utf-8?B?OXQ3R0pRaFM4UFVDZWttM2drRHQvYXQ4WUV5Zm9oSG54TGRPcmlQM3VTWTlX?=
 =?utf-8?B?Q0dBczZyV0lWdFc3eldtcnE0ekhMZWlnVi90dlNDVlM3dnlQc2JpRXNtK1RD?=
 =?utf-8?B?U1V2YnNxM3Z5UnNwWEdGUGZReDlqc1hJK2Yra1hqQmRHcllZelVUY3FVTUpw?=
 =?utf-8?B?aWxDS2Z1aVJsY3RrZDVKRHJCTXVwcDdQalVBWHhJMHpmWXFJd1IxQUtJR1Rv?=
 =?utf-8?B?ZDEwZEcyWG5xTUorbmNXQmpYUmd2eGZqeDh2RWhQcFYvTE1hdkJ0ZUI1UERq?=
 =?utf-8?B?ODJ3VytDVTlyMW1UK1JyUWJsWE1zckJGcGRTL1I3ZlhEeGdHWmFONUlyU3Bx?=
 =?utf-8?B?bUowbGRhMmtFK2JIQitZejJ6TEVwUGl3OUhuOFZPZExZdWRUdGV3N3UyUDhF?=
 =?utf-8?B?aS9YeEdKVjR0OEpsTDc1bkhJQnVuc0k3R2JQcVpEd3kraGNJZXJ5MzcwempM?=
 =?utf-8?B?ZVc2cWQ4MGJHcFlCSGVWbWcvTzhBWXBIWThnMnVuVVMwd1BEb2g5cGhQcHo3?=
 =?utf-8?B?VzJ3NlVNUHNwdUdLcUNYanlyNGE0eitNREcvSXZ1TWdEYUc2ZmI4Y2NuVmJt?=
 =?utf-8?B?SU5tMGJRUktnanNpVy9RTkl0bkhOTXpKSW9WUE9nNnlWbTJ0VTQydXpSTlBu?=
 =?utf-8?B?ME9OUDVOQ0JBZWhZSnVPUUhMYTJTMmd1eElhK1pUSHF2M1pjV09kV0k4Zmsz?=
 =?utf-8?B?ZFdUMTc1ZjE4em4rdWRIcjRxY1RjUG5iNmxpSXZNRmw3K3BLcWFWWjFQQngy?=
 =?utf-8?B?cURzelIvYjBOY3BZM2c3a2ZQcklFbXhBYUJRM0pNS3JEYmxUdDVIL2IrMDVp?=
 =?utf-8?B?TkFGTHV3cHo3U0RoRFNkSXNYK0NWYXF6eU9lMFRCa255NVhaUnpCNWUxZG94?=
 =?utf-8?B?RDJsTU81VDFTL3JsQkZLNjBKbnA4aWpjWE16aHhPMVM0dU9Bck1QQ28xZ0tY?=
 =?utf-8?B?SzBNY3I0aWg1ZnZDVDllNEVnMFk3MjByY0RxVkEzTHg3a3pveVVZeFJRRUky?=
 =?utf-8?B?Q25ubDlFRG80Z0JLN3V5V3gxc1FwUVo1VnFpNnFMbmZDSEpYK1hmUWRoZUZR?=
 =?utf-8?B?V0RZOVo2djlaSU4rZWJKeVFPVDlkT05LNVZ2QlhWdFNWNkFydDBsYUNISzkx?=
 =?utf-8?B?Vk4zbllEWklZNVg0WDVObHU2S1pwbFI5VGlORkY0Snk0YUtMV2pMcXorcVNo?=
 =?utf-8?B?WmdWMzVPTWJlS25mdG43VnFUQlZ6NjZ1MXhYa3ZTVkdSWWdmY1V3Mmw0R1ds?=
 =?utf-8?B?WFFKcXZtb2MxcnplaE9rSGRtRFBBVFNZVU9ndS8vUzFlM2tqbUpFRkNsdGNn?=
 =?utf-8?B?Z1BLQTZZTHBSdlZVdC9qQXlFWEJLRFFzWkR0ZXplSENHRTRycXpkWmRqQWdj?=
 =?utf-8?Q?rcGubvo1rd2QpsHKhsBApjzF2Oovm6sjzwP/MO4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63cebe3-2e63-44b5-14dd-08d98edf28c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 06:52:16.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftrGkzhuUcX22CXck+cVd22NXYGoMd9lDPaI+BYUiBeczsqaWvs615wqQDcXOaxBArfRmOA8alyk3NFMvM6nAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 13.10.2021 17:48, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
>> I guess it's easier to remember that %.E does "$(CC) -E" or "$(CPP)".
> 
> I've never seen any *.E. I'm puzzled (and hence have reservations, but
> then again don't care enough to object).

Actually I've checked gcc, and it wouldn't know what to do with a *.E
file. Hence I'd like to ask that you add a reasonable reference to a
pre-existing use of this naming. Without such reference I'd feel the
addition would have more risk of confusion than possible value.

Jan


