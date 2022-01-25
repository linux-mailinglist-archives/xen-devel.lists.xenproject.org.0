Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF5249B437
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 13:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260331.449590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCLAb-00020C-2s; Tue, 25 Jan 2022 12:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260331.449590; Tue, 25 Jan 2022 12:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCLAa-0001xp-Vu; Tue, 25 Jan 2022 12:43:32 +0000
Received: by outflank-mailman (input) for mailman id 260331;
 Tue, 25 Jan 2022 12:43:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCLAZ-0001xg-99
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 12:43:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64dea317-7ddc-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 13:43:29 +0100 (CET)
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
X-Inumbo-ID: 64dea317-7ddc-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643114609;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kaLIcHlXO5zH9Vbwd534mJmp2EwOdMOkDEfpxv0IiYI=;
  b=idOinrIXFNcsNAJkZnVcvyY0/zBsxSabMGOGlCiNIAKyDuTpcs56SNjD
   JpbcuZuNZNCAtqYHjD2Ns50TN5ynLhg2fmbo/t7glNv+MhyPMQA+HpmEY
   HWYiA6CQAvDorY+1vsMbIwWPh2chEknOWb/vm4oExitGpghZOB5QFbF1u
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C/pgaRfZhxHCUyJV9Ki4DAHK9U8AbTiaRGq7Xkibn+J72cwsLY/5ZWxkbwv0mpsT1fazQMJBtw
 cFec4GONjCIBBCeG4iUc5aHvGxzP5Wpxi/E+GXMqtdjZ5c/KuNP64OQFjwjcY/YYt9gni0HHmT
 J22hJLvKVW0F6X9z+gVcTh3j/Jem5vzSe8OtIb8ssKGycO6MFarL1xF1G4XZ91AfZLZ6zt8qdV
 dd1fkHUQVJShWT1DNpXdKVfSvk6FbuMf2t592IhOZs0vgyZQZ9PA0apu9qXjIcShEV2AXRyBHf
 OzQYRkrX+vE1Fm72HiKQKiT4
X-SBRS: 5.2
X-MesageID: 62175636
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q2/5m6vvxnDlpO9XHnyglh34DOfnVLBZMUV32f8akzHdYApBsoF/q
 tZmKTjTPP/cMTTxc48iPY6//EtTu5aHyoNnG1dvryk8EXsR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24XhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljaSBcwkwb5T3vNs4SUZ3DBFhZLxpweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JoXQquAP
 JRxhTxHPBHqQCd2EUwsEZMfntmOvCbfTzphkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYkY+tqHfRr0Tqp9Y/OvCmGNnddXxF4PYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPd1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGomeBY2bZhVKGeBj
 KrvVeV5vsM70JyCNvcfXm5MI55ykfiI+SrNCJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQladCdgXcGv9ZU/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOmHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:er9r/qPuspopO8BcT1v155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62175636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsL3zbHjTj9icTmlHNaodeDKfr8K37WsR8K1o5a8eLo3buVzd7X+2lcbH8QRZwwKLMNpwweowRAdJ95sLdSPpmsrSHR5EMWItYrGcSKWuTujVMvkQCLPOX6UcOTWw0uXnm9wXgFE2PcM/N7UDactsM5cY5NPu7xWJEEM9EwHxucLHlv3vh7noTjSUHqNp+3S1VAFAQYBccrZEVf/KlYzjCy8UoZ75v0GcjLAbJ+gEwghfrwunGx9ZDWmJ5iJ5cCb41V+lI181hcjTRo3fFrJQjZW+neP6DRckPVAPm/GD4ZW5DSqM/Vw6iGH7yLRmDdlFoddaFAXnZuA+wGhXI33dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ONJ70hCXD8kypWhi8Wak21xcfjf5HAl0rY91zoG3lc=;
 b=HB81HDCAGqyUAqTHrh/XA80jS0utGjePisi4i9XuG6sYR/ZvnXh8bIzWUzvItCJ3vpJjM/VaDt4I8whtRt9BIs+eeuRGO8kaX6ADRPw1TflUdQTRMHag0GlDlyoH0Qr7XgjMQ9MXxCTDE5vLiZpOfY4lChrH2BrE9IVpIm4VSglFGLX3ED0Q0/0rO7lvbAu+yMlbvE5sdvL4/UgEq41U6clrjoRiGcpAWjsLqIM0yfBn2KhtJKWpABpCtnJ/o1i14vkCvRawWerE8Zk1FCaEm7IvK65H/GxhMt9auSSp0uVwlRotP5n9Bq4yiGlgDa3Hu6gnX26GKWE7ydr01IQFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ONJ70hCXD8kypWhi8Wak21xcfjf5HAl0rY91zoG3lc=;
 b=e3UeXjQbIaKQpmRzMi0E7fdquIZyAjEZrcPTJ1ubfcxL2+Jxi1NU1FzegGLMdg36jE1FcxtIDP4QAzM/MIWoy5vjPKDn8Z7liL+jPSN8MAvHRvKJvvJqP+ud68XmUNv84JzotG3cToL8B3mlBnNVP/p7CW+kwN0KTu8Klf/vujc=
