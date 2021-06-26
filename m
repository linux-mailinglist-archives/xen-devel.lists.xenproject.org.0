Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B679F3B4ED1
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jun 2021 15:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147554.272127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lx8i1-0002kb-VN; Sat, 26 Jun 2021 13:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147554.272127; Sat, 26 Jun 2021 13:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lx8i1-0002iZ-RV; Sat, 26 Jun 2021 13:50:57 +0000
Received: by outflank-mailman (input) for mailman id 147554;
 Sat, 26 Jun 2021 13:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duLp=LU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lx8i0-0002iT-Er
 for xen-devel@lists.xenproject.org; Sat, 26 Jun 2021 13:50:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b58653ef-93d1-4564-95df-98388f4d8fc8;
 Sat, 26 Jun 2021 13:50:55 +0000 (UTC)
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
X-Inumbo-ID: b58653ef-93d1-4564-95df-98388f4d8fc8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624715454;
  h=to:references:from:subject:message-id:date:in-reply-to:
   mime-version;
  bh=76BezD0TbmRj6QLpIza1jOHPyQBwRKZEFZXR+rj529g=;
  b=X9gwDt/U5+chC1O8TE3McvCt6Bj8eMQEMpv0KheTClT7kiLj2uj5lgBD
   yI/MxKhtmTcU8X4+1QbBCrqnPh7lJaHwxOf09bRf6enJXigt7zf9AxXuF
   xFleSJsAGPHstGbLpHp9TK+2rOqOd7To9cxraFwe5q1KtoI4puq6GLyKy
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ghlMmVxhq9iozOb+eY8NH6Roh2XEly7Bfm9JtWJQuZrXpTlqu3LydqfZ0YrWNBWc5xTZYSbdB/
 6hlKmsMC1rqPb+LoKJqX+DCjrtS3VQ7WGqhyUH9ZdTBBwbqLZ2/JAEvUPQlwJhQAZoOjz40Kzj
 SkUrtLSr7TrudY9nADdhaxxzqYaa23FKwslGIMbHMtuL8csIIpDP9TSuZuWLgIBhclYkJQZox1
 zQAAGS1TP2CYQTnn1FyqdjEv8+FXbmWwNvIvwk5H+8Vv1Cwx1epIucmwuYObITjtpWgVHs6BIL
 jvk=
X-SBRS: 5.1
X-MesageID: 47027669
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tkNaQ641vy9e9R1oEAPXwTiBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJhSo6H9BEDgewKgyXcR2+gs1NiZLXHbUQeTXeZfBM7Zskfd8k7Fh55gPM
 VbAtFD4bTLZDAQ56uKg3jbYqQdKZu8gcSVbI/lvgZQpGpRGsddBmlCe2Om+wFNNXJ77c1TLu
 vj2iMLnUvsRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIB/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF4nMifrHIR1P
 XcqRYpOMp+r1nLeHuunBfr0w78lB4z9n7L0zaj8DveiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDCnHgD/267HzJlBXf3KP0DgfeNMo/jliudN0Us4UkWVfxjIaLH44JlO41Gh9e9
 MeS/01jZ1tACCnh3OwhBgm/DXjZAV0Iv68eDl3hiWi6UkeoJlI9Tps+CUhpAZ2yHsccegO2w
 2WCNUjqFlxJvVmG56VU91xPvdfTFa9GC7xDA==
