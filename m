Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A002FA9BB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 20:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70005.125566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Ztp-0003H0-EK; Mon, 18 Jan 2021 19:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70005.125566; Mon, 18 Jan 2021 19:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Ztp-0003Gf-B2; Mon, 18 Jan 2021 19:09:13 +0000
Received: by outflank-mailman (input) for mailman id 70005;
 Mon, 18 Jan 2021 19:09:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1Zto-0003Ga-6O
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 19:09:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 216ca5e5-a183-4b94-b2e2-ad8ebd3c4e97;
 Mon, 18 Jan 2021 19:09:10 +0000 (UTC)
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
X-Inumbo-ID: 216ca5e5-a183-4b94-b2e2-ad8ebd3c4e97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610996950;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DsO2A71O61NuXSHQmmwCi65UBJevGZ4hejwcN+wQDW4=;
  b=HiwH0hBnRDtZOUtnc7tGv6v4Hb4Aqa+ln+Ea5eBXIqvDw0B3QAgSVZDS
   4fymj7lMVPOp3q/FIPdiiKCWsnpXfRL0QfJiisSBjzttK8thDrpQkBEV+
   Sjey3ND+aDw25nsFWHkLubfHlTh7inCKk0q99JQNiQ+Grd/cZgwISwGsn
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4T6v2+DtaakYqqPqqNRBhbM0tHWz4ADdS0oLsISfflNTBLada59F49b8yGlJWLqhjjwoxYfccY
 iRzCIeTLrMfrCMdALnE449w2gPMuBkNC8fndkQGNR7GA8MDEkfFDXpYK4BHPreLvKQBWXFik/7
 z/BVAtzaXZKXWtor4G6Yd0t+yy4hEsd7sY5WoRUjBwh4T1Y+eR2s6dcRgc+TbtxVh2LrhDvWyO
 aju9AKSyqDE27W+FQk+jbSTJw6KSloNG2hhfXtc4mw9sQSJkRyZm2+JQYB3mbwX99H9nIQ+9DV
 JhY=
X-SBRS: 5.2
X-MesageID: 35370569
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="35370569"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktLE8TWdFCcBJWtl0G7gaLsVi6NJBysCUJHetvaxVC3/wXSEBJF/AfNVQTsxP4/+9hw9T/+xfSeLLFVg/kQoE1DRUk0fUHPOhjc8EY1oqIvbkuqEXY/wOzZLsJsorVcH/kNvpV5YczHAHP/Q81kQGmd5ap7J+QnUhCb9zuUThaSybFpqWL7JXDB5oP2nJH74rc38MQBz+AgqodGYHl22IHTIqtEbIeN5G/BHRaBxhq+qkKpmoN8Kt+bClDjpGwHU2liEMX5d8PFKyCZAzr0GqamxPufhjidLgiZvajyXwBmPBYk9+xtm1A/E8K14goffBOXlwMZZLAme8J2QiKWYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsO2A71O61NuXSHQmmwCi65UBJevGZ4hejwcN+wQDW4=;
 b=Q6foPQ8WEyyZhOYYHO/vQBLsX2h3bo1JKzowe5Sxm2OUdaDcpgLJ7K/TCisP46ILTVp8q3qIbT+wDIA0eNv81o5T88M2sEVy0EjSAgPzdyx8Sfi6IUBRtYaH+k/Ud4En8u8yMh/X/mVIT1CJ6EOd/6Tz+k+oL5IA3qfV1MFh5n/KwKm3gslV58VnOHg3p65UQK4+BNUsBeK32PotpThKUu1ys8SIEqRDuctGJio0gWSyGtdDyi3rLh0fNrm5IItrKxRcsrBH9NL1hioGZZDGdAjIIeqsZeaLACUXfRToBFglHhrjHCbSMAbuhi/x8o5Zh9QxWceGCjbRVlcDPizuJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsO2A71O61NuXSHQmmwCi65UBJevGZ4hejwcN+wQDW4=;
 b=EMhRILGlmM3SzNUPBQaN33QWHDYqaylEHZ5itpKaPk+6uPgow5jzb0duQ8DcBLPWBRcxNiKDbp/z2m22kw8iUHkhBO+Mg+OFpFPuC78g7tXzGgJr7qw6nStLpsU5RdvUP4v4V5Y+Bt/CQPT4Oks+QMItjq3uE4F0SNI4DJcRrIo=
