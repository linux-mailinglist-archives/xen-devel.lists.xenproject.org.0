Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E391424E6B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203343.358446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOJG-0002Oa-M5; Thu, 07 Oct 2021 07:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203343.358446; Thu, 07 Oct 2021 07:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOJG-0002Mm-Ir; Thu, 07 Oct 2021 07:59:22 +0000
Received: by outflank-mailman (input) for mailman id 203343;
 Thu, 07 Oct 2021 07:59:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYOJF-0002Mg-AF
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 07:59:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 799b81c4-2744-11ec-bfc1-12813bfff9fa;
 Thu, 07 Oct 2021 07:59:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-3QuNhm-rMiq-R7rs8-SyPw-2; Thu, 07 Oct 2021 09:59:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 07:59:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 07:59:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0202CA0009.eurprd02.prod.outlook.com (2603:10a6:203:69::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 07:59:12 +0000
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
X-Inumbo-ID: 799b81c4-2744-11ec-bfc1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633593559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=14jtNC+yODdnQcK/dhmt/nz3nPzJMnSeA4g3gldk2+o=;
	b=QGZ0eClbLf7+tKolXce4i2Qeyb7j7MYvf/9dy2QY/6P0MLbwrRujTWWZZuTKPTGeHoabwS
	M8IjAX3+JAeRICODn+51FJiwgR+4uCrEobbguosl4d0QzYfICIW30FfgO9ZeTOJOWMY0DP
	eSI7DbdFXNJMn6bhtjFLMp67MtONETw=
X-MC-Unique: 3QuNhm-rMiq-R7rs8-SyPw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/5F9ZmvcWTg5NFiTJSns8T9NaWLRRT8cV0SuYPpL5HZcuooSoxTG8VpdGgLftNdhxSk9ZFQBJUWJTfZH5+C+Xpno+eLCXD7MjiPLXz/m4/NgboYR/FmFkEGbi2Zwc9smUjKD8UuKZqUXSkBJq+sRoltWx/toAzJti1og/NeC4z/iJ5h4B+bcF5iB2oXnJkqXcOaE+Lk8joR1nbh1tuspZq6Q76B/WPlYqBEYYtmifs3R6GV5beGXls0K/oaY9yVGQHJvJ9gcNGPXxhRWFAYp5sZF6TcxvZkbOyXygrYmCvX/FDpg5MziQccTzvarVmT3j4bVo+9KZ1duLVH32/0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14jtNC+yODdnQcK/dhmt/nz3nPzJMnSeA4g3gldk2+o=;
 b=ZrzmrA8YNY20M7Tr/qAcHxu/LtJSDtySF4Ha7kyMg4Sg3s+hcHD5EQpDl0TD0NrsxB2FHFur5jbMqAhcTzNpwOQXSVc9eDedaQfc6kj3uDpD1QENG47AodNMbxz0QSaI6r8B9bS7ujFlHIW1VfKVqpfec5zJyv2mn7KW51dLvvP3WETK1vM1RwszmqgCAD+LKx6g6pG1/94jJKua8CE501G5oAOO+7k5+aB6kkN1nqmALMcCjAD8ilK8AZ+KWUUZCYIDTjkvJYkZLBCl+5r64LD6ka7ERh4Xb3cRwsNaGtkgWPxZ5jQ1baSNFvzu6//M4kP2j8dWiSNoyNqkjn6/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
To: Michal Orzel <michal.orzel@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20211006105827.15217-1-michal.orzel@arm.com>
 <20211006105827.15217-2-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c97eefc-77a0-5e2d-92b1-6cb704a93e13@suse.com>
Date: Thu, 7 Oct 2021 09:59:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211006105827.15217-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:69::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 682e8a4e-c5ae-4373-1ab4-08d989685a78
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5903A036E88D28C01C1F670BB3B19@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJs2gRkNNVDxAfAiJrafKo/NKGX9ws5a8TvCbXjnN8v86jeTEyCMjJ7Yj/T0OXuXpwDW2WrwL6HCnfDplb+tWXiMT/vt3ws1FGRVYOMmBdEy+Q0e+POtNiIfYUISin7HZFid8Dko56bP3Z9lQHGoSyZXDv6fkewJHmAYZvSHtULgTQxyeUdOWSrqJmx3lmBZG6uJWE+zU6YDrp3sCs6ml/Uy6FHwHVxhhXjNpGHnjB4y6lYB5KmdpV40T70s9z81BQ9dejZg9s67LR3nQ96hNU0Y2btTBKRSaBCNGEJxij1Z3kVM3tIHs4/JDEGg0pf3+pKeHtzs4V/oz5seRa4W0ND5giEWr7p65hvKniD65S7RFfq87ICutQJV5xbno75WZlsMtXweElZsAwJ0JxSHHfVWGf9nKnlKoh+chQe6ppe5xwpjsueAmG6D0eiOE6rpQbZCRWHqneuPck5GDOa0nc3pFo9bM/zIDt2m3LQ6E2JPo9LkOrrei+iD5RkwhY3FnMgoylQNjz1kcEBm/egmPK2TZx6ldpJZNFc1gfgzPD2wQ7kpWnS8pD/O7vhje1h7zsfzNpDyYdEKLrBxmsKUIel+VTzkbb8U8atXezN4MCwDA+NVqjqPC0mdcROkZqNLjUQUOjMoFMOMDKevX+detOlMKRNXZwEzxZKhJ7uOufP5nfNOfxmJGg4nBo0UEp25l2DpUQdsDdqhhKHo7r/l1p6mS1AKWi8IbR/TmhoOG/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(31696002)(31686004)(8676002)(38100700002)(16576012)(4326008)(4744005)(8936002)(316002)(6486002)(53546011)(66946007)(2616005)(86362001)(508600001)(956004)(66556008)(66476007)(6916009)(36756003)(186003)(54906003)(83380400001)(26005)(2906002)(7416002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEZkMVlJa205V0tkVzRBS2plbDR4YWJTRG9hU3UrT0hlZExTQXNCdWZSd09v?=
 =?utf-8?B?SkkrcVduVGpPeTVvMjR0dTdtV1BVRWxQa3RQTGI1NVRCcjFZN1BibkhaWXZO?=
 =?utf-8?B?eW41amJiUlZZSzlTRkR1R015eTJmWk5hMENwWHgrTFZudGoxcEx6dUEyMVYr?=
 =?utf-8?B?UkorM2tmdFlIL0FxckkveFFZcnFFcmppR0t1L2hhVUg4UjhUdHpRUXN5UTVU?=
 =?utf-8?B?Zll0TllWdWxydXVHSEdTUE1odGlKYkRiQ3gwTEdMRk9HWGluQmJUVC9xNlBB?=
 =?utf-8?B?UEhIb2dBc2czbE5abm5JclhHOTlLVzg5bXFMZHNYNkkvajg3Z2ZaN21Ydzdy?=
 =?utf-8?B?ZUVidkFUZ1YxV0dPQ1dkejY5YW9GSnZ1NmxrQ1c2Y2YvaGhqZXQ2UGRLa21r?=
 =?utf-8?B?TnU2TmZEUjdFYW8vaDFJckh4Qmw5ZXVhc1pLV0gzaUE0WWlMWDlUVGVVajJi?=
 =?utf-8?B?SExWcWdpNGh4c3ViMU1ZVFlWd1ZwemFBWHNGUmxQZ0pRanI2WXhtUW1CV1VX?=
 =?utf-8?B?VHB5WmJSM0pma2hJVzB5MmdpK3NUU0dENUZUeThaYzVBWlhHVEVaQ2o3N0c3?=
 =?utf-8?B?b0FESDZSTzFNVVNUVG5TWGNhNDJ5MUNPK0xXNVVhdnpVV2RQK0ZVK0ozTk42?=
 =?utf-8?B?UFFDZFVYMkQ3SXp5MGVLNkQ1Ym1MaTRRNHJBUGZnV3JuN3RNYWJobDYxMEwr?=
 =?utf-8?B?QnVGclQrTDNYY3VlL1FwdnhXM1NhL0VoZXpSY2FadEU5V1R6OHdieVArV01R?=
 =?utf-8?B?QUZoZFpBaTJ6d2lSTXVRT3FsRkQvanpLQ1d5MnI2TzN5WjhEdUZkcEJndEh1?=
 =?utf-8?B?ZFBiSkhUdnJmSGJhS1BvbXVHTjB5MEJ6TmxaMDR1TEoxUFdaWUFCdlhDTFRy?=
 =?utf-8?B?czdJSFJMbDFXQms4Rm0zdXFCR2VzeVRqT09RSjV6U0t4V2oxTnYzVWJPQi81?=
 =?utf-8?B?OW9McEVMUVJvMUtOb1F0bysvMGxlYnpPa3pLRk5TN2FpaFhnSUQ1c1dPN0RP?=
 =?utf-8?B?aFJ0bDBCcmFMSW85UFFmenlWTXo5NjJPYXRjSThUR3VYcFBLSUJjcjYyTXZI?=
 =?utf-8?B?Q1N2dXRVVlNDZ0NVbjQ4YWEyVUNQNGhaemI2RjNqT21ZUGdFQ0orWUhQQ1BF?=
 =?utf-8?B?WTE1QkpTdUdrYmxTa1hvUjAycTQwWkRiS2VxYmVPWXk5bCswSlpXcGZnMlZG?=
 =?utf-8?B?UXI0K1VCR0htTGVNRXc3dG9RcDZUdGlGUUdXMzFnMThsLytjV0U5dlNGbW9N?=
 =?utf-8?B?UjVVM3l3SUhSZU5rdXNOeXJaNkF5NjQ3cmtzM2toNjhMVVFCdy91dUlJb3JH?=
 =?utf-8?B?UjZZRitQVHcxK2Y2aks2QzluRVg3dU5MSVhOb1dONTdnWTU0STN0d0dvZXlH?=
 =?utf-8?B?MTFpZW5Kam5UYTQ2WWI0RlJrU0lpWnBDeXZERVVsemFUNmk5TlQyMUswTXRJ?=
 =?utf-8?B?eSsvUXhIa254cjVrcER2SGcvRklmQ0JkRjYyRGJXMnp6cDZzaXVVTFhyWTZR?=
 =?utf-8?B?Wkx5NFJ3SGZzVEpBZ0VLbHNYbElHU2w3SWlHNVovekRLb3hzcldCTnM1R1c2?=
 =?utf-8?B?ZDZuMWlORGR4ZE1DWG1IMUdjbkFmcWlYVmNocjdjbm5RU010dEVIMkJZT0RC?=
 =?utf-8?B?ZUxsSXVEaFJ5RW1mQktGTjZqVzR3YXBELzJwVnhaT3hLd2tjSFVuUlpldEpa?=
 =?utf-8?B?dW9USjBUTU51NFFlN1BUTGdKUnhXN2RURTNtN2ZTb01meU1ZalIvckVnYkxS?=
 =?utf-8?Q?NKBN7eS+HsIjfFqxPql7UJ6UltDF/t0nQYIXOTc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682e8a4e-c5ae-4373-1ab4-08d989685a78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 07:59:13.8419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDAFmU2cNMHq3fjoW2jd4aeGNiuhL82Vc2FQBLm6WrNKyxGRD2eAQlkO0BmjtSttg6ixaWcTMmfeTkcRBTUe9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 06.10.2021 12:58, Michal Orzel wrote:
> Introduce flag XEN_SYSCTL_PHYSCAP_vpmu which
> indicates whether the platform supports vPMU
> functionality. Modify Xen and tools accordingly.
> 
> Take the opportunity and fix XEN_SYSCTL_PHYSCAP_vmtrace
> definition in sysctl.h which wrongly uses (1<<6)
> instead of (1u<<6) and does not follow the standard
> of using separate macro for a flag field.

While adding the u suffix is fine with me, iirc not introducing
_XEN_SYSCTL_PHYSCAP_vmtrace was a specific review request at the
time. I would similarly ask to avoid introduction of
_XEN_SYSCTL_PHYSCAP_vpmu here, for it not being consumed by
anything other than XEN_SYSCTL_PHYSCAP_vpmu's definition.

Jan


