Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72635F5FE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 16:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110680.211274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWgNt-0000xo-81; Wed, 14 Apr 2021 14:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110680.211274; Wed, 14 Apr 2021 14:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWgNt-0000xP-4d; Wed, 14 Apr 2021 14:20:49 +0000
Received: by outflank-mailman (input) for mailman id 110680;
 Wed, 14 Apr 2021 14:20:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5rk=JL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWgNs-0000xK-6Z
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 14:20:48 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 662ee1a8-bb6d-4206-b433-ca25d34534db;
 Wed, 14 Apr 2021 14:20:46 +0000 (UTC)
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
X-Inumbo-ID: 662ee1a8-bb6d-4206-b433-ca25d34534db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618410046;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Bx8U9WCiCnp9KDHdKZ0/eZBBRcyxQ9CkasFIEwNdHL4=;
  b=THoW3t5gMXQ1A69iZKAiWzuNpS2e9mSCheWCeSrf1iQjvI3MyiQR01ve
   rHlzH2kQFblw//kRXXGdWPue08Wsg1El8utpalfUUJBN3BMk6y2MPsDAV
   zhjQx4sVs5XcjVuEaFK5h5FpWpGccvoJQK73c0A9+41tJmWpKDCFpqDyc
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aPhYVJrgD5peP8GxCxz5I6envNkuzYStdaCPAZOhKn3nl8MRnMmX57ZPZbbQStPES6V2YnJKYp
 83dnJPJv7CAIuilzydO/GNKmKeDa+Sm9Ylc+gQaM1vjlwTtNtfJWXM5R9h0Dxn1+W0vtjGl7Ve
 /qV4D/dUOb4yAg5EZu9ZC1oGpzPHgJjUhjgaPlNxi/rIUt0UacmlKFJr7Op6cQnvhaBr8ejQOC
 sVkaePrNIKqgXy7IpvGxAlOMoIGcYTtwxt/Q3l3KXZJTGB9E7TVv1sp2d90IGCUkjSBALeijMW
 NIU=
X-SBRS: 5.2
X-MesageID: 41710973
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YEnOqKB3ixWHlyzlHegItMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmBEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVsUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbiSw9BEYTj9J3PMe4X
 HI+jaJnZmLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESPti+Gf4JkMofy2QwdgObq01oylc
 mJnhFIBbUO11r0XkWY5STgwBPh1jFG0Q6T9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvknfy/opyjz68PFUBtnjCOP0AIfuNUekmBFVs8mYKJRxLZvjX99KosKHy7x9ekcYY
 9TJfzbjcwmFW+yXjTyu2lix8GURXIjHhuKaVhqgL3q7xFm2F9+1EcW38oZgzMp8488UYBN46
 D+Pr1vj6wmdL5YUYtNQMItBfKtDGbAWwjBPQupUCLaPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwEzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 WOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbbuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8hxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hvp6fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YDVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsXun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDPFbCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob6575WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRt+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8UUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8JxO4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qCkWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+TDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 yi2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregfzmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDEo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/+sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6n4Noh95+jFollnkx4ig7iP6JCh9QHLkq6QTeyJSPHiOhd
 nC6s6C2h3GkWB45aU=
X-IronPort-AV: E=Sophos;i="5.82,222,1613451600"; 
   d="scan'208";a="41710973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSAbnduxe27QuVjYqTgHHtgXF0BTX0qjOoOoCRmyjHL7xsr+dRUeeIeulimv0Hqi5tLhs1ME1dc3X2sanUIGUVhqapmsQIZtrskygQq7It7xKrNwL9psDmCTRVnybrs3iQaK+bz0SozAg4357DongIwwZDE33I14hpm7t59bcoTUexuPOBlmBcoF/7laafC0sQzoEgbN57teiCl7eod323VJzVPwPFue5QG4/MFoE0G+7oI5ZxLkNmVFbqNgyUMXYfolS+46fk67QCnQIeSOhdJVLgPtq1HqrIUhSpONg71z5gPHAZsPAkKL2al8tQuQfe15+MlYCoJRI+bNCC/ZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv1DOxcKF9hGqxw18+zrAvM7H4IHqfWlC541wRvyglw=;
 b=lvx1ENjX8XvDD0Fxxy4y+/ntostu2TnVW3y43GOKS8TR08HtQaH7Y6F2CYfHdxZk+deDoxy3exwPbltorLyu0YWxupoJe6WPGm2tDvpFlxlHNzFV+qK9MeoV52pyFEEbfkeU6dfyw6khklM+MhYifZn3IwKBG2u8Ee/WghIL951GmgzAEPzLEPwymjTWz+J82s4cazYJUXs7iTI5ohWFrRCMhb92VmsIEwR/MZ4lxH9/ZxhTk0ak22ruvK2n2t0o9rWevUgW1AxxDkpemy/l4U13HGyzmAhTizwDNfXf8+wB1IupVv6YI9oJfy/wwIu0GVgP4Us5NKTo6EDHm7acIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv1DOxcKF9hGqxw18+zrAvM7H4IHqfWlC541wRvyglw=;
 b=o9C5FQbnXJD0sQynBIi9/2/CKQlZDUce0SiUxCeAhBkmyR9Gaf5v5s7TFxNWtFbCchKXPB4+flKz4t09gtoBNjGbITr1ajbtJfqrWRgBavcnFzfqsKn1rZUghJDJNcAb/KI8fUYlzgybltLNJ9vEsMMgPyYDCuxN4KNSfA3v0VA=