Subject: Re: NetBSD patches
To: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
CC: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <38ff017c-ef9e-98ce-21c9-1d0bc9e46b9c@citrix.com>
Date: Mon, 18 Jan 2021 19:08:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0417.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::8) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74d5af6e-a698-4cd6-0c6a-08d8bbe4866c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5185:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB51853DE4F7140A811219CE62BAA40@BY5PR03MB5185.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0NS7/rFsyHlw3HaE+sJY5m5K/lwHolvxj/1mv/P1EmQf4KUIlYm68jBDLdOjhBtdee0LTcFIRR+7i9lHT6QR7rdNwJ9r79jhmByQ8HxWSLvJdcLBnK487lH2T/M0aXkGhqQ/QqZqqNPWZo9P7kpmx/nIyG1tHh82W7/MgHkDudIR8U+AL5UnGQsr7V/uhCdTuP97qM6G2eIKU3yKaEm4S5x9w+VoxHuggt2VV9V8IrUHywoblraPZse8HGqGbQfFe2Ll9scl4VEPmbK8VQYIP8cZ8dcLyYaEU5/KaZhf7PxK71qSTVSk38tn6niO9Z9wwyqVgKtv8/4o7EPyxCmWHWGvS0skfDBu5OQvQfIrcO2TQnDy4i4lhRledaPYMGAznBcufpZmtCJI2LsDvR4TYCIaC1RlhaLMdH6rWDVkv/moifKKXeKLRYpB/jlBa8sOlhbk8cPLj5KDvHwrueTL+92xRCf+5P00h8M+P0v8Bc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(16576012)(31686004)(86362001)(36756003)(4326008)(316002)(66946007)(66476007)(478600001)(558084003)(31696002)(16526019)(5660300002)(6486002)(54906003)(66556008)(8936002)(26005)(186003)(956004)(8676002)(7116003)(3480700007)(2906002)(2616005)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2I0TC95YlhIR0Y4N3JEdVpQRlB3VTZuVlVPK3BMaFROeGdXaGIxUXZaSllG?=
 =?utf-8?B?VmNSY0xqYWJPL21wUXVaaUxNaUMvRU5Ib2QxNlAxSjNrV2JGM201NlJaaVM4?=
 =?utf-8?B?OGVnNVZXQTdoWDl6Y25ObWlxMHR1ZW4wdHhCMUt6eGtVNWx5Y0JJbnVUb0VX?=
 =?utf-8?B?ZzEwV09xMGp2NW9oTTVpUjRSVEJWWlhZdk1ZdVhzaTUxTlRoWGhSSjhoc2Fo?=
 =?utf-8?B?MTBtOFN4ajVMZndrKzZTSHNTNTQzTHB0VStRdTAyaGNqL2NGVTlSd1BURXhm?=
 =?utf-8?B?VUxTUkRTeHE5OWdNMlcrcjVUYklzOUxnVFN1dVpNNmhTYlhqZnhBQ2ptcmpz?=
 =?utf-8?B?ejRVSktpYWRPa3dnQjU0SEptSGZVM0xrdzJMNjc3Q3RoZ0ZqSWU4WERLUTZm?=
 =?utf-8?B?dTNuNTE0UVdMSEtYcm9GbTBCVWZpNGtqWmFZR3dQUzd5c3JBN0tUQkt2M1pH?=
 =?utf-8?B?S0YvTndrRjU3YStpalRpVzlQZ1BxMU1TaUdiTE1wZFc2NjNCUnU3UGVTSUFP?=
 =?utf-8?B?MGFGd3M2TG5VNVVadEpnQUhBSG1PTmFqWURCeHFUK1ZndDRtdktWendLOUtX?=
 =?utf-8?B?YUdGOTFOcThrdDRoSjFnQUZZMSsvbysyVHMyWkFDdmhvNkN1eEl2V0NSaUZ4?=
 =?utf-8?B?eE1qSDJGNkhZMFdnc2tSVWk1ZDhOd2VUeVF0VEwxbUhoKzlXOHNoVjQ3SEpC?=
 =?utf-8?B?MVlLMlVFVzdUczhPS0pVdHMwS3c4ZGRVcXpZb1VVTGdBRTU4U1VCYlJHWFVI?=
 =?utf-8?B?aU1mMDcyZmIwZ0VUZ2JGYTEwNk1OYjJtM2x3d2JISTRjVHp3N0FySXlvbWtM?=
 =?utf-8?B?dEZMcG11VzBqMHJPWTg5MjZVc1p4MVRPbEx0WkVEb0Z1bzhtRllSeCtjWHdz?=
 =?utf-8?B?QmJiR0RtdTlyWjFBbFpIVDd2WFU4bFkrS3NNZGJqUWQ5TFhhbUVPcHlMMFhu?=
 =?utf-8?B?OTJ6N0xsQU1NVjQxUUlnQmsyYW1yYTJCMFJPdlNEMTZOWWNiL3JPaGgxRERS?=
 =?utf-8?B?WDArUXBobGRoeW4yVG5PQ1BSaVpZZkhVeFVpbk9FR3BOSHl5b25sZ2JmeFJI?=
 =?utf-8?B?Z2tzekgwOVpXbTcyRU9PeHVrbHM2Q0EzQTBybmJVdzBXMGFGWGlyNG01WlMy?=
 =?utf-8?B?QTZWOWZBNmo5MUhXQnZRam1HYmZnblM4QjRFd3NoOFIzaDMxQkIwSUxrSnJ5?=
 =?utf-8?B?cVJJTVNUK3IwcDhzanNOaE43U1N4VjhQNTE1emh1bkkzSHZ3UndlZVdZbjVQ?=
 =?utf-8?B?cysrVFlGME1QbjBvTlU2UFUyVlJySVBsdXRqMG02aEh2cjc5Q2FvamplcldO?=
 =?utf-8?Q?WDoPg3RSI/kUw0Z6eeToKb7MoHLAIi8Kpb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d5af6e-a698-4cd6-0c6a-08d8bbe4866c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 19:09:05.6979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aX9o/aUFiGkQO8++ggg/5yGCLgSwtIk3pOTthAea3YaVJY1GAkWmC8EodEPGCGJpAK7UiuuMV3XDuQBU2J4NTJQXLzYqX1NA3o17FIrgpHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5185
X-OriginatorOrg: citrix.com

Hello,

I've committed some of the trivial and reviewed patches.

I think all others have outstanding questions, or really need the
identified maintainers to comment.

~Andrew

