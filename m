Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BD43738D6
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 12:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122988.232017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leF65-0002Yc-2x; Wed, 05 May 2021 10:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122988.232017; Wed, 05 May 2021 10:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leF64-0002Wk-Vq; Wed, 05 May 2021 10:49:40 +0000
Received: by outflank-mailman (input) for mailman id 122988;
 Wed, 05 May 2021 10:49:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leF63-0002WY-Fs
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 10:49:39 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdfd3b10-c425-4b9c-89e5-3883e83f8cf9;
 Wed, 05 May 2021 10:49:38 +0000 (UTC)
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
X-Inumbo-ID: fdfd3b10-c425-4b9c-89e5-3883e83f8cf9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620211778;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4sJlPosmIk4YYQxNqqdB7begx8Af51a7fFR4y6gxgBQ=;
  b=friUIZ2VYSC+sUB3OlN/cm9tfzfoUuDWmfahgsETiFVvOcmWCp9dApeN
   rkcWElzSy5AU0Hr0UMlhHtWNbzINuvCoOcspTQ/35kY+gmgl5P8S5Oq5W
   l4QPAegKoTVtI5XaNVR3aks3rp9skq5/WHHREGjBxm6CIrfqDkQ1mPUkB
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rtSyyteCkLLKuiuffrjPpeAjIjazETaix54pw9OLRWL6Z15akbdRmTHjgbDqUlzE82xwfyFk22
 +Bx4QK5slyzCXKadHlL2RfMAeRfqS6Yb39bghqvlgn0kIUqRq9oPsA3JtAOuezJw5EQJfG/yfy
 1w2GryGOBNRwJclwQiGQMZJs5Gy5lxnPxYind9Y0vZNxJmi0jPoUvt8r1lHNtSCmfBAnnCUGOA
 IlhFp24Bk3IlBnUu9t+//f2L1P9ebkHtwjG28ITft+7+4M9uXliN6Q7Mg2r15fpaSZHgwEUO1m
 NZA=
