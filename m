Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEDD403A82
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 15:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182003.329393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxWI-0007H2-JB; Wed, 08 Sep 2021 13:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182003.329393; Wed, 08 Sep 2021 13:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxWI-0007ES-G2; Wed, 08 Sep 2021 13:21:42 +0000
Received: by outflank-mailman (input) for mailman id 182003;
 Wed, 08 Sep 2021 13:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNxWG-0007EM-Mu
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 13:21:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2cd0142-10a7-11ec-b152-12813bfff9fa;
 Wed, 08 Sep 2021 13:21:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-gP9nn5wLPLyUtBLryOhemw-1; Wed, 08 Sep 2021 15:21:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 13:21:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 13:21:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0047.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.21 via Frontend Transport; Wed, 8 Sep 2021 13:21:34 +0000
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
X-Inumbo-ID: b2cd0142-10a7-11ec-b152-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631107298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lw50COFzGHyI/j6BIzWLnNNGnqltLBGeG4UmZVagX/k=;
	b=CuL3zne2BzkQN7Y1aExRlnvFX7tdePk/eA91/EHWJjrWZDFk6+XynGP2qIZUdummXvwzrR
	RkCdJm018IOlE0/XMPpwjumdv8/D6iqUkjz7zI/JLavt7Z8FPAx645gvB+IfJCQ5g6idJG
	613UWkxa8mL0XjRarQngrO7yfIvIEUI=
X-MC-Unique: gP9nn5wLPLyUtBLryOhemw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arh588hgXUy/sBThSJ14GzgSXAhs4jUSLo0vj0KIvysv0Xip5g4Le3EKIC36QAUcvIig4XgeQSu4aTmtRXZoYgvM7xEXnUEBYr6hLM/AnMoaUp4H0b/M1OfcUYts0SM8NWZUsJAaLKEA8kZpeBvO38E++IUP828Iq5QbJkFXSbMJivZvCz2BOKv+mE8oOBZQqVj1xhV6AZ7y+3zCzBhoRDlbY+jPSQQ6gZNzoIbLRlyfIY8MlQZkKFez02RmXLPFx2bP51syr+DztJdZK7JqBZ7Y1h/Aq8+K+q/XDtjLQP2inZfupH4hlRMP4tqUpUU5va9O1Naw65EvtP8sAEijbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Lw50COFzGHyI/j6BIzWLnNNGnqltLBGeG4UmZVagX/k=;
 b=NUgdvMOv2vhxETz5nAM7KJp8UMVcUXRINznhFPXu2JVSJ6imcI28GlR8lAl54uw+14LX9wNXcnynxsKhfvnSpbv6TtUylsbzgvCmLFYu8tkot1LlE0HO2mBQZve4LAjR6fnXKumI8GmSXqp8HjnTLGnK9hAy+DwgBj2eiDiKFDBMl8x9hQnj9+Jpb8q0kzclfJMyTtlPDCqOBi3JRxSAOs/+lQ+KeNl/XpNgdWXlt93wVaPiR7OZ/bE3Sfi4GMQA8bq04UHzrk+uaFLloeUF1laWsJW+63sNpR/Ow4J5d1B+pM1rBhPfSwasxNS688NEojyah/xg8qeU/m6KpPBBWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/boot: small video mode handling adjustments
