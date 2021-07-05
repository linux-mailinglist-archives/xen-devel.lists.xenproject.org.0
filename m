Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E573BBA01
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149959.277343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KhD-0000Ag-NI; Mon, 05 Jul 2021 09:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149959.277343; Mon, 05 Jul 2021 09:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KhD-00007U-JJ; Mon, 05 Jul 2021 09:15:19 +0000
Received: by outflank-mailman (input) for mailman id 149959;
 Mon, 05 Jul 2021 09:15:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0KhC-00007O-HK
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:15:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7150d127-b075-4fa9-bb64-d6f9a3c60fbb;
 Mon, 05 Jul 2021 09:15:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-9fWCEHhDONO6oCatPwrvPA-1; Mon, 05 Jul 2021 11:15:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 09:15:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 09:15:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0902CA0017.eurprd09.prod.outlook.com (2603:10a6:200:9b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 09:15:12 +0000
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
X-Inumbo-ID: 7150d127-b075-4fa9-bb64-d6f9a3c60fbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625476516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IICWLUsZFk3qAn5agg44BauByHfkS0qV/OmbhxwFnu8=;
	b=MRj5xTI1nwPHYgOB4SntH377D0wgyeYofoHlP6OacgFTQWCsUGMUEp9H6ClO5jBrTkD1+o
	G4UTEnUFu6lOjLJKlpzmcZ+7AhNpIbUAOkEGqEMpxjV+WhWsRS+mcQlLXLegdd/WDDq8rI
	p8o24v7BsScXtkWsjc2vyYk6cj3yvIs=
X-MC-Unique: 9fWCEHhDONO6oCatPwrvPA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlPilxXecUCNS8BgTowHDK6fcqTQOoQMtcdjUVEgCk1Q+YIlkuu04lL0YmJcw58c7rfhDyUX4vf4cqfw276pfeeP0fwpSsH+Kgg2Y8nQb+iJb2MmPIua1Q/qUTYwfsqjO8/AGDAon43Gy5KMsZB2+/6DULh/jHmO9qjKyEj41KFtPy85VQmq9JmHbRUaolF23Nc993FkCWD5WWkGbOeC9XlJv1Wo64U7NPXnOcQqDrSXQwcQbzvdYh8Qy8kWnxHW9N4LGdhhXOifpDs8bFzf81LWui/N6ocl42fJeEUXRrohtzVTVkl/kw2T2pOGuZJ63FXP4kLP9hHaqPFIZjyOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IICWLUsZFk3qAn5agg44BauByHfkS0qV/OmbhxwFnu8=;
 b=fBYCNizfKu5i8U6dSepy9a1XKazxYeFCUF0kNZ+dVhmRE50DTdfLslY6W9/QLt+q032tQdKs3TXBABZ6dd2vlZGRp8Iu/EeaSDCxTO+8tHL2PaElTB893YPOmxRLmCmGvTIwExEjkT6ENf6MSYb9E9I6AzhNzvwjNPlYm3kCPBcEUl78QSoAAE/Ie+4Itq+idSytOGOiKyD8SOXuNufr07yermGEg2uFSLwDyy8AVGgkvgIfHxxj8BzYsV6x1wz77woLIsoRsptei03Zp1ahRgCPHbvRRan6LB3hizpQhy6PaTa0U76zOC7h7h8QwYRGJTtUj8kijOdtLIxy7lk8oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 4/4] xen/mm: Provide dummy M2P-related helpers when the
 M2P is not supported
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210703171152.15874-1-julien@xen.org>
 <20210703171152.15874-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ee1496f-aa3d-8784-3d8c-f152958dbfbc@suse.com>