X-SBRS: 5.1
X-MesageID: 43096500
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ziIGH6xRtQkKr46dLyXIKrPxge4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf/LmRdQg5aCZ0lUL
 +V4cRarzStEE5nEfiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmSl9z0ZVC5CxqpnzH
 jdn2XCl9iemtyY6juZ7W/c6JxKhMDso+EsOOWggtUYQw+c8jqAS59mX9S5zVcIicGprG0nid
 zd5yonVv4DkU/5WkGQjV/T1xL70DAogkWSumOwpXf4u8T2SHYbJqN69PtkWyDU4UYho91wuZ
 gjtwny1+s1fGb9tR/w6NTSWxZhmlDcmwtHrccpg2FCSoxbUbdNrOUkjTNoOa0dFyH34p1PKp
 gJMOjg4p9tADGnRkzCsnIq6NKhWWlbJGb8fmEy/uaR0zRQgUljyVoZyME1jh47heMAYqgByO
 LePqtykrZSCucQcKJmHe8EBfC6E2rXXHv3QS2vCGWiMJtCF2PGqpbx7rlwzOa2eKYQxJ93vJ
 jaSltXuUM7ZkqGM7zB4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqJuZwkc47mcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQksonWmiJvtnAJuTRx6zmWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9rwPWX1/rZ0zj7bN9GKXX5IEouc0wH7wJljJQpUWy58mNJzEHmLcxZl
 FCLLTulb7+hWTexxeN00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPURb3H6NIA5DX9rbeT
 Qv4GhfyOaSFdi91CoiA9WoPiaxlH0Ivk+HSJ8ah+ml6dr6fIg7SrIrQrZ4GwmONxEdo3cqlE
 5zLCs/AmPPHDLnjquoyLYOAvvEStV6iAC3ZehOqXzesk2Yjdo1RmQSWgOvVcL/u3dtexNkwn
 lKt4MPiruJnjiibUElhv4jDVFKYGOLRI5dAB+9f4VSkLDzcARWRWOH7AbqzS0bSy7PzQE/l2
 bhJSqbdbXuDkBGsn5V6Krs7Wh5b36QZU52d3B8v7BsDGiugAcA7ca7Io6Il0eBYFoLxe8QdA
 vIZjYfOStC7dG63hz9okfJKVwWgrEVesDNBrUqdL/enk63IIqTjKccArt/55B+Lu3jtecNTM
 OScwKYNynDFusswgCZz0xVYRVcmT0Bq7fFyRfl5G+30DoDGvLUOk1hXKxeDNeG7WToLsz4ma
 lRvJYQh6+XPWrwYNLdlv2SQD5HNx/JoWm5C8svsotZuKoutL11W7nXOAG4o01v7VEbFoPTkk
 hbfYFQpJbmEaVrd9YJey1Y8kEy/e7/Z3cDg0jTOKsGYVopj3XnJNuH7LrDlKo3DiS61X/NEG
 ja1xcYwuzMUCSC34MLEq4cIWxZb04n9XRpldnyAbH4OUGPd+tZ+kC9PWL4WLhBSLKdEbF4lG
 c23/i428uWfTH/wgbeoH9SJb9P6X+uRYeXDBiXEeBFt/y8NlLkuNrn3OeDyBP2QyC8cUIWmM
 lsclERdN1Kjn0at7IMuxLCApDfkwYCiFtR4TZui17r1MyH2Q7gbD97GDycpI5XUzlVOmWPlu
 Lf/4GjpSzA3AQ=
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="43096500"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJO1U1Cs20szntbCqI7+CeKW3v2dEp54NWc8MaF3VZbXfw3B2ozZ/9NjomWQ/v1kMSFVjk8wESXCumjfNHOEUyYlQrwK1BdUwmVGuwpfBeEyLbr0NFuQp6ojNrkzmtwguihz8Cdmao+zmGgDbrQIQxe64hGAi6NwP0DC0sNFYnowVs0EoRu/NxfA9Bz4H16P+STkYufklGpYTYgCoR2WziSBy0EMcWKlNlcWoSqxBpJfP18VNVNSzhRNYZ6vAQecvmY+y+SzEpdAoJUk7wWpee7LFbdcscuTX69QD4NrW+jZ6zaDUsXnhlv8yHuhgNZ6NI1X4vD00Yv9BYRrTbQdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sJlPosmIk4YYQxNqqdB7begx8Af51a7fFR4y6gxgBQ=;
 b=OUa4J3wordvsf5n7B8aFnvvbZ9rVCAPVNJyeINOtv/2ZBrWkkeXov22xTJLbmQFoKcummonlww+s6rf6QXfutdcHCg3vHWoCyfAHfc9RvfTNtWl9+z/Xvyb/RcBUJlp2SN5Uq/uhdM5YR9CQGI1XCb+ACsB7B4VcOFPQxHqy3w1qUiSqAk1NPpI+tw8TJv1Jy6yQ6nVT4L7eKTMxTwFwfDb8qVXObLG62+u0Nt6bzWLaBsdaUyXt3q+Dc4ArFQWmr7AL3rHes8nP81Km9RHgKUY1gLsPbgX/8kJeKos957YbeioUHb0HiNtCVbvtYgStyQNf8SeHkSy7AinSm5gnmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sJlPosmIk4YYQxNqqdB7begx8Af51a7fFR4y6gxgBQ=;
 b=u005Wd46Nmq7eKsMndRUKmZy+Gl5oLUJEGQo2/R8/mMqJcAmiQC0kSw0dygRQj0+F16xebxPiqrIHy5UIw3QlchnItbnZr1YFVhIgBmLCyLpWVTmxfZ6NRnryJScOaj76vF6J8j76xlbEyK2Q7uH3tnO9UPkug4/0WRX6mL4IUk=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <74048f89-fee7-06c2-ffd5-6e5a14bdf440@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] gnttab: defer allocation of status frame tracking
 array
