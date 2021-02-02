Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D730BD80
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 12:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80513.147310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6uHi-0005a1-Ed; Tue, 02 Feb 2021 11:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80513.147310; Tue, 02 Feb 2021 11:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6uHi-0005Zc-BW; Tue, 02 Feb 2021 11:55:54 +0000
Received: by outflank-mailman (input) for mailman id 80513;
 Tue, 02 Feb 2021 11:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKoN=HE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6uHg-0005ZX-EO
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 11:55:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20413ec0-c83d-4546-9aab-8e6f40e3c6c0;
 Tue, 02 Feb 2021 11:55:51 +0000 (UTC)
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
X-Inumbo-ID: 20413ec0-c83d-4546-9aab-8e6f40e3c6c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612266951;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eYnZcQ6pmNweY6iauGn946d+ZuiIupbjWLAvjA6Ju5U=;
  b=QBNu8X7b1zqDNFDcsW2wpQ66/wvnMbkL+2KI13DLp7n/Ov5+0TrImAZz
   X4mkZ4F/GY3hiqL7H90F5crbv+OerS3dMDBeyIwsk78MVhO9zWKXrFdqf
   vGspED2LkIbmdHKh3d1pwYyEytB9mJ1Q2KQLM9jqj3qUpNNZ2txTzyvkc
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dqJePxJfYUpHBHVG7lu5SAgIat4XdakfuX5F0hk7W6R/zpTOrNa7SUp4Ub8OXG1FBKLCdx9LEg
 10OIzzZcZvJ/bBaLD+pYsYlPrxZk3OvqwBNyHs3J0OU5V3eiNuNzgXlKU/BotPv+YSvZuwYSG6
 oLKYjxDIaeRlcrZB+0t/0+SxrKHEeLVeR/fMYt9qNSaZlBUDaVfSSud274oFVjFvsCHpxOXCKC
 84Ib70W9savSh0DgYQQExKU6nvJYjBobtkVnk1obxmNOn7O9Jh7ghoQLLXt6hTDhet+C/NFPr0
 +3U=
X-SBRS: 5.2
X-MesageID: 36736465
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,394,1602561600"; 
   d="scan'208";a="36736465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSAbLa4/+x0ErPZLXZDDR4J4h/Xyn+J2sE1yPiFY2e21cv7M0bAq3EKMRWSf7jWvcfFaAjrzWnvRE2zXuCnzDcHPIAtcbRaggdYkGYY5T4wC8NeV52Wk/k7mUINDwnkwUxJfBSUp6hmMJmulnQVpio9KQLDPvwOMk9l6KePitaDfsC8E1Wuv2hCGXe1thPOurOwsj0bkZ3tb/5z2FFB+G1WY5nnOAFOPmePel1CMW2LT2DP10cymH1NKqhIuTelvWv5oxrbpiXi/Ij7KQMlGQwG6vYsOMGzDyTMDAkj1K+ocNzwTHG0NLq6Gb47L+QE1PgXoYcegp8N7GDGVCFxo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYnZcQ6pmNweY6iauGn946d+ZuiIupbjWLAvjA6Ju5U=;
 b=AgxCb5zH+ZOoqqg4ZJpDDg2yGv4SNpTdJ8T03M10Qpv07DjI+oeQp0S7K4HoaIlSjwNLYY+HO/iBazx5Q1ZILXlSw16cGpDv6qp85qFxFYmvv/i3gMRhnAxBQZZ+NvdGopKWZxnj/NusRRCHfUNUIngXRy23oxMLJEwGKvFYY8MwEjSRkh5iUKnjIU9p5vKab7JBPHODtc6LIto2DLMGOlhoJbc7KxL6T3DdKS4r6qlMXnWztxWw/h4JE/HfmckJ3vcQ02pGGnhgCk5HwUhiTKH7ofo6e7Rot7ld+UKvWPtun+j2omUCmaIcyltrssf7otWpkIJOT5TbhDtfgpvYDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYnZcQ6pmNweY6iauGn946d+ZuiIupbjWLAvjA6Ju5U=;
 b=c1bqGN/nMgi5RB4ObZ3geVgaXzQw3L83vzA52OIxwQN328kH7Xh/imNNEuvCAXCIKsD8sj6BAoaJ7Ju8QUKyz5u+gmdHTErUHDDcHPpQZL1BjaSSyrMRDOiR6nRrnP89UYa/6QAPNfoSAHTPKHXlgCiBsHZ/R3RSLLNF7YZD5T0=