Message-ID: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
Date: Wed, 8 Sep 2021 15:21:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0047.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b281a9a-b32e-4018-0c74-08d972cb9468
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2607891FF878894149A5008FB3D49@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vh/fzuQCpfMkCtUE3DCyDnQAN2zenonAJ8ErY9PVE/qSAnsyI9qaXABBRbF8YYme7cD2HkQs+2Ywb8/W3ysnQNeGYauLLNE4hlScrZJYoNRgop2FUxkPaB245uOKhnOFyxis0TZdOgCxariDcxTL6HPBLZqTSJJbnpJANjCJ33oLFwJOphZdeiedjlDA+7QgQG3umoKKQ8RF+/Wojdudiu0ffTLtKw2iGC3B5wMZqmz1uSyM015H/d7PnoZ2VI2Q451wAxU80EUr+R5Xwk93EEqLyD9kQLnnlLz6jbZnjZQaGVjrozXoySU7wfXMlzgab1KNBeFOC1U6aT9TWvmgsqIumynYvDi5e5ZEo1r604wPxJQPnWqhjUr4dRQoPFXZyl2j4c+J1apg6s+Se1vV1woAOYSDvuzDp0cZsYHi3s/zJDnjKSdcR59PeZojPP38pU+uufJAbs1L8uHT6b/rgDWPMlyuLUqD0nhA9k2iT1qFH1SEsQIkvoDSoY3XM0jlTf3D/nXiTSKIAqNaSWYpzMV7pvg1iBKPu9rknfCilcrIfoBhqqfdXtXGRIL4TfQRs0EyajuZ9thn90nPjQ5wffjFb0VWlY3faeGxKJz0K4J1lSKTjwvht2imFR/+7GNUDUowi5kLgnI8jbmzQYnwsEwdMCzups8gNLQfH5qZubHGrm1qGiwu6lealWJgHWr7qfl/88GRQxr01GXlER4dsc1oC7IPR+MbJr72Tl6ttD5BAnuQHPWwCz9LushiObY+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(396003)(136003)(346002)(2906002)(6916009)(31686004)(86362001)(38100700002)(16576012)(956004)(4326008)(316002)(6486002)(66476007)(26005)(54906003)(5660300002)(66946007)(478600001)(66556008)(36756003)(8676002)(558084003)(8936002)(186003)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtIK1NIS05MVGs0Qzd6bGdSOHlpdjUxNU44VE1vTkxyaFBCc3VvaGI0SEJK?=
 =?utf-8?B?VzBWb2xCOUJCNytmcmw5UFlTOFJGL28zRVFGQkNRajZLQzNwVkJVZ3dibnlZ?=
 =?utf-8?B?bUNGWEQ5WEJoRXljdi8xZDlzK3dZYlV1RjBKTjB1KzduVm1BQWU1ZkpaNWFM?=
 =?utf-8?B?ZDFMbnpNM2dYRGFyMDVPWHBYdjBBSmpURkdmUWRXNEFiS3IyOUd1VHAxelJq?=
 =?utf-8?B?MXg2bndVYkRyOHd2TlhIUmtjQ0YwRXhHWTZOcTdUK3lSMHVrNkFndWJTV3g5?=
 =?utf-8?B?YkJuQ3VnTlJMN3BsQm5jckxEM1RpdXg1QXdEeTRSRURXc09Uc2JDR3JyUTcr?=
 =?utf-8?B?UHZ5TG5CRGJwakJhV2V5M25MK3ZzYm1GNm5VNlhsZ2YzNFZnRDZrOU9oV0lx?=
 =?utf-8?B?RXlFZmp4VVBOOW0xL1Z0eUdxS3dNZnVQdndNZURQYmtjdEprazgzU2FySDc3?=
 =?utf-8?B?elpxVTJJbng0bEZYRU04UGZDTFFmTlZZZmZXdFJtcGJLeTJhMnoyaHZnajlV?=
 =?utf-8?B?VUx0bnl0YXd5R3ROYmlNTCtCa3FPY0d4ckhENGFHd2g3allJV0RpQkZnbzBn?=
 =?utf-8?B?SUU4ODRaTkpQQlV1Nm1lTUVGajNCRzRoYWY0ZkNDaXg4N1daenU3b1cvZFpC?=
 =?utf-8?B?WTh5d3FrMVNpb1VYckNWRmlPU25VYWVUQXlMbGRtaUw0RVY5K3JvQ0dvd2Vw?=
 =?utf-8?B?SzRVY0lvYUFxMGN4eks3WDQ1TktWOTVCNG14WGszbDlJakZCdDNnY2cvMGow?=
 =?utf-8?B?WFJXQkRJZ2VDZGRhLy8ycVVvWUNNMSsvZGhlbGdtR0hwYWNCcUt6MjVEdzMw?=
 =?utf-8?B?U3VLTlNQb2FNSHVGbHFTTzB1bEZnNExzOU5SZWNLZUNQYThDR0JCc1N6K3ZE?=
 =?utf-8?B?UGRIOWtVODRyWi9JZUtYb2lYcERqdVVIb1pqWmthc0xwWjU5bk44R2Q0NVZU?=
 =?utf-8?B?d1k1VnExUXBLcTIvUlhYd3dONERnM0JxMkp1YlRRbG9kZC90V1VKMmJWQ0ZD?=
 =?utf-8?B?WFVYUFJRU2ZjNnJmQXM1RGh0MGdJU0oyMXVlVXRSYzJwbjZBTURWSkpHTE5m?=
 =?utf-8?B?bUQvQXp0QVI5M2VPVUtVRDRIays5bGZvc3MrcGVvVWdXTFVzZiszMCthbDdn?=
 =?utf-8?B?NXJHSGVtYmp5MDE4aHFkN09VdzRBTGFlVzhXMXA0M1IvQm5ST0czOGpLbVJh?=
 =?utf-8?B?b0tITStMSU4wTGpmK0lnVkJxWENmNitzWElVUDFWM2ljUE1MaGQ5TC9wWkUz?=
 =?utf-8?B?YTBud0E2ZmJEbzRNY3RuS05PTnpUUVRmR1MwbXpTTTltS2VuL2sra3hqK3Z1?=
 =?utf-8?B?NVpLaWxNcFo0K1pEbFJFMDVhWFFQVzc5bWRMQVcySm5uL0laWDNGcit0ZkFs?=
 =?utf-8?B?SmFPdUt0ZWpnYUs4Q0xzVXpRZ29PWmV4RTZNS0RBRWRLZXNiSjE4VjlZb1Rk?=
 =?utf-8?B?em9zR2crcjJTOGMrbXdHYjZLcFF5Z2RBUnlSUmkzTElSbWhUcjIzUHN5OE1j?=
 =?utf-8?B?TmRkWUVtV2lycjBwc0xmSG5aZFlHcEM5cGNjSTZveEVNYXV6cWRVUys0RHJy?=
 =?utf-8?B?d3J4M1FpUlhKK01OYlNoVnFONUQwWk1JaytsbUlwT2lidmFvTW9MQUYyUmlO?=
 =?utf-8?B?YnA1c0JNd0JOcTJuN3FoZjFxSEc2YzBTZi9HemtBYWRFMkFuVnBNWXZmNGJ1?=
 =?utf-8?B?RDFsRTZXUEJoMUh5ajEvSUNUVzFuWmJiWThGMHZOUThkcHJncTNKVWZ2Mkhn?=
 =?utf-8?Q?/C03EEOP18iP4AuNAxo7Cw7ZJli+qBJ3wHFkknc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b281a9a-b32e-4018-0c74-08d972cb9468
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 13:21:35.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5FAK0Z/k8fi5W+AxBop8FBPEHMszk1uTKIlDpTHvqO9fe+IrNl99SJ1vMOWvXixZFYmphNfSHWzWIyv8ATN7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

1: make "vga=current" work with graphics modes
2: simplify mode_table
3: fold branches in video handling code

Jan