X-IronPort-AV: E=Sophos;i="5.83,301,1616472000"; 
   d="scan'208,217";a="47027669"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhS8DXJVbzNnR6JHOeGQNM9f/1os91/ubrQqOlcREl0NsMexi7cLxKZsznvDkGBXsxprAncDvs1EZtj8IHuN0Zg55WR5KuxCMKjF+5If1EA41RVHW89h+fcvYdAHeRiD6BxZ7RJCvNEBr3Kwmp/InEKV01APsdMQ5yrhqMAwFt9r1/vsN10U/FgI1HR5fGKHUoAadAWqXcDEiAGETZ2ak4+M/Opa1x/mloqKcWznvCS3OP1mLCCkYtW5hULYIcILo+dahuQJlRsgeAQRrx+JoI9aHy8sygOLh9NkuFhF4bbWRkuFQwsSD/qu+NlwVw4R7U6HP8r4nTqbotFbwej80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1RqFWzu0I3vAXD4pa7U6+yCgAxkwwoDMeZNDEYeE/s=;
 b=QKlQlbHBDZkd+TJ+2NU6t3SXAGAfWpNZVSPTuNsN/3Ek4MsuT3iAj+C9biD1+gQcgjgm2gwM9p7GHzqeU5XYkaKE/HB0/QpZblI7pRQVy+XdcBtN1PhZIUvYR5Sn0maPO39VbUIs/W0Hp6tPbGtyFHW+y7cT0M8zunpiSozh7PmrmyxgaAXlvZT3aBFgjj9ziqFG8veihYBEMgE6jXaW72qjJhoVhDk9nEhjAWQQLMVq76G3coOLrExTqVUjibd8msDKD+uEOk4MBaWo9dJHpwTgB+i5wfd6vlnKo89xkEHtNdNETH+dXg1UirEkVGi1V+OhEFgobxc3emtsPqUp1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1RqFWzu0I3vAXD4pa7U6+yCgAxkwwoDMeZNDEYeE/s=;
 b=xd9FjWRCrv71DCT2mYkoJvn6jTbV6iVIQdkaUlCOyPW4NXjSFdmeyFuIS3M8VrhesjCd4YuNkq9EFwvawucsybf3UISsZtxmFWrEF+Z3M3en46wioZvi4G+cZhah8ZOY1JuQNNvmWJNL/PYe0A5ONPQjEhyQwDHDUp1esSE4fVk=