Message-ID: <4450085e-be97-a1ba-dbd8-c72468406fd5@citrix.com>
Date: Wed, 5 May 2021 11:49:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <74048f89-fee7-06c2-ffd5-6e5a14bdf440@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0141.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 159c06d6-f7c7-4300-c869-08d90fb37331
X-MS-TrafficTypeDiagnostic: BYAPR03MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB43604E5E0D295FC06558EE5FBA599@BYAPR03MB4360.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bsQHEp1BZ4WSuPE5TQwZGSvEDHSys6nrvn0LE4j0QJRAXxB+gS/SBKkq1uOzT87f1FJ0GKHTAqdiScQsZ82s/qWio+tfGk9lS/EUPm/1zp5/54ACRV62gvZZI1VF/u/DNGP3yRf/UodFK5VNzDDH4X0mP3lneDQL1Pwf3tdq46IjoboGwn7uxglhDgdf0vItkhi9SIiz9KPPXIBbybElJUNAdHP4KAN5OaqlAKkWNKY9CzuPlX+eUvVAj/jMit+Y4rWH11EyAyHBdc/g+r9vfWk3x8Ni4ryXcvRoBT7RHjl0PLT8YiSgM8sj9ZNM68PEB+RrE/A/v6UvRMT3WJq58V4RJkqsYDg4iTHn0pa8RRV/4RgJ2729K7z94bchBmshhkv59jSGnQ/RTmBXtWIP2wnDERPXAbdTH+ylbr/wAUBOBxXtsu/A7BU+JYB5lg7Cko4XRONIzPOYHAP8/LBre6j8/JjFKmNqjn/m691TmxwZ0oNM4Yfad0bp+/NOXawcHxLa47bcThAbLV4qtICXTWUiT0WfDfDVf4M92tMj7cX6jB0eB53eauaHkEyhPWUEv5LzdAx6pDDdoOl6pp/OSIh4qPnItM2Z22FWFpOxDQKE8rrPzB0BD5pupzi559a5LaL1CLRABe/kZRR16/+PL+xdSXhZ1xfCoHrgasgxDPFWUwKHkvmZYHoxQl/jAIm5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(66946007)(8676002)(186003)(16526019)(31696002)(66476007)(31686004)(2906002)(66556008)(38100700002)(2616005)(86362001)(36756003)(6666004)(4326008)(6486002)(956004)(5660300002)(53546011)(316002)(16576012)(54906003)(26005)(478600001)(83380400001)(8936002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qy9RYlpXQWdqK1JQd1Q5bDJKQ2hTV2lpYm1zSEtkWmZ6bVo5cHpiUE1nSk9L?=
 =?utf-8?B?Z05WczlUTzJHWmpFUHo4WFJBTzVkajdMQ05IOG5tVnlJUEVTc29XQjhMWWpj?=
 =?utf-8?B?QklkUkt6UHpJMHFpdlNmUGF6dXQ2K1FQYkFXNHF0ZWxwb2hONkpaU1JwOEcv?=
 =?utf-8?B?TExBaitnQUhTTWFMYzg5S0Z1cXdUR2swaDUzTGQ4c2xsYWxvZzBadFBqYVVy?=
 =?utf-8?B?NTJ6cjBDZ1RmOUhXRURUYlJTa0M2MHhHaTFPSmVob1JNd1dQZDduRGZSaUpq?=
 =?utf-8?B?YVIvbGdzUytycml4RThrMkQxaFNId3ZsM2hMdFFJSXZJUWIwS1RPWklrK2lQ?=
 =?utf-8?B?SnpOU3dDSDYzcGc2UkQzcnl4TW5SRkZkZUdFbVpTdEJDT3Q2cXMyWnIzQjc4?=
 =?utf-8?B?a3RpSVZUTWpoaDdkdDdTWm1UMS9oU1puQWNCUzMyYWw3WE5EUWZMNGM5UTAr?=
 =?utf-8?B?L251bFlkdEdLTkdlUVN2My9iNHpsb0E2cDBKa29nQnNvN2lnSkJHUUh2MTQ2?=
 =?utf-8?B?TGxsYm1qSnpmZDZGZi9nYTluN1MwZW1GNTlzLzJlMTF2MXp6RXltbFdZKzZn?=
 =?utf-8?B?aHVDTXZwS2NkTnNVS0xNN2lTUS9SRXFCS0t5RTFGUTNpbTY2NjFpNjBxMlFa?=
 =?utf-8?B?R1dxK2dLUVMrYVF5SEV3OE0vcVBpUU1WVUJralFHcHhKSld2NzJLWmFlZ1Ro?=
 =?utf-8?B?cXNKdW1rbVB1dmNJWGNNRFhBbHczV2FMdTRjc1dsN2dLNU5Zd05ZK0cwVTgx?=
 =?utf-8?B?MkFRZGpiLzFSTExBZWxlMWZwc09ab3diZTNDRS96eWkzcjNvU0hocE1pQkdB?=
 =?utf-8?B?OU1Td0pTMmdVMGNRdTJzUm9SejRsNlZMZDlwbHozU3gvZUlvb0VCZlZrVHhk?=
 =?utf-8?B?SVNlU0lSTzljK1pjNkx6WFpKMXZSQkxXYlNFWDhOcDlKTGFBajFZTXMrUlRz?=
 =?utf-8?B?WlJDSHNCNVBCMURiV09zOXRnbEZTUEl5WXRaMnVBTHJSYmk1WURNRFhCSWl5?=
 =?utf-8?B?NnlBblFsS3VQaHNENDM2WjFkNzA4cU5lc1VqNmJKSkoxMEU0OU9XZzJGMTFT?=
 =?utf-8?B?cW9HaUxzVk43U3JjamNMVG9KdGhWSmFyNHVBSkpPWjhnZFpIalMwbGxQeGgr?=
 =?utf-8?B?VVNjMXlqN3RXMFdrYWpXdnIxUTlzN3Jsd0JseE9vbzJ0Y0Y2ZEpQK1daQUFz?=
 =?utf-8?B?SC9FNzROWjVpckpVdjFnS0ZrdncvVjlrZkkwTmZaa0RZQjZSWm05RnZPU0hq?=
 =?utf-8?B?U1dza2JSSWFJVDViT3JuZmVyZmxkUjZWYTV1ZGFXUW9DOUZyMThDbWRpNFl6?=
 =?utf-8?B?S2lzZlphcGM3bkFQWDVBTERqS2pBQm1uSFRabmdsVEVNNXlxcHlFQ2p4VGtS?=
 =?utf-8?B?SmNGeHc3WW41aGlpdWZGTU5vZVVyYjI5MGhDSWhDakxaMG9mZjRwRVpkdXU2?=
 =?utf-8?B?ZFFFZ004WDRHSGZEd3pzZDVQTWs4aWgvcjlpaE0wUkROajZVRGlWYkFkUW1N?=
 =?utf-8?B?ODV0MGRNSTNqTlZhSXAwdEFhcDlnY2IwMWRyVUw2K2g2aE9BZkJYTElEaHBi?=
 =?utf-8?B?aW5SdjUzYms2WkJPY3owY3ltZWJ5aEZ4TlRsRWlJMTB1M0dENjYvMUk3dXhv?=
 =?utf-8?B?aHZmUlVLYkVhRkh4Sm9yRHNCamZZUGxITTl6RXh6cituV3phSVdMaVcxZmEr?=
 =?utf-8?B?d3F1K2w1WERvajYvOEFHUHFXV3VSVndEOXJXdkQ4UytpZU01SDhKUlFBN1lT?=
 =?utf-8?Q?1yjznkP5TT2MALvmkIpixrS6Krk0TV8/vFraP5s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 159c06d6-f7c7-4300-c869-08d90fb37331
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 10:49:25.7709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOql2WliqxDLE2hzv3Um8M9z4ZP4Dm4gOguJZSMpX2v/oyynQdTrnfRH6jodY6z9V12q6b4YNqDq81ASrP70LpLBa8nu/ajAyb1J4Rig3W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4360
X-OriginatorOrg: citrix.com

On 04/05/2021 09:42, Jan Beulich wrote:
> This array can be large when many grant frames are permitted; avoid
> allocating it when it's not going to be used anyway, by doing this only
> in gnttab_populate_status_frames(). While the delaying of the respective
> memory allocation adds possible reasons for failure of the respective
> enclosing operations, there are other memory allocations there already,
> so callers can't expect these operations to always succeed anyway.
>
> As to the re-ordering at the end of gnttab_unpopulate_status_frames(),
> this is merely to represent intended order of actions (shrink array
> bound, then free higher array entries). If there were racing accesses,
> suitable barriers would need adding in addition.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Nack.

The argument you make says that the grant status frames is "large
enough" to care about not allocating.=C2=A0 (I frankly disagree, but that
isn't relevant to my to my nack).

The change in logic here moves a failure in DOMCTL_createdomain, to
GNTTABOP_setversion.=C2=A0 We know, from the last minute screwups in XSA-22=
6,
that there are versions of Windows and Linux in the field, used by
customers, which will BUG()/BSOD when GNTTABOP_setversion doesn't succeed.

You're literally adding even more complexity to the grant table, to also
increase the chance of regressing VMs in the wild.=C2=A0 This is not ok.

The only form of this patch which is in any way acceptable, is to avoid
the allocation when you know *in DOMCTL_createdomain* that it will never
be needed by the VM.=C2=A0 So far, that is from Kconfig and/or the command
line options.

~Andrew