Date: Tue, 25 Jan 2022 13:43:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC v2 4/5] x86/mwait-idle: enable interrupts before C1
 on Xeons
Message-ID: <Ye/wZZiyAUA13Ykr@Air-de-Roger>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
 <a0b3c3f6-2abc-353b-92f9-367fa57af8ef@suse.com>
 <YemFRFaKRanqgpSW@Air-de-Roger>
 <4ccff255-630f-2805-b5eb-013aea666cf7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ccff255-630f-2805-b5eb-013aea666cf7@suse.com>
X-ClientProxiedBy: MR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c2bb184-6b9b-485b-c88f-08d9e0004685
X-MS-TrafficTypeDiagnostic: SN6PR03MB4398:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB43980A82452CEE5C9B51666C8F5F9@SN6PR03MB4398.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nhfy/WEJ0fYLSY/NR14DbCIqC1RLYsLA/8j/oMdIEekkR7FXtbJQtDYZIJjl2QBxwyErznjlg2vyquVLIz01DwO+kWa3aBRfp/7q6NQurr7c4Jx2FMvlPwwtGOyKOIbbgQRofz/k5t4iaS9a7cYxax7fmw9DiaL7/4ylRkhZzvcRzhNmOmcOiCg3MH27iWPtyDjwgDzv1LC2HFwd4KS4HUZ0538lieCk4LpIR5PPzDu0z9IpGghICL7Ds8gxYTS3Uue8UUcPluvsW0tv4as6b8JtjF5kV9ruoWfOJbmulBPAXrkb/6/gQYjUS+57W6E7s2diDiZ8AeJajHMFalPM6uclg6GvJr+8X724ay1jqyeBI+Apn5I6OqI2gQbUd6HQAVjUlRtLoSCRVyHc/cKfVmEDYSNgVu8W+xUwAXVXvgI6UPKn5FsOM37LEbJSrmGnHlCTKTkUmxCTeXI2c15wIp/wFaxZahGcYMfGh1vsFjjunpj4yqf/sOLsp6Sz9lPiuWeYcRYj8NKx2VnfnXmUXj2QesXxxk534sHhctT/cWNxTaJgCEe7Tbar2CYHmqWY6Cu8WYbiTv0PojI+m8/SD1N6veR3FeTy/nwsReVq5XJVZQNE2mqCDz4Uo6b58oc2CKZwAiz8NVviLbxP1nHCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(83380400001)(26005)(4326008)(6916009)(316002)(6506007)(5660300002)(9686003)(8936002)(8676002)(85182001)(6486002)(186003)(2906002)(33716001)(53546011)(6512007)(54906003)(66556008)(6666004)(66476007)(38100700002)(508600001)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHFrYVdkVDhKUnM0U1ZaUjNQQzMwamdweXBMT3U1NldpWUZjMDVoYUJrS0RY?=
 =?utf-8?B?c3NoQXpwSnFvNXVkSkVjVzhVZ1ppeTdKRkFWNllSUmFVV2xsVXFDM2xmVmNs?=
 =?utf-8?B?bTZQYnB6MkFzeW5EUzhmYVduazNmQzJVc1FHOVNlYUNIa2c1Y0NhS296NWtQ?=
 =?utf-8?B?ejNaendrbXdjWEdiSDU4Q0x0TmR2N0U1YUZDUzZDRDE1eUZYbTFPd2Nvd01R?=
 =?utf-8?B?L2hUbVRIbVhBaU5JbkFqM2ZMUnhlM0FWc3c0UG84aWx6N0ZoT2s4YzVJSVpn?=
 =?utf-8?B?djBDNy9LSFZNc3Y1L0ltd2RHNHF0QjlOT1pIeEREaXM3ZmkvQkFtYWdRd1Ey?=
 =?utf-8?B?RWFhSE1POVZWcXZiazNKMHdaNVo4blNuV2RyWnVrRWI4MDhYOHFQdVlvODJP?=
 =?utf-8?B?SHozc0ZTRStXcjlGQTZPQ2xUK002NThSVTR2MjV6dlVXT1I1d0djeXVUZUVJ?=
 =?utf-8?B?NTRCNW40eWFzdFY0WXpsY0hRTnNYdlQzZXlqWUdjbFMzMUNpN1MxZTl6c2VJ?=
 =?utf-8?B?allyR2grQXlGRmNCN0EyVDQ3Y1lXdkRSSmlVRFkzZ2h6cmhvR3pJS1ArcEVi?=
 =?utf-8?B?dUpOVDg4ckZGdGhZZnNDZXpDWnlBdHhDRU9FeWdvOGRJRFE2UUVsOG5nYVVH?=
 =?utf-8?B?Z0M2N0RkSHhKTE9kUXltbTFvaU9EUSticlZIMmI0NTRaeng4MmNuMWVtWW5z?=
 =?utf-8?B?ck9lazNHTE1yTFFSbGdIeS9VSGZKUkZscGpya1BxL2VpZ0Y0ek9kOWp4elFh?=
 =?utf-8?B?MlNUa3daUDVyVFFpc05rMU52cUQ5MHE2ZGdXYk9lbE1BcmIyWTZET080ZFg1?=
 =?utf-8?B?MnVwOWVvWXFKaHJnWTdHUUtpVCt3em1tWk03cHRrRHE2QThWRURuYnNtR3pJ?=
 =?utf-8?B?VnlZN0NmUUVISUdOK0U1dzZMdTkweU5rWHlhYzFjV1duUjhVSDBQRzcyaFVr?=
 =?utf-8?B?cmp0em80R1JrcG5wS0tzendNZHRrRm51L2NNRmZraHFUbjFrT2VnejJxZE4r?=
 =?utf-8?B?emdxcG1YYlY0bUlmalR3dXFGMTdVOW5MNGlJUHVwVk5TUUduKzdvN3R6L2xs?=
 =?utf-8?B?SUdVMnQ3dHgxSUl4bWNJS0hydG14UHh0UU1ZYy9HVDlOWlQxYTZGVTgyeG9w?=
 =?utf-8?B?c1VqTFRBWVd5emM1ejljT2UrTTVmZ3oxWlpDZlAzOThoUGgwbkR4UTYzdkx5?=
 =?utf-8?B?NGNmUk8rMExUSWRoUjZmTWVxaHgvbGpIWEdPNm9WZGdpay82VnFUaXgwQnh1?=
 =?utf-8?B?amRTTDBxMWRDNSswbk9aaVlVRERjWVlQcUJySzFFQXRFWWNkWDhGWGZkaXl3?=
 =?utf-8?B?YTlXZGlTQUxtTG9Qak1yRlFIeDhOMFQxZi90ckpHOUF3MnFqcDVlVzVqUDdQ?=
 =?utf-8?B?Tk1iZVhwWjZGVlVpZ3VTRS9Gdi9VUHBLbnd0SkJ1S3ZQSjgxRlRzL0IrYmYz?=
 =?utf-8?B?S3M5blhJaGV4TWlCQ0wwRSt5NjYxRnIzNU1aT0pxUEFWZ2hIR28wTXdQOEZv?=
 =?utf-8?B?T0xQakpRenFPbERYeTZmSVF3eWRwWTlZK095YzY3dFVWdHVMb05mQTJGc1h0?=
 =?utf-8?B?TUxTYXZpNjlNc1RYQmdSMGZneWNsNU9BL21qbVBlTzRWeXJnb3lscDBjMGFS?=
 =?utf-8?B?RmkwV3UyZHdDcXNqaWdtUXdUYXNhRU1qNDd3U0lwWjAzZEp2dVRwS3JiYjRG?=
 =?utf-8?B?azVGUGdGZmIvZFR5aXdJTlZUQU41T1d4aXZST2dSL2lDTVV2ZjErSzRjd2Rk?=
 =?utf-8?B?WW9Kakd4N2pQaitHTDZYd3IvL0JqdU5seFBXZmx2RURMeWJqc0pqUTFKYlVE?=
 =?utf-8?B?d1lVc0xLUnJGRmZYOUdGWTNoeXAwdlhQWWwydk00dFk5REt1Y3VyZFZvRlBt?=
 =?utf-8?B?R3VrdFhwbGNKa1NucWNEcTczMzIxUXIxWWNYYkZDRGg5eU5rREh1ellybHN4?=
 =?utf-8?B?dkpLR01UUzNZOVk5WFB0MElxeldlcGxMVzlXMUxxeDZEaEtJVUM1Z3lRblhu?=
 =?utf-8?B?cEZoVXpzZkN1cEhOY3NLajA2MGRCYll1K1lYSmlnN0RvRGhneTFpYkZyQzBy?=
 =?utf-8?B?VS9tZk9RTEx3ZExXbE4zQUxOYkgybmEzdXFFb3ZtVmx1cHBXNUJvZmF2UWhk?=
 =?utf-8?B?ak4wbHp5WTRiR3JZOHo1RGZ5dkZGWU9abFVPMFFjb1ZSRVRCYkJxRDRoQUo4?=
 =?utf-8?Q?U3oXwgoQvNbk7KMlx6olxJo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2bb184-6b9b-485b-c88f-08d9e0004685
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 12:43:23.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2VocxTxa64tiutntErSkz4H4O7L+qKrwXJeKOXM25HTdLTTfKCKB7M0pQKUKlsAUhF7H5QjNwKGX1tfNvROlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4398
X-OriginatorOrg: citrix.com

