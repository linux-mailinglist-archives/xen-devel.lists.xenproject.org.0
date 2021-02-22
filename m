Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F033219A8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:04:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88084.165461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBoq-0007G6-VS; Mon, 22 Feb 2021 14:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88084.165461; Mon, 22 Feb 2021 14:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBoq-0007Fh-SL; Mon, 22 Feb 2021 14:04:12 +0000
Received: by outflank-mailman (input) for mailman id 88084;
 Mon, 22 Feb 2021 14:04:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rhT=HY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEBop-0007Fc-Sx
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 14:04:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe4616f5-5361-48db-803e-34e202b22944;
 Mon, 22 Feb 2021 14:04:10 +0000 (UTC)
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
X-Inumbo-ID: fe4616f5-5361-48db-803e-34e202b22944
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614002650;
  h=to:from:subject:cc:message-id:date:
   content-transfer-encoding:mime-version;
  bh=PicZB/wZknwts8R5utTU6NvVnJ3tHmNsSXCjPN56PPs=;
  b=ZS5jIIYA7rlQqVWcKnfB8RGo1YmWxVVWgIj0NE/NFIHvOkD/uzLejEej
   Sf0UVDcL89Grt2wnNSmmN5OF9PaUsBEKtUQ1uE2vQahbGOIYU+YcbdS8P
   fRxSde/2YDnUxMIFYW9a+2A4+MWy4A/0Gsp780aVKM2rYcZMxbo5rGti+
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rj74Scy0TG1GdU3wEYD8upGeuCUJLTPQX8+hYED5I0X01rduDn1a0ScuMImui0R5DHBO0oK5OU
 nWN07Scp7Mcc2Beo+3VDB4SOLlOr4wzxI+GTEJeuzywmZB7tVINc/Vi/MQvQGAMxOiiW8Zxo5X
 2V+3goCMSEwdxw2aPwJAKWxVOiiOl7x8uJ2s3Yuig+dXmeo039RUrQXX8m3L8WgH7OXHWK/3hL
 VKF9ITvp4xclaLcUROFNGDU9dr0OI3JOPVvOK39NKQZoGxqRYJhhwcnalYsoRIHcraz+VVkXz+
 b0k=
X-SBRS: 5.2
X-MesageID: 37734600
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37734600"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3bePMqM/3odbsDgzL+NZirLbrzPrSiuhYRgUfadz0rpGM8a4VLG6QXiD33oaPTJrqGX1WS+g1BX4d8taVQQ3LzUnoekPs3FjNF6Yk8IwhXJ6xCICrJWrvgNhBeRwO4sm2qOorrDRQjjsoMNUYFBHH/oJNp+omgmB5N6vIYCQYvOxxAsPuDMnxL5kJwY85vkA5g1QvUOm4s/kgY2RZxk3tVP3PhaOLLBIB5ZTNr6CKiob9xvZeVk1h7rQDjHynAK9j/8pqh8H69NMtv4+y2bHU5KmdnmwwZxZ5GPJmnMmJnSaLQOg0/6xS4v7DMkCLPkDAk6fNAIyxIBh5V1JvSADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PicZB/wZknwts8R5utTU6NvVnJ3tHmNsSXCjPN56PPs=;
 b=CDxog2zaks3ljgXt9UaMqRQqjQVRg21lqe/oI47ns2MJ3SrHw1IM1HLFoqr3+Y4L26CQ5nDyMTWGE7S/B1xX89eYwplgd8XISid04gqWXX9cOsD9owsIwfSs2Gwc7070gwbc5c7NE174qmPTLC9IxTpr6ThXAmJqv1i3PIyNH81dJaLjH3baTXc1vedhUEYYpRrKDLoLMCa5YPGtWqGoaL/orSh40+8hrgZS0w+UMwTn+4ovr628Tn8dQ2goW2dGMFF4Qp1jARpW9SgwkqWt6twGeWpMDtrkr0SCdZmK2cUKrBXluOhPkJscgsmkDjfmiU6ccLAR98qGJ97l2km4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PicZB/wZknwts8R5utTU6NvVnJ3tHmNsSXCjPN56PPs=;
 b=Xot7mxo6CXhGtFb7Yurk9YFj7eg4exLVcner/WUr0AVHOJHe7Yk/CBaiz0WrrbjKcFDxar8c1nKzn9h99JjB84+bIfh/ZsmGGOHX38Fl0ksoD4C6FkaYFeWZHOrKUeEMG1z0KgppcSJuG5PkX1FNrubWqy9p9j+N+P6e7C1nqxY=