To: Rroach <2284696125@qq.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <tencent_A17CA7BA63F6E47B3FE7B1AC54E55B2A3609@qq.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: A possible pointer_overflow in xen-4.13
Message-ID: <fbd1eb89-695c-5c23-da07-ae16fd567010@citrix.com>
Date: Sat, 26 Jun 2021 14:50:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <tencent_A17CA7BA63F6E47B3FE7B1AC54E55B2A3609@qq.com>
Content-Type: multipart/alternative;
 boundary="------------A21145073B93ACB78A62D826"
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0152.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e603cbc-ba6d-4061-78f8-08d938a96742
X-MS-TrafficTypeDiagnostic: BYAPR03MB3863:
X-Microsoft-Antispam-PRVS: <BYAPR03MB386322E3343899CAC5810F64BA059@BYAPR03MB3863.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZ5NRheLsAVRVyA1S+RCDf4znQC9MFKEfBP0vQL9/o6eoshHKLBWO8RSgSt0+hAZYa3kORAcr8dhERiTn4ZH4s+70ZF0zQsW/MvR5ChLg5Ejd++gfsuwxD+8fedvG1Q6E5kZc0MW7sd9PLWPYQQJ4/srhp0EtkF5jYYfyqIXz8K2Dz92EEed422fjanEAAykRBg/SbucwN/eUPo/Xu0Dm9qbUStARg+gHb70rcXESR0M6b70leVQM0uQQmtZJUaJ+IRQG94ZBF0h9J9jb4/qjaXplqhBDKsNnmQ2JWL3RzcL2C5l1lvlx+EjbZgGuF8lIdnNX9lqyUjvX6xh/0To5SnolZLnnmNUiD8JaHjx6ZxL89V4WMMshoRVqSstfAaOCwnhzPYTKyAc9+BQYQuoSBktITn2Fr9LzBJQHLLe/jh2bofnsNNbT8VdGnlHgFIIz3sfjsALeDKjaVgcei/cMidIp2GMXUjCS/eLZKRpgXudeyVK2JkciC7cB5OIGvAsImZFpOHalMeJA5GokJfwhBeUrlLdwfL1r8Dk9XEUyRdrRYLtDMljtiV+fj33EvjEZ8l8CXfjm/vu2wmpI0Z7Hn2dOC2prh327gpBSqHW6pYlvd88QH3YjDsYn16emDgdbV8xS1dMJL2tVBP8a9S6OQFQZ8CxQ7OKl7aONbvhvsmwPaGVwDK47L/7ZKO9lDJ3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(6666004)(38100700002)(66476007)(66556008)(2906002)(316002)(110136005)(66946007)(16576012)(956004)(8936002)(8676002)(2616005)(478600001)(31686004)(26005)(186003)(31696002)(6486002)(53546011)(5660300002)(83380400001)(86362001)(16526019)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?GB18030?B?UGdBWGdxVEZiYitZQmZ6UitReExEODljWFhuUUVtRU1DdkdjMkJWcDRJVU5Z?=
 =?GB18030?B?RUN3RmR1RG4rbGUwNlBqOWIwdHpYRWVaanY5TkRqU0JwelVDYlNZSWtUOUdB?=
 =?GB18030?B?OGRIRWxSMWtVOG1IbU9TQzd4NkVYOWw3SmV2bGY3UmlXMlZhNDhCRTVGaWZR?=
 =?GB18030?B?RFBBUi92ZkJRWitWb2lNYzJkSm1DcEIwbVlmRm9IeGhJazVCNjBSc2p1d01I?=
 =?GB18030?B?ZHJEZXd0dGx5S3RsY3lHVml3eEppS0MvazBFUFIrSVM1Qy9YTW14OTZjVTV5?=
 =?GB18030?B?cktaZzN5RzZ6bzZxc1ZtdExBR2FXNEkwSnhsZmZpWmwrdGtrSWo0bWgwNitF?=
 =?GB18030?B?bEg5MVhXTDQ0dnhKdllma3Q0ZUlyUnl3YlI4TkdJT3VXOWF2MTVXWlExOURt?=
 =?GB18030?B?ZzBVNG5IcXQ5L0Rma3d6Y0hFMUZQaCtPNElIWUN6RWd0dmNxYXpWZ1pseDJ5?=
 =?GB18030?B?ZWwrK2cvRVFiU095MVY5ajZYaEEyeU1XZTluYWFubmFkY1JNM3MxMDZsUDc3?=
 =?GB18030?B?dEVHcXRNbWt2M0dpMGplVzd4cVIrTEtqYlUxK3VLVmZYZVZWWDhRblh2aGY5?=
 =?GB18030?B?VUxYUTQ5NGRoZU1TQU90MTlWQ1BmNE11Q0c2Vlp0NXpQcXhtZXQ2S1hyZ3JR?=
 =?GB18030?B?SjNQWkNCV1NqVlpqa210bXUzSDNkUHRucDU4SGZnbmxCay9Makw4dlhZNCtC?=
 =?GB18030?B?YmYvTDZCYWhUUlpkdnU3a1d4eUxxV0pXQlZZYVZTcXY3TnZiS0JzMkpoY2tp?=
 =?GB18030?B?S1ppTUFFaFlDbmM3M0FJSGp5Z1YveTZsY2VLYXdlbzZuSkRMY0c0OUh6TVAx?=
 =?GB18030?B?VEEzUXVhdjlzczRZT2lZUjNZcVU2Q2VZTmtDTEZjWXlwWGhIaWhMRVorVENs?=
 =?GB18030?B?TXpvR1hXaWZHaEtIaDlKNWVNQTRwU0E4ZmQ1NlFKaU10TzUrd1IwWjdId3cr?=
 =?GB18030?B?dDFBa2F0dER3WEpBalcydnJ4SjUrM0RYRTVYb2xsODBnc0tRTFZhUmM0aERh?=
 =?GB18030?B?dkRFSlVkd1J4SlB1KzJiRVd3aU1XN1YvR3VSYjVYRlJkSXg0QVZYTTdndmZY?=
 =?GB18030?B?cFRlNnJVZ3FhOUxVcmtmWk9GZ1NVV1pGK1hWUFF0dnNPbm9UNVBEb3doaVY5?=
 =?GB18030?B?R01GZ25SYmpiN0hpdkRTaklwWWtIMlU3K0FxcENHRldOdlN1QnROMmVLWk5h?=
 =?GB18030?B?ZnFlbEVTT29lOXZxSXloVUdISkRKaDJqWDl1Zjc3U0NqYUQwbUNvdXVmb2th?=
 =?GB18030?B?WTUrZ243L09zMzFKRnZpTXp1QS9pcTEvSzB0aTFFand1SEZnLzdCUm9WZjR0?=
 =?GB18030?B?ZW40Qm04czdidjFPcFMzWG5LempHWjU0bkFlV25YSitJWGZzdG43WlljT2x5?=
 =?GB18030?B?d0FZdkM2dmNia3U0ODUrdmxqUnNQNENZelQ4NmZiNURXTHkzL1pIMm9HdlBM?=
 =?GB18030?B?UVZCL1dnbVA5anR3d1hwZnJ3ZG5qN1ZBS1FlY3p3UUdLNnRreWcwK1JXT05s?=
 =?GB18030?B?M0JDVktvMHRJTEViZXNldm9sS2JTOUVTK1YwOGlPc0pFelVpVFpFWWU5ejdy?=
 =?GB18030?B?SjhCeUlMM0FLcEM4THFnUUhPb2lXeTdMUjUyS2tFYjFmTUhrVzMrbm05a3h2?=
 =?GB18030?B?YVFCakZPNmFvdnBvWUtqM3V6SVNyeTI3ajRTekhXbzZBK0NqLzQ3YVROTE1u?=
 =?GB18030?B?THpLbDhFT2F0QmNDaFpVTHQ5RFNkYnV2bTVNQUo5b2V5Y3l1bFRMNE5zUGRI?=
 =?GB18030?B?UTJqeFhwRmhlWHJWblhZakhVeTBqMFZEZ1VBL1hlQkgxdTFEdjVs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e603cbc-ba6d-4061-78f8-08d938a96742
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 13:50:48.4812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GVA7WKinPEvHG/IqlPikMh7cwHLQhIo3gU5F2y/38bDQ4LIo3XbVclD1QM5FfhlT62+vu63L0svbD0tJ1zEcuelY1MpuLacsUMlSa3LpFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3863
X-OriginatorOrg: citrix.com