On Mon, Jan 24, 2022 at 03:44:53PM +0100, Jan Beulich wrote:
> On 20.01.2022 16:52, Roger Pau Monné wrote:
> > On Thu, Jan 20, 2022 at 03:04:39PM +0100, Jan Beulich wrote:
> >> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >> Unlike Linux we want to disable IRQs again after MWAITing, as
> >> subsequently invoked functions assume so.
> > 
> > I'm also wondering whether there could be interrupts that rely on some
> > of the housekeeping that's done when returning from mwait. I guess
> > it's unlikely for an interrupt handler to have anything to do with the
> > TSC not having been restored.
> 
> Actually this is a good point you make: We don't want to enable
> IRQs when cstate_restore_tsc() is not a no-op, or else we might
> confuse the time rendezvous. (I thought that I would remember
> TSC to stop only in deeper C-states, but maybe I'm mixing this up
> with the APIC timer.)

There's a comment in time.c that mentions the TSC only stopping in
'deep C states'. Also note that in that case the rendezvous function
already updates the TSC, so I'm not sure whether calling it with an
out of date TSC would be harmful - it will be updated anyway to match
the master TSC.

Might be safer to disable interrupts unconditionally on CPUs that
don't have a non-stop TSC just to be on the safe side.

Thanks, Roger.