Date: Wed, 14 Apr 2021 16:20:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 09/11] x86/vpt: switch interrupt injection model
Message-ID: <YHb6NvqwSjFzrCrt@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-10-roger.pau@citrix.com>
 <3cb01098-887b-c952-1f93-e89c443ba471@suse.com>
 <YHbwII1L1O7AjJhl@Air-de-Roger>
 <4c65efcf-28fa-147d-8c82-7498cad19aeb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c65efcf-28fa-147d-8c82-7498cad19aeb@suse.com>
X-ClientProxiedBy: AM6P194CA0066.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::43) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48fc6a9d-c296-4a06-8d38-08d8ff507d71
X-MS-TrafficTypeDiagnostic: DM5PR03MB3372:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3372E8D2FFE441C48BE3E7F78F4E9@DM5PR03MB3372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJPHDOWUZJVO2icg7TwLzK87CXZ+R6XXatwhNcrFz1i31GGzKxt28sHN2tGNu7eURrVHQra+lILx5xA0h3Fyz+wIzOd18gqXrDdJbYkjpmcgy57pjTiS/DlORKgDx5l7wCyZb4LwX8nylXWYw+t/gMyGkbEP9U4KTGkntyklMPFR+r6mw7X+dNbjiWWUzKUBYbnW4NeLdSBxCyknmNXhh9GiGVFc9bnXToNQJZgA9v3Nt6QQKcdSl+Ytz88JmUfVjTtcesu+8pEOcwypgXcF+eUS6qNyTjX4b7HKGT1wofarj7CVf0uOz4Rsl37o6yjVQtWNWBmeMnRsEhB+EWWKCTIziPuDHKfTS+lkCHSNDXobETyzrhQeJhsU8OQ7e100Z2QJaNL3Vfx+6Ha5BTaNDWeJT3Pk1+ECw0f9B/KFt1mIbDNtqqnCQMdmQt8tmIYpIPzjOImORxBJoGQKEj9mRz657EsT7ahxBUn3FBifEC84pbfuqKEU2U9suHpJyZpPMJjhg8a84epd4R/xNV2SBjGTJGFUUL9rfqkF6TkKDRvhfR16Ca5lcHDhoGaBhP3VTRV2dK2zPZl+3+vdDDnJh+zX48J0V4+FpOsXmzby/58=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(33716001)(53546011)(16526019)(38100700002)(26005)(85182001)(9686003)(66946007)(66556008)(66476007)(186003)(956004)(316002)(8936002)(4326008)(6916009)(5660300002)(54906003)(6496006)(86362001)(6666004)(2906002)(8676002)(6486002)(83380400001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RTlvdlJkUTQzTDVseDZXREl3TXRGdUNCeGNYNXhNdVNCcnc4cTNLeWUwbERp?=
 =?utf-8?B?T1ZUd1E1K0c1TFg5N1FYVzkrSFVNOEt6R1g4RGI2ai9KcjNjZ2lFTU1WM3dD?=
 =?utf-8?B?dWhhQ1BlSzg1dGtnY0Z5RXhBWFpMdXB3K0l6N0RxM3d5Y09EVGNlb1J0bEJw?=
 =?utf-8?B?TWFoQWdaQk5NRHB3ZjFMRW1HOXZVc01PbUZlVXJIcExMN1MycU1EeUJkQ0FP?=
 =?utf-8?B?WVU1cU5vWHQ3bDZsdWU0WStoQS9XZ0RIbFRuM3ZBVG93UUhnb0JIanpMZHd5?=
 =?utf-8?B?b09JMm1URithdU80bERNSGNyTk1OYkkwQjVjUXEvVVl0ZGhxZW1UZ25VMnN2?=
 =?utf-8?B?V1FLMVhPQkcxdkQvOEdXODJ5T2hKSVJWUS9KL2pTL2VyVGF5V1U1Y01HYmpX?=
 =?utf-8?B?ZFJPVEJES0IyZ2d1MS92MnRSS0MvcjliN0h4YjhEL3hkMUdQaFNpRkluVFlB?=
 =?utf-8?B?MEozbmVOalRNTzNQbEp0QkZtWXRaTFlTWDVRcjEvTGprN3JEaDNZOXhhcWVJ?=
 =?utf-8?B?NjlRUlMvYlZseXBEZ25uSk1iT3Blc2VqQ2s4aGNCL0NhQ2pVaGNRS1NTbUtG?=
 =?utf-8?B?UVNGKzJuS2JaZS9Sa04rUGZkK2JKM0JzT2ovMDBDSHNjMkMvQm1yUFUyV2ZE?=
 =?utf-8?B?WW1KTHF6c0Jhem9QWEdrVjEvQkI0Nm5FYktKV0oyZ0NYUmZTbjQ0elJqbDEx?=
 =?utf-8?B?bmZzc0RqbTJBVmVaa0lIcEYvZjlGMnc0VzQzTVo4ZjRRWWdtUWZ4NUdJdm41?=
 =?utf-8?B?dnhhelVwSFYzSU14S1Nab1pTa0tMN2V0VnBGQk95VkNaMmR2cXUvUlBzak02?=
 =?utf-8?B?RlUveUtvZkZoWjZnc2FrNlRvTlpaNVM1VWxCVW0xQng0dHFMRmRmYTg4aE9D?=
 =?utf-8?B?VG5ENHFMdTlhMytSbE83NzZvMUoyUnlVS0M4VWZESi8wWXVBdHJuQ1FLNXow?=
 =?utf-8?B?cFlWZGdtM0Nnd0F2V3VoRzVrOFBVVDE1aE9yVVJLalFFbGd1aGlRTEIzZzBG?=
 =?utf-8?B?Y1d5WTQrNVBXb1ZHMk1UK0t5WkpxR0p4TmJ2KzV5ZVdNeXFDTWZNQ0RhUGJJ?=
 =?utf-8?B?aGxQU29wdWwrWi9YR0VSRGdINXd3WmlRQ1NuYkFzaGtjRXVhOG9rZ3ROcm56?=
 =?utf-8?B?UXJ5REdCQzZnZmYyNWdpcVdYaUJpWloxTEVoVjh2aS9sTjY0N3J1RGtUdGdY?=
 =?utf-8?B?ZW43Tk8yVjZTQjZFc2tPR0V5Q3lMa0tmQjVXTWE4K3BUaGU4TytpOFRkN3pB?=
 =?utf-8?B?eHdxTjRqQ2ZleUt3QklrRXBrdFA1cWNHKzFIbkFjR1o3cHRpaXpOWkhyY0R6?=
 =?utf-8?B?MEdNVkd6L0VqblU3Z002cWt5OUpleGducnpmMGRXa3ZMZEpGQW9QYm92VktR?=
 =?utf-8?B?bHBTcFlWbHNXSjlEelFGdm9uaXhxMncvMXMrbnpQcVMvc0hWeVpSTkZnbVd1?=
 =?utf-8?B?TnJqVTdDUFpCaGJLOVVJTVZ6eEFna3J3bTRYdnJmMzhOSHBMYzhRL2lNTEt3?=
 =?utf-8?B?dHZHY2dkdklKMUlWQ0xsM2NlQUhGWDB5ZXZHd3BvS0ZycnFGeHpza3VOWDc3?=
 =?utf-8?B?ZUl2b0M0emRXLy85UzZxL3VUK2ZnbFl0amhXTGw3a0xaUjVxQ3VDeTl3dUlF?=
 =?utf-8?B?YTV4MVJ6QjFEQ3EvUjEyQWVuRU5Pdm5velJWVTVpcGVETzdXY0ZTbmtCM0R2?=
 =?utf-8?B?cldqaUw2a2lpREJUd1dpM0RWenhOQ3VoWjBDOCtaQnlwUEdjdmlNeFZOWjEy?=
 =?utf-8?Q?HfwVot9peLfyxEtgVYi/gtSBiP3glUq2pfzLi4j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fc6a9d-c296-4a06-8d38-08d8ff507d71
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 14:20:44.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jUu7RKKxrK6QEPuM4D6YN1fC4qDB3AE23M31Sr1ecZxOqey55fEIQeKjbTZoQWuRV9BljNRi53X59nIyR1o9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3372
X-OriginatorOrg: citrix.com

On Wed, Apr 14, 2021 at 04:05:20PM +0200, Jan Beulich wrote:
> On 14.04.2021 15:37, Roger Pau Monné wrote:
> > On Wed, Apr 14, 2021 at 12:28:43PM +0200, Jan Beulich wrote:
> >> On 31.03.2021 12:33, Roger Pau Monne wrote:
> >>> ---
> >>>  xen/arch/x86/hvm/svm/intr.c   |   3 -
> >>>  xen/arch/x86/hvm/vmx/intr.c   |  59 ------
> >>>  xen/arch/x86/hvm/vpt.c        | 334 ++++++++++++++--------------------
> >>>  xen/include/asm-x86/hvm/vpt.h |   5 +-
> >>>  4 files changed, 143 insertions(+), 258 deletions(-)
> >>
> >> Nice.
> >>
> >>> @@ -285,189 +238,144 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
> >>>              list_del(&pt->list);
> >>>          pt->on_list = false;
> >>>          pt->pending_intr_nr = 0;
> >>> +
> >>> +        return;
> >>>      }
> >>> -    else if ( mode_is(v->domain, one_missed_tick_pending) ||
> >>> -              mode_is(v->domain, no_missed_ticks_pending) )
> >>> +
> >>> +    if ( mode_is(v->domain, one_missed_tick_pending) ||
> >>> +         mode_is(v->domain, no_missed_ticks_pending) )
> >>>      {
> >>> -        pt->last_plt_gtime = hvm_get_guest_time(v);
> >>>          pt_process_missed_ticks(pt);
> >>>          pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
> >>> +    }
> >>> +    else if ( !pt->pending_intr_nr )
> >>> +        pt_process_missed_ticks(pt);
> >>
> >> Did you lose a -- here? I.e. does the condition mean to match ...
> >>
> >>> +    if ( !pt->pending_intr_nr )
> >>>          set_timer(&pt->timer, pt->scheduled);
> >>> +}
> >>> +
> >>> +static void pt_timer_fn(void *data)
> >>> +{
> >>> +    struct periodic_time *pt = data;
> >>> +    struct vcpu *v;
> >>> +    time_cb *cb = NULL;
> >>> +    void *cb_priv;
> >>> +    unsigned int irq;
> >>> +
> >>> +    pt_lock(pt);
> >>> +
> >>> +    v = pt->vcpu;
> >>> +    irq = pt->irq;
> >>> +
> >>> +    if ( inject_interrupt(pt) )
> >>> +    {
> >>> +        pt->scheduled += pt->period;
> >>> +        pt->do_not_freeze = 0;
> >>> +        cb = pt->cb;
> >>> +        cb_priv = pt->priv;
> >>>      }
> >>>      else
> >>>      {
> >>> -        pt->last_plt_gtime += pt->period;
> >>> -        if ( --pt->pending_intr_nr == 0 )
> >>
> >> ... this original code? Otherwise I can't see why the condition
> >> guards a pt_process_missed_ticks() invocation.
> > 
> > I think the logic here changed enough to not match anymore. Certainly
> > pending_intr_nr shouldn't be decreased there, as pt_irq_fired is
> > invoked after an EOI in this patch, instead of being invoked when a
> > vpt related interrupt was injected. I think I should better rename
> > pt_irq_fired to pt_irq_eoi and that would make it clearer.
> 
> But pt_process_missed_ticks() should be called only when a tick was
> missed, shouldn't it?

No, I think the purpose of the function is to update the
pending_intr_nr field, ie: calculate if and how many ticks have been
missed.

It's fine for pt_process_missed_ticks to return without having changed
pending_intr_nr at all if no ticks have been missed.

> Or actually, looking at the function, I guess
> I'm confused. Does your patch change the meaning of the field?

Not really, I think pt_process_missed_ticks has always had this logic.
The pending_intr_nr filed should still have the same logic, account
for the amount of missed ticks up to the value in the scheduled field.

> > FWIW, decreasing pending_intr_nr should only be done after an
> > inject_interrupt call.
> 
> Then this line (which you leave in place)
> 
>          pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
> 
> is contradicting the (new) model.

Oh, right, that's mode specific. no_missed_ticks_pending will just
drop any interrupts that haven't been injected when they should have
been. I had the 'account missed ticks' mode in mind when I wrote that.

I now have pt_irq_fired as:

static void irq_eoi(struct periodic_time *pt)
{
    if ( pt->one_shot )
    {
        pt->pending_intr_nr = 0;
        return;
    }

    pt_process_missed_ticks(pt);
    /* 'collapse' missed ticks according to the selected mode. */
    switch ( pt->vcpu->domain->arch.hvm.params[HVM_PARAM_TIMER_MODE] )
    {
    case HVMPTM_one_missed_tick_pending:
        pt->pending_intr_nr = min(pt->pending_intr_nr, 1u);
        break;

    case HVMPTM_no_missed_ticks_pending:
        pt->pending_intr_nr = 0;
        break;
    }

    if ( !pt->pending_intr_nr )
    {
        /* Make sure timer follows vCPU. */
        migrate_timer(&pt->timer, current->processor);
        set_timer(&pt->timer, pt->scheduled);
    }
}

But I think it's best if I post it as a new version, so you can see
the context.

Thanks, Roger.