--------------A21145073B93ACB78A62D826
Content-Type: text/plain; charset=gb18030
Content-Transfer-Encoding: base64

T24gMjYvMDYvMjAyMSAxNDoyOSwgUnJvYWNoIHdyb3RlOgo+IEhpLCBJIGNvbXBpbGUgWGVu
LTQuMTMgd2l0aCBDT05GSUdfVUJTQU4sIGFuZCB0cnkgdGVzdCBpdC4gSG93ZXZlciwKPiBk
dXJpbmcgdGVzdGluZywgeGwgZG1lc2cgZ290IHRoZSBvdXRwdXQgYXMgc2hvd24gYmVsb3cu
Cj4KPiBJdCBzZWVtcyB0aGF0IHRoZXJlIGlzIGEgcG90ZW50aWFsIHBvaW50ZXIgb3ZlcmZs
b3cgd2l0aGluCj4gYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmM6MTMxIHdoZXJlIHhlbiB0
cnkgdG8gZXhlY3V0ZSBpbnN0cnVjdGlvbgo+ICcnJyBBUFBFTkRfQ0FMTChzYXZlX2d1ZXN0
X2dwcnMpICcnJ6Osd2hlcmUgQVBQRU5EX0NBTEwgdHJ5IHRvIGFkZCBhbgo+IG9mZnNldCBv
biAqcCB3aXRob3V0IHByb3BlciBjaGVja2luZy4KPgo+IEkgY29tcGlsZWQgeGVuLTQuMTMg
YnkgY2xhbmctOSwgd2l0aCBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25zOiAnJycKPiBleHBvcnQg
Q09ORklHX1VCU0FOPXkgJycnICYmICcnJyBtYWtlIGNsYW5nPXkgZGVidWc9eSAnJycgLiBE
byB5b3UKPiBoYXZlIGFueSBpZGVhIHdoYXQgZ29pbmcgb24gaGVyZT8KCllvdSBzYXkgWGVu
IDQuMTMsIGJ1dCBBUFBFTkRfQ0FMTCgpIGRvZXNuJ3QgZXhpc3QgdGhlcmUugTCEMiBJIGFk
ZGVkIGl0IGluCjQuMTQgd2hlbiBJIHJld3JvdGUgdGhpcyBtZXNzIHRvIGJlIGNvbXBhdGli
bGUgd2l0aCBDRVQgYnkgbm90IHVzaW5nIGEKUk9QIGdhZGdldC6BMIQyIFlvdXIgYmFja3Ry
YWNlIHNheXMgNC4xNSB1bnN0YWJsZSB3aGljaCBtZWFucyBpdHMgYW4gb2xkCnN0YWdpbmcg
YnVpbGQgKG5vdCB0aGF0IHRoYXQgaXMgZ29pbmcgdG8gaGF2ZSBhbnkgZWZmZWN0IG9uIHRo
aXMKc3BlY2lmaWMgaXNzdWUpLgoKVGhlIGZhY3QgdGhhdCBpdCBjb250aW51ZWQgZXhlY3V0
aW5nIGNvcnJlY3RseSBtZWFucyB0aGUgY2FsY3VsYXRpb24gZGlkCnRoZSByaWdodCB0aGlu
Zywgd2hldGhlciBvciBub3QgVUJTQU4gd2FzIGhhcHB5LoEwhDIgVGhlIGRpc3BsYWNlbWVu
dCB3aWxsCmVuZCB1cCBuZWdhdGl2ZSBhcyB0aGUgc3R1YiB3ZSdyZSB3cml0aW5nIGlzIG51
bWVyaWNhbGx5IGhpZ2hlciB0aGFuCntsb2FkLHNhdmV9X2d1ZXN0X2dwcnMoKSwgd2hpY2gg
SSBndWVzcyBtZWFucyB0aGF0IGYgLSBzdHViX3ZhIHdpbGwKdW5kZXJmbG93LgoKSSdtIHZl
cnkgY29uZnVzZWQgYXMgdG8gd2h5IFVCU0FOIHJlcG9ydHMgYWdhaW5zdCBzYXZlX2d1ZXN0
X2dwcnMoKQpjb25zaWRlcmluZyB0aGF0IGxvYWRfZ3Vlc3RfZ3BycygpIHdoZW4gdGhyb3Vn
aCB0aGUgZXhhY3Qgc2FtZSBsb2dpYyBhCmZldyBpbnN0cnVjdGlvbnMgZWFybGllci4KCkVp
dGhlciB3YXksIGRvZXMgdGhpcyBtYWtlIHRoZSBwcm9ibGVtIGdvIGF3YXk/CgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jIGIveGVuL2FyY2gveDg2L3B2
L2VtdWwtcHJpdi1vcC5jCmluZGV4IDExNDY3YTFlM2EuLmJlNDFiY2VkNzYgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYworKysgYi94ZW4vYXJjaC94ODYv
cHYvZW11bC1wcml2LW9wLmMKQEAgLTk4LDcgKzk4LDcgQEAgc3RhdGljIGlvX2VtdWxfc3R1
Yl90ICppb19lbXVsX3N0dWJfc2V0dXAoc3RydWN0CnByaXZfb3BfY3R4dCAqY3R4dCwgdTgg
b3Bjb2RlLAqBMIQyI2RlZmluZSBBUFBFTkRfQlVGRihiKSAoeyBtZW1jcHkocCwgYiwgc2l6
ZW9mKGIpKTsgcCArPSBzaXplb2YoYik7IH0pCoEwhDIjZGVmaW5lIEFQUEVORF9DQUxMKGYp
gTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEw
hDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQy
gTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEw
hDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMiBcCoEwhDKBMIQygTCEMoEwhDIg
KHuBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQy
gTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEw
hDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQy
gTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEw
hDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMiBcCi2BMIQy
gTCEMoEwhDKBMIQygTCEMoEwhDKBMIQyIGxvbmcgZGlzcCA9IChsb25nKShmKSAtIChzdHVi
X3ZhICsgcCAtIGN0eHQtPmlvX2VtdWxfc3R1YiArIDUpOyBcCiuBMIQygTCEMoEwhDKBMIQy
gTCEMoEwhDKBMIQyIGxvbmcgZGlzcCA9IChsb25nKShmKSAtIChsb25nKShzdHViX3ZhICsg
cCAtIGN0eHQtPmlvX2VtdWxfc3R1YgorIDUpOyBcCoEwhDKBMIQygTCEMoEwhDKBMIQygTCE
MoEwhDKBMIQyIEJVR19PTigoaW50MzJfdClkaXNwICE9IGRpc3ApO4EwhDKBMIQygTCEMoEw
hDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQy
gTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEw
hDKBMIQygTCEMiBcCoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQyICpwKysgPSAw
eGU4O4EwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEw
hDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQy
gTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEw
hDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMiBcCoEwhDKB
MIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQyICooaW50MzJfdCAqKXAgPSBkaXNwOyBwICs9
IDQ7gTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCE
MoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMoEwhDKB
MIQygTCEMoEwhDKBMIQygTCEMoEwhDKBMIQygTCEMiBcCgp+QW5kcmV3Cg==
--------------A21145073B93ACB78A62D826
Content-Type: text/html; charset=gb18030
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
  </head>
  <body>
    <div class="moz-cite-prefix">On 26/06/2021 14:29, Rroach wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:tencent_A17CA7BA63F6E47B3FE7B1AC54E55B2A3609@qq.com">
      
      <div><font size="3">
          <div>Hi, I compile Xen-4.13 with CONFIG_UBSAN, and try test
            it. However, during testing, xl dmesg got the output as
            shown below.</div>
          <div><br>
          </div>
          <div>It seems that there is a potential pointer overflow
            within arch/x86/pv/emul-priv-op.c:131 where xen try to
            execute instruction ''' APPEND_CALL(save_guest_gprs)
            '''£¬where APPEND_CALL try to add an offset on *p without
            proper checking.</div>
          <div><br>
          </div>
          <div>I compiled xen-4.13 by clang-9, with following
            instructions: ''' export CONFIG_UBSAN=y ''' &amp;&amp; '''
            make clang=y debug=y ''' . Do you have any idea what going
            on here?</div>
        </font></div>
    </blockquote>
    <br>
    <font size="3">You say Xen 4.13, but APPEND_CALL() doesn't exist
      there.&nbsp; I added it in 4.14 when I rewrote this mess to be
      compatible with CET by not using a ROP gadget.&nbsp; Your backtrace
      says 4.15 unstable which means its an old staging build (not that
      that is going to have any effect on this specific issue).<br>
      <br>
      The fact that it continued executing correctly means the
      calculation did the right thing, whether or not UBSAN was happy.&nbsp;
      The displacement will end up negative as the stub we're writing is
      numerically higher than {load,save}_guest_gprs(), which I guess
      means that f - stub_va will underflow.<br>
      <br>
      I'm very confused as to why UBSAN reports against
      save_guest_gprs() considering that load_guest_gprs() when through
      the exact same logic a few instructions earlier.<br>
      <br>
      Either way, does this make the problem go away?<br>
      <br>
      diff --git a/xen/arch/x86/pv/emul-priv-op.c
      b/xen/arch/x86/pv/emul-priv-op.c<br>
      index 11467a1e3a..be41bced76 100644<br>
      --- a/xen/arch/x86/pv/emul-priv-op.c<br>
      +++ b/xen/arch/x86/pv/emul-priv-op.c<br>
      @@ -98,7 +98,7 @@ static io_emul_stub_t *io_emul_stub_setup(struct
      priv_op_ctxt *ctxt, u8 opcode,<br>
      &nbsp;#define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p +=
      sizeof(b); })<br>
      &nbsp;#define
      APPEND_CALL(f)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;
      ({&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      \<br>
      -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long disp = (long)(f) - (stub_va + p -
      ctxt-&gt;io_emul_stub + 5); \<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long disp = (long)(f) - (long)(stub_va + p -
      ctxt-&gt;io_emul_stub + 5); \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BUG_ON((int32_t)disp !=
      disp);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *p++ =
      0xe8;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(int32_t *)p = disp; p +=
      4;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
      <br>
      ~Andrew</font><br>
  </body>
</html>

--------------A21145073B93ACB78A62D826--