To: Xen-devel <xen-devel@lists.xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Stable ABI checking (take 2)
CC: Ian Jackson <iwj@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Message-ID: <68c93553-7db5-f43b-b3cd-b9112a8a57dc@citrix.com>
Date: Mon, 22 Feb 2021 14:03:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0035.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::23)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01a9ad84-d35f-4821-d60e-08d8d73ab7aa
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5776:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB577676F7E364B03733374CBFBA819@SJ0PR03MB5776.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSDchbsi2ColxT841lNRC45p3R6NcruidAfqzkw2O2YgKDTlbBnHs1UnNj0hXAm0LWlw1CTqrcnV8+vtnqXge+nD80wKLyg5bzBIdKVQP5Mf39B8/YomUJIBZ6cV3STuIF2WOPCei+fbLfC9yS5U/KP2l6C2W31DWP5r069RIHMHDX0hLuhYvHtCB35if4aVebGT371TqlKxA8hCFMnvMTGVZNjJFNnL27Mg3Vu+JEdNbVVCYRvU7LFtyznzHIcIeV/2C+0eZq+g2XHxdckUOm6b4CG7+eJlKVzgIXdR0aECC5XpighVBjzX3RL/AJlLbY1fS54qIJaR6s0a7ejUg1NfiLMj9gx+epzxDJ6AZy//yMqGYTuX4v3TiEqYroccS4LzZBo7OLbdDxVJ8hi9krf060k+OQys4gOP/6m3uAxIm8zHolCtE6D6Ggf6xubxZuQxNw+bHcIDNzihY+lJvx1uE3lUY2XctXuB2xJk8bV3juTefrvnbT3GVAcbWNSgqK2az0vl858ZBT0PKIaWbX4OUuQsdY3Vr3HuC9oz5n1HMIuPHgftoeEWzO7OPiNHt9FGQK01boLYo/5HvOWHT4XpaEGBw7/jqE0AhJt3DeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(6666004)(16576012)(316002)(2616005)(26005)(956004)(4326008)(478600001)(8936002)(6916009)(86362001)(54906003)(6486002)(83380400001)(8676002)(36756003)(31686004)(5660300002)(31696002)(66946007)(66476007)(186003)(66556008)(16526019)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bWltMzhHcTFmdDBPc1NQT3NHVThndVowK3NEZkVrOGVQZkkyejFlRTd3aXky?=
 =?utf-8?B?dlkrWkM0SnRPYTFFemh6cHQwOGdDUThjZVFvSkpiZ09NaTJjRVRtWUtBc3lR?=
 =?utf-8?B?QTFPeTkrKzI3NEZSNC9LTnVEZzZLMW9ORTc1Q3J2MFpGTE9CcjdLRDU1UGJY?=
 =?utf-8?B?bHBoZ1RKZi8zSjdxamNjTUs5S1k3OWtzS2FFZFNZQnlnOEEvcmVqRFZ6Mmh0?=
 =?utf-8?B?S1JhTlFUcitHSzRTc0pYWEV4dzVCcWhFblM5Mk9qTHRmTk5BRHdhenBvbzF6?=
 =?utf-8?B?Zmg2Q003RnZaay8xWXNCbUlTaGl6eGovZXpCOVQ3Z01mblVTUFRlMlpiaS9Z?=
 =?utf-8?B?NkFXZ0hWWmIzcXVZTzJvNU9Od01LcVA1VFg1eHNlVGdpYnRwNUZrR1ZiUkk0?=
 =?utf-8?B?N1ArTFgrQWMrblJDeVYrZTgwQU1pS1p0M3FpYnBLaFVIZWlrYlZXUDVGaDM4?=
 =?utf-8?B?bUhKR3BKd2lQM2x0ekE0VFBWeHpSQlBxcURreDhQTFhsWFVJOStHNldQamdP?=
 =?utf-8?B?enFSZm5ldFZHendCSWZxY2YrUEplRzlBMnlrTTRuV2ZXUXVzQk9ERnpEUEFN?=
 =?utf-8?B?dkYxaDIycVlHSEJTTHY0cVlnQzVhM2VVTWI5MFppVTBPVFgxTml6dGtLVllY?=
 =?utf-8?B?ckE1UG9qZER5Q0VFdjBkVzNocXlUN3gvdG03ajZEcXZlYlpyNmNOeU1CVDBK?=
 =?utf-8?B?WmppM1lPQW5qK281SkpuZU0yUE5wR1lRcDNGKzhLQ0Fyc0k4b2ZhTE1HZUFy?=
 =?utf-8?B?NFowQUx2aGFqMTFwT2pJTUhIZXFTeS9NdENuSVNHTHlDS1Q1aHhuNFJJQ3I1?=
 =?utf-8?B?VU5SazRjTHloVzdLUm4rbnVMTHVkYm9ob3hxekNnd3hQR1U0Y3J4VkJPUktX?=
 =?utf-8?B?MW9WMzdsS2dKdHBlOHRJMEhnQ1MrdlM1LzdPU3FJNDZleENkNDU1Z2NjNk8v?=
 =?utf-8?B?aytlaDVlYklVT2ZacG90MysxYkxaY3NicFRNR2pybDFac3JuOXlZTEFiR0pw?=
 =?utf-8?B?aW8yd1VadDIzYnVaRUNxckRka2Zya2tZMndvYWgxSkFzbEExS3lrMWZSR29i?=
 =?utf-8?B?Q0NjRkpXeDlFb2ZGc0paTWl3VTdqQzZZZEJYZWM3UHk5KzJWY3RjRzl0Y3Bn?=
 =?utf-8?B?aGRITHBReUprUU1rNEVGeUR5RTUyM3ZXeHVER0luUDE0QUlOZk9mZkZ0U243?=
 =?utf-8?B?aWs4RWxpRDM4Q240d1hCUHIzMll4RWpKcGUxWFkvdUtBRVU3TkpKWll1Q3Iz?=
 =?utf-8?B?UDAwZUV6UGU0bXJLVTdsbXJDZ3Q4VkdBQ252Nm85c0pTMmtlVnZtQk1ITWpz?=
 =?utf-8?B?ZzlUb3M5eXpGQ3EzSVlveENCZTVsalJhYmFSMGRJa1Z1MmlEM1RYcE1Yc25B?=
 =?utf-8?B?TFlvMGNvUUhkcjUvRzJYN3BDUkpUY0lVSHhnVU82WEkraTk1QTZKNTBwM0NY?=
 =?utf-8?B?RHlBNmpzOWhYVDlMckE3a1Q1Q1FEZlVubVNaRjE0cXNMb2pMQ3R2S1dyRzZt?=
 =?utf-8?B?cHdkVjJyK1NlVEdWSURxSmgvVTFLbUNEdVBuSE9HMG9xV1ZyZlZyaE9VYlE1?=
 =?utf-8?B?cVQvNm82NDA5eVU0NmEzczhmbnlMUVdpYmsvK0ptTnF1bnVXNnZrdHlrSTVy?=
 =?utf-8?B?YmoxTmoyamlldmdYd1BvdGQ2ZFNjaXRSeVNCNzVHN1gvRTNzY2RNTGZISVFC?=
 =?utf-8?B?bS9vME0veDEzZHZINkpRWkVheHJZTzBUeEdhQWRlOFdYclVjbEFPanFPa3hj?=
 =?utf-8?Q?WOIXK8fQ0JPETN0NyBzNqyaftkL9AVQt8JwoIDK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a9ad84-d35f-4821-d60e-08d8d73ab7aa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 14:04:06.3765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7ogtZTzwyGAdp6bS6F7N3bkuiq4BR3TEDhhchN4KjOQKfXq3YSwc8nwSelCppqk3yW8v+w4icQmWfGngOkuLYeSteuGsFyKIuZ/iepdpaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5776
X-OriginatorOrg: citrix.com

Hello,

Staging is now capable of writing out an ABI description when the
appropriate tool (abi-dumper) is available.

We now have to possible courses of action for ABI checking in builds.

1) Publish the ABI descriptions on xenbits, update all downstream test
systems to invoke abi-compliance-checker manually.

2) Commit/update the ABI descriptions when RELEASE-$X.$Y.0 is tagged,
update the main build to use abi-compliance-checker when available.


Pros/Cons:

The ABI descriptions claim to be sensitive to toolchain in use.  I don't
know how true this is in practice.

Publishing on xenbits involves obtaining even more misc artefacts during
the build, which is going to be firm -2 from downstreams.

Committing the ABI descriptions lets abi checking work in developer
builds (with suitable tools installed).  It also means we get checking
"for free" in Gitlab CI and OSSTest without custom logic.


Thoughts on which approach is better?  I'm leaning in favour of option 2
because it allows for consumption by developers and test systems.

If we do go with route 2, I was thinking of adding a `make check`
hierarchy.  Longer term, this can be used to queue up other unit tests
which can be run from within the build tree.

~Andrew