Subject: Re: staging: unable to restore HVM with Viridian param set
To: Ian Jackson <iwj@xenproject.org>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
CC: <paul@xen.org>, 'Tamas K Lengyel' <tamas.k.lengyel@gmail.com>, 'Xen-devel'
	<xen-devel@lists.xenproject.org>, 'Wei Liu' <wl@xen.org>, 'Anthony PERARD'
	<anthony.perard@citrix.com>
References: <CABfawhkxEKOha7RYpSvTaJEtxyBsio9Pcc=xtRD7DszHm2k2pw@mail.gmail.com>
 <12e17af4-3502-0047-36e2-3c1262602747@citrix.com>
 <7ea14fac-7832-fe68-529e-03a8f9812f88@citrix.com>
 <035301d6f93e$4d03c6b0$e70b5410$@xen.org>
 <e8e7d041-3196-9387-df84-16176459d0ff@citrix.com>
 <24601.15574.213980.576056@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c3383689-0a6e-add6-6275-236e89d2775e@citrix.com>
Date: Tue, 2 Feb 2021 11:55:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24601.15574.213980.576056@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::24) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 446bdbfe-c528-4f1d-18fd-08d8c7717873
X-MS-TrafficTypeDiagnostic: BYAPR03MB4055:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4055CAE71DAA87FFB8A9CCB4BAB59@BYAPR03MB4055.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izH6qCDG1GTFFk4/UONzjuahYgoJkjSy8g0eJ0fXfJ8lVvIEEVofInmeuFrfXAix5Tu4VtWrNO4FlBDaD/0jMUUi/KIjuOi+4yvkE0jEWH+m4P6H9cxQYRbgZ+xI+Iqc29PA4u+MkiVoezq6ElLVKJ+MRgmiATDQc2VELlxHOxiYjX47RBP+M8t3nhtG12pCeXdIm9WrWxZPPW5aSDSO2SWaMf78Cuvd5JtZ9c7IA7GIusFpIKjc3Jz/7jAZGRG2gP/bR+v6ssVKMh/MP8vJnz+5lU0XAfcprUYworEu6HvlnnnHcnrdU5B1fMaQ3Q9Y7EAtdkmH6Y17Qph1Jka+2+MRMAE9wjm1W7SG3HNcbeVUt1WLgDiepRzEMWzjh3ceRHEEZllg5jCMjxqnRLr40j+lzA1BH8IXOYTgj6ZVF4zBerQ9ffHS92KZLdH9pSVkvn/cZZDs2conLuaClpT+aP6TE9Uhov0+o4ETBb75Y7GQpjPKLKZpJSo9kj+PAGRcfRWbzF99N5iatzyvjqIB/ZNts8HUIM7v+jmOTPUPaJvWOfaN7JSD3Z2hgK5dy0fexcQ/tIlsaKVDU+H6ZlWMlo4jneD96z1LRkzbXnpoGmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39840400004)(6486002)(66476007)(83380400001)(2906002)(66946007)(26005)(36756003)(16526019)(2616005)(4326008)(31686004)(4744005)(8936002)(107886003)(66556008)(5660300002)(956004)(8676002)(86362001)(16576012)(54906003)(6666004)(478600001)(31696002)(316002)(186003)(6636002)(53546011)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MTFNYTVQL2JLQXN5YXYrNjJndCs0d2taT3ZtNDRBN0hraitEdE9rNmFYQlVQ?=
 =?utf-8?B?MHZUMjIzR3IyM1gwUFpnYk5VZDRLcnhxWUxGR2dvZFdoYkROSWpJWXcwWnY4?=
 =?utf-8?B?Z3FTblI5VDROVVY3UmROdE1YaFdJaWRDYkdWK1Z0YysrTkJGL2Uvc1d1RGRp?=
 =?utf-8?B?VTN2VXo0K0dZNjY4U0RvczlkRkdoOXBPclIwQnlPYXV6RHJGaENiYU1EVFFV?=
 =?utf-8?B?NHFDcFhDQVVoQkN3QWIzU0pDcitqRnQwN1JnSGViSEh2UmJvekNDS2NEOEc4?=
 =?utf-8?B?UndWSDMralpCZEJNK0NodVh4MEVkZ2ZwOCt1c3A5dFV6WEY1MWJNTkVmMGhV?=
 =?utf-8?B?VUJzZkRjdE1MbkJpQkU2Q0hteFc1TVVOaExIMWhwTytoQlY0aW84U09tZTVK?=
 =?utf-8?B?WlJlaGdsRnFmNUJVVTRrNmo1NDZRUWJHc28rSDFDVWNqclNVVmZpdEpESGhC?=
 =?utf-8?B?SkZLY2RFZFh2RFhIOE1SVExYYmdkalB5VG95NjQ2enZBVEdIcDd1cndIUEdF?=
 =?utf-8?B?bWxUTGdpT2ROQU5laEJodUVYWnNaWVE5NTNYWDRFNVl4YUcrdDFVYjFvRVla?=
 =?utf-8?B?eFJhaTduWnNzWnRnNzRtVVlMUkgzNUJ5SU5ZdGFoTm9oNDNtbmV3dklMalFW?=
 =?utf-8?B?T09hbjFMQjlpTHBYYy9wR3ZMRTRQeGtDdCtKUmozUmVNN0NoVUVyQTNCaTBl?=
 =?utf-8?B?OCtVc2Y2TzcwS1Z5YTBQYStXWVd4a2lxcXoyYTFCR2QrNGR1eXhTak5ML0hi?=
 =?utf-8?B?Qm5kSVM1bWpLNDFyeWF4YzBIY3lFb0ptL2U4TE0wQW9NMHlWTCtNRERSVlQ2?=
 =?utf-8?B?V25nQVdHNGNmMVcyUCtDZ01ZL0F2RElWTCtKS3hDbFREKzNuV2xiMXFnTWVO?=
 =?utf-8?B?ditKZGI5RHNDcVRvWjBTaGw0czVXUXRvWGIva0tRRzZxOXI2RExXZUhOQTBJ?=
 =?utf-8?B?dEhabzZlYjE5SnhmN2JHSFBOem54ZWF5WnZFV3JvendSbncwRFRMNUZuSDRD?=
 =?utf-8?B?aW5YZ1dYcmtxVlZHZUNDU1RpQ2oyNTNHd0VtUkpxZy8xRDhzcnIrS1RSRG1x?=
 =?utf-8?B?TWJiQVo0M3l2bjZkNmhOazljMlFCSzI0bFd6WUpTdFVNZ3AvZ2x5dlN0YzBK?=
 =?utf-8?B?dHpPWTN5cU93YTluQzlWSmNvemt2aEJHSTRwVkdYM0RMMG9rWFpJU1FGdDE5?=
 =?utf-8?B?VVhsc0JJdUNORWZyMTh5Y2JpRjdBK2V2Nis0WVpUT0w5blUrWEhlSHg5bFlI?=
 =?utf-8?B?dEtwVytSUFdiNjNDNjNQODAycklpWmsrc1A2Zk94N29PcHVxTFVBZ2NPU0h5?=
 =?utf-8?B?bTJjOTJ1TWtGZDBZcmNOU0pkZm96S2xQdFdsNjY5bHkxRStHUVA0b1g5dEpT?=
 =?utf-8?B?dXpnV09yUmM5YlkxaHNRdVp5akNCUEVvTXExTmFNZ1hOQi9CdGZKRkUxQVI3?=
 =?utf-8?B?MjJPa1FFbVhjcjFMTU50RnZNT1JESzhNdmNpaUlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 446bdbfe-c528-4f1d-18fd-08d8c7717873
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 11:55:44.1384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIoXRRA6RdoG7vNwl5hZD1MuYVKAcOXEp+MUlRt2sRPYUOQFOOZS6wwk2SbcG8KYuRlOrHq/76JNWpbyb2vTQ7RmYT0/iIgX9JDSKrilLBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4055
X-OriginatorOrg: citrix.com

On 02/02/2021 11:51, Ian Jackson wrote:
> Igor Druzhinin writes ("Re: staging: unable to restore HVM with Viridian param set"):
>> On 02/02/2021 08:35, Paul Durrant wrote:
>>> Surely it should be addressed properly in libxl by not messing with the viridian settings on migrate-in/resume, as Andrew says? TBH I thought this was already the case. There should be no problem with adding to the default set as this is just an xl/libxl concept; the param flags in Xen are always define the *exact* set of enabled enlightenments.
>> If maintainers agree with this approach I can make a patch.
> If Andy is in favour of this approach then certainly it is fine by me.

Yeah - in the case that we're restoring from a suspend image or migrate,
just skip setting the viridian flags in build.  They are in the the
stream, and will be restored later.

~Andrew

P.S. This is going to get even more complicated when it all shifts into
CPUID settings, but it needs to happen at some point.