Date: Mon, 5 Jul 2021 11:15:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210703171152.15874-5-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0902CA0017.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44344902-adcd-4505-9230-08d93f95653f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384A6BDC088441EA8DBE508B31C9@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqN/slZkid4y4KQ0D41/M7zhP82UUuD5f+fIFidvTzukMMkzWnq0/uwTyWUgPE3f/7BbGBpdIvF2YJ5rUYBtdRavgDqXLgQOeRL8fPm3BpnOUWuo23oAlSjoNsj1N34IcP1skDBiHTLNcF4dCXMuFF0NyUbqj01UUTw36B3KN2Npe2ZugCZxW9LmaIP4Zbz8zGp/pM3/wv0mSCQoOwSNJsumMJDY7L4B0JDQW/PLyIjlUmUdutT+CPx63EEYVMJ2GLioi/fO1vAwQKN+Vri0mrTP1i6zBR5g7P5BGgM83fCeieZzQt86r+WZs9kKg5iwXQM2LsMA+aFBvJPoCe3wUQYmQ3PiiQB7BfFHN6jXM4ETKTets6S/rXkAidSTHJ4Mv6SGc6mMVN/ZY/6n4zClegsAH3H35iFYmnVjKKfHxrQF/YooYyLMGmTQ/BqFwZ4OwqH/ejhulti+rT3dww373r6+REJmDUqdnbBJV04olLHceWitwHvKNi3sX0toXJAxgT2hh+LRX1GCDdIf8yPUq1Bv0OC6kFH7FgcKsrqfw1Kn74dSqjKMBNBoKPWUIhV1q3iE5mk5YmsL1EQRlcabI5UlT+3mEU0i3SkJ4XDjO/ZCSqpFBHaxpkLESDu8rFX3sX49R7LemJ6Ht0bWD01Ra8e9E12EcOvxNf33Q2Be0upzwiii+QDduE6XrBDMNmFAYXugQiyOUT3zVSq1Cb5DqaMp/pTvtgI9lRMotZ+K+KE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(376002)(366004)(346002)(396003)(66946007)(38100700002)(478600001)(36756003)(26005)(5660300002)(2906002)(6486002)(31696002)(16526019)(186003)(66556008)(53546011)(66476007)(31686004)(7416002)(4326008)(86362001)(6916009)(8676002)(956004)(54906003)(316002)(16576012)(2616005)(4744005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVVmODV3b2lpN1R2aGRmUmZlVkpOeldJTTV3Tm9UU3RMd2FKVDVraDJrTlNr?=
 =?utf-8?B?Y014WWQzd0RvTnU0LzBVaWFYVUg5dk5oZ1NPS0tDN3VQc0lsZmhQNTJsczlp?=
 =?utf-8?B?Szk4bVphMVkxc0ZiL2JLT0lFOGtWeFhpcGFLSVdmTE93L2ZxcHRWNDd6TlJw?=
 =?utf-8?B?WTFkditjYUxIVEx5K296TjNQTzVpdjg0Yitxdmd5VTFSbXRxNkdhRmV3N3I1?=
 =?utf-8?B?ZWNHNTZKKzdYUEorTzkzc3NUVFNRWTA5NzZ0cVpLdDZ0TDVCWWR4bkRZTXdm?=
 =?utf-8?B?YTlPMlVNUHdqM0wvZnFrVkdjNGNGa29kOHBDWTZuVGVDLzM0YkozVDFuaFhs?=
 =?utf-8?B?OEpyOWNmbHBmZzE4Mlg0Tm0rZmNjVThudVdMZXNYMHRBTXo2S0FINkxjZ01G?=
 =?utf-8?B?V1kzYzQzVVZVSStqL2x1MW1qUmk2cjhxcllKYzA2aDM0dTdqaWI3VkNsTUwx?=
 =?utf-8?B?ZVppQWltSmNsTm1oeTZBclpqNzNBdUpDeG9LOWMyVlFzaUlWU0dCWlVia3lL?=
 =?utf-8?B?ZTNmNXlrMUh0enJnbkt0dWQwWGdSKzdOVk1Ccmk4SUZFSU1GQXNDVTFwQnZ5?=
 =?utf-8?B?TU1OQkVsMDJ1NWtNMlBYZ3o0R3RIWnY4SFhKaFNlN3dMZzBCNnU5Nkd6MExO?=
 =?utf-8?B?eGxJdUFyTFU3T0w4aXVkWHM4T0VJQlZ0NVJQVWxrOEdUQmhDNnFUUVY5SzBW?=
 =?utf-8?B?RXJPNlM3dWpJQ2p1VlhObmxzbysvVlRmOEZzSW1HTDdnam5ZaVcvWGlFUWlN?=
 =?utf-8?B?YklwVklHV3AxQmdySFNEOGtzMDc5WGdlTkltRmh4ZFhTSUNnMTFmWUVhTjNh?=
 =?utf-8?B?a1lBejdFbHA1Qzk4QmhHVVB2dG9LZTNYSTg3dHRxUk95YUJUaW80cWxFOWVi?=
 =?utf-8?B?SGRFNXFpMjNQY3N5TUJ5MUxhRjNHVFpUWmtYUzROWldaZzIzUHo5U0lxTzQ1?=
 =?utf-8?B?S0JtZlhQdUkxMmc5TjZTY3ZMejVPZExKaW9Vbmo4SlhFRWI3V0M0bVYrV1lH?=
 =?utf-8?B?STl2UVplZ0FWS0dOVXZuUkdhYUtHOE40Mi81OEJoSEJXWDd1ai9TcTVTd3Rj?=
 =?utf-8?B?WFJybEJjL0plS1Z1ZWVZUVVSQy9oeEUrV3VqME9iTndralNmYmY1MUhVc0M0?=
 =?utf-8?B?MFpIZ2R5V2gyYlZuSUFJUGdLSVFUek5VS1hxcnpNaVBoalh0d0FTZkNMKzll?=
 =?utf-8?B?YUUyQW55NGFLM2oybkpSNVFsNG9MQSt0Mkd1YlgvUEdLNkFXY2FwVFhYekRG?=
 =?utf-8?B?bEEwTlMrV3FVUHdwZTZLRmhIVDc4K1JFSDIvWU8vNE1ZT1YwbWpjMnF0TXd3?=
 =?utf-8?B?NnFaQTVzQVhOclJkUFRFRDB2MXN5bUlVVkcrVXJSSURUZ3h1NkFVTkwxQ3o2?=
 =?utf-8?B?R2o1aXlObHR2NSt4UzQyWXh4WU5aWkFhM0lQVXk1RWM5TVJSTERqTDhKcU1y?=
 =?utf-8?B?ZVhVUjFXSEI4dWRSdExsVW5zbmZsRzhlL1d0Z1RhMXVKcDltcTdYdWNpajJS?=
 =?utf-8?B?QWVRT09NeGh5Mitsb1ZLbENtTUNVMldQa3QvZVFnQ2c3bWozN3BMZkQ5TEZr?=
 =?utf-8?B?Z3RYZEd0RzdJbnV5UHdyaUpRb211M2RYWWpUNVN5RHBMZ1dUV2R2ZnZ0SXFT?=
 =?utf-8?B?dkp0Q1ErR2g2enVhTjdDNFNIdW00OXljclg0ZWdML3FER0pvbVd4UWY3ZWpl?=
 =?utf-8?B?RllPUS9LODNsZG5sK0JlOE01dnJwR0NlRk45UkQrMVhCZEpKYi9xeE4xaTdx?=
 =?utf-8?Q?1XcdsZkpR6zPL6AiSMeRoUJPna3A1Nvjp6FpppE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44344902-adcd-4505-9230-08d93f95653f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:15:13.1997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fw2ce7cQJxCJRChQqD9FGvzcLj7n1MJGdJy3Zy3nVKPoVpeohRrxf0ZsewgDKsVAdSg9XJztiqdeTexlxnMOWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 03.07.2021 19:11, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> At the moment, Arm is providing a dummy implementation for the M2P
> helpers used in common code. However, they are quite isolated and could
> be used by other architecture in the future. So move the helpers
> necessary for compilation in xen/mm.h and gate them with a new config
> !HAS_M2P. The other M2P related helpers are removed.
> 
> Take the opportunity to encode that CONFIG_MEM_SHARING requires
> the M2P. It is done in the header rather than the Kconfig because
> the option is not defined in the common Kconfig.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>

With the other Kconfig hunk moved here (from the earlier patch)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


