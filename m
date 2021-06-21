Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6D3AE76B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 12:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145444.267615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvHN6-0005JH-Mf; Mon, 21 Jun 2021 10:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145444.267615; Mon, 21 Jun 2021 10:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvHN6-0005HS-If; Mon, 21 Jun 2021 10:41:40 +0000
Received: by outflank-mailman (input) for mailman id 145444;
 Mon, 21 Jun 2021 10:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22HU=LP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvHN5-0005HM-78
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 10:41:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eb70eab-c82f-4d87-8a59-63724fb2ebc1;
 Mon, 21 Jun 2021 10:41:38 +0000 (UTC)
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
X-Inumbo-ID: 9eb70eab-c82f-4d87-8a59-63724fb2ebc1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624272098;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4/QvMKUH8PTSygpmPmBbtHJHy6tcnDiPJec1dUIPPOg=;
  b=RWmVFwDUbjg+sCTWKgzULVds8RPZSFj2QatY6QgG/DjimBkN8DD6+9S5
   pwoLhYcKeE6qdZphqiFBTHvq7ybi3fQ3vXpnbWHMLvvz7Fxx8geqfZGPS
   psu4xRythzm6ISqcMYPA5uVGBSPLpeYZkkmeDbDpxbDI2GCTbOzfVbEbH
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EVhOul9vqS7YydjoHpMySQj1q+SXI2rH8C5D4sMBQtdSJlIbp8l1kroNLCssRKAg+sQnUy2cvk
 PB6xruCqxEszK18RO1dZ3Jp552zr/hFYMO3h20vicN1j3iYwmK/Z6pJPk452XCNN7O/RpMxFPU
 itgVIMTl3x4tirI8+69jAQGp3gr9w0oy92uS3sGx4XrI1AH/52SlVpD+dG/Kxbu0/knzDCfFD/
 8grew3tk4npIv+dhiBcEMESQDGxu8dCuv8l/kyLR4o5MMca1SRuXcIAmqUO2nchcK1ZusLbo3+
 f3s=
X-SBRS: 5.1
X-MesageID: 46301366
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RvDLvqzNJm1f34sftuVSKrPxteskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LXHCWuDYq8dKbC8mcjC74eurAYZcegpUdAF0+4QMHfqLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7Ld0XtEtKz6eEi0/ndEFc7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpi/uxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyCIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ+e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3xHklV6voIRiKrrzOSI
 JVfZjhDbdtABCnhknizy1SKIfGZAVqIv/uKXJyyPB80FBt7T1EJgUjtZcidtppzuN0d3B+3Z
 WyDk1frsAFciYnV9MIOA4/e7rANoXse2OBDIvAGyWpKEk4U0i94KIft49Fmt1CPqZ4lqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.83,289,1616472000"; 
   d="scan'208";a="46301366"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6b7JYa5Jid1qJypnSIxNbwRfruvafmiRvRrf8PUx7WsGCNwC4oRDWQUTUHqic+2NX49pSLEcoCrTj+zBgrCBOLopPlVNBG5ECB8DnTnSNAkhhDaGzti15Swqoo+3bgq/XzdcR9v9VsICGzRzg3ZovxR1yOHI24XnkfFhL82gSM/c7QQvGtvcNCYaud6+PTxJdwQa2j3DD2AktcGYnf+TGGro9PdNx2O8MCX/m25SJZd3btZ4IU+wUqRs3x5k/np4jexZaJrX+3oPOpDzBI6BpjUFmrTTB+75b4ZKqw91IpmUT1jFXZRkFJRL/HGyNHjaK5rFNj2bcmM8IN3qUKqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7Z5rl6BOUJjVox1tz9DXVUzFGaNOceGaxqhCmktjwo=;
 b=COveSTiUm9FoeZYhOeC6a+ODdWa/1wd7juqbTlTwEgtY1yUkZba11XeIDPxB0aJARohpdBkR9nlpKaPTubiYNcOYxKCPbcNFCHzLzJBfhHC8UNDroVqghjQrdJLLf7xWyrdWbx7TZLdaOPtJAHd1VgpvJoIYPol9+lhAWQoGnEHeS7M45HQB/BL7yVv+6IonWn5v6Dl84ModbHidFEH10K9lUAMX5TRc3HPeEyitznkYQqJL2Yj72hJucwiT1tpRaAFarlXmjXfdpLTJRgmQdd//rSoPoLz3zA1IHOJLg+TDopa+Wjzque1xOWbWPvEwobLrM2CTW5fLx/jWuE0PCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7Z5rl6BOUJjVox1tz9DXVUzFGaNOceGaxqhCmktjwo=;
 b=ktwrLXeYamNUBCnh9/FwZXW6K79+lzEq9ETYwltIKxcUZxGAW+j96xUG6hZQ+QplojZP/p+cFMlApLU2mdMg1CvctvW9xZvJs5FSWbF3VRCbTxKdJjBH8eMVGTwc1wUY35N5K/MiEUZY854Zds0NsOV3GMevkmfvmwGdNQMzBsc=
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>,
	<xen-devel@lists.xenproject.org>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
 <ff0c9f42-f45e-e78e-35b9-c030011eed8f@apertussolutions.com>
 <6d50efc1-6c13-1481-b70c-0abfa99aa610@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
Message-ID: <8a909d6b-e69c-05ce-35dd-0f6be719b5ae@citrix.com>
Date: Mon, 21 Jun 2021 11:41:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6d50efc1-6c13-1481-b70c-0abfa99aa610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0454.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 102d8348-da31-4539-9809-08d934a12237
X-MS-TrafficTypeDiagnostic: BYAPR03MB3864:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3864E74B4AD33269BF8698C0BA0A9@BYAPR03MB3864.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRUUOFra2oT9MYhak2DMbsAdQMBp9dn4TLtB44yBohAueNQLkWx3JNGXCLFZ9Iz3wDGXDbL6/O2uX6JN2fWxXm0+2y0GYlqLsKD89T/cDi5Fe21F1xS7hCyf3LAneyC9pUj04xBMcYt70rJXTHeMDpqfhfyXcsvGlDTxhcy5zEX8lKIjVvRRwUe1/aRP7a4J58Kcqi7C9HJcINIR9qo6hACWJK/11iQWtSHfSkRr8Hkr08jS4kf8MxDoKtvibCqzmOlHqom3aCuwyrnhHOiYfU8P1nAH81mzMgntjgCHjneNZD2C0SORm3b/NM+DFOK7DEEt+S/m655fmtbC2W+ia4plRt1uRSITPhsc+hMBP0GYJ52q4mwRKQtD7vLsfqeI742qRbCWc3qTc4utLLLl8Ip16UqRhMJIFwvi64O2OJ2i32nXjgxmZzG8GGJoWDJnapIw3V/f+1F3vCk493Ne4KGbKvLCOocVjcM9wJjuqx0fGDaqVvG7CSHnskCr6Sraqsm+XBy8goqXKEf0DGgP2RPJLHWPbA3T3ZeSvghv42d3ObWldpUeXK7ZXX9QxP95VY2xIVlb202SW/Z47qNlwBgEulOhAWSHGDe6qBmL5uppPVuK/MSaRjCYqUEeoRaq4HE9jfAu6GNUcS5cuORJP7X6BuZjwc7KqlfKFGd4RshcDj99DUlOkNALH8pWMnd/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(5660300002)(4326008)(31696002)(66476007)(478600001)(53546011)(956004)(66946007)(316002)(86362001)(7416002)(2616005)(31686004)(54906003)(110136005)(16576012)(38100700002)(66556008)(83380400001)(36756003)(26005)(2906002)(8936002)(6486002)(16526019)(6666004)(8676002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajRMSERPVzd5clNpeU9NKys0dHVDWWZuaXhOaUh4emlIck9vaHJpWlYwMldu?=
 =?utf-8?B?YUVuOUM0ZExrSFpDN1RDZmZ2TzFTcFU5MHd1eW9aVHpvR0xvUDRUNXNMYmc0?=
 =?utf-8?B?bTd2Q2hJd2FPeDVGZ0VkelBZWC94alB0OHU0Q0lYb1RKQ2pkVG5xQjBpNlo0?=
 =?utf-8?B?WTdhRytsd2dMRDFUcjRLdDVYNnl0RDFVN01Sek9LS1hMUjJURExOYldFSE1K?=
 =?utf-8?B?R1FrTDNvL1EyNVJkbjFUcmJvemx3ZlBGc0MvbVY5cGhQOElRWENXN0tWQ2Vs?=
 =?utf-8?B?T3YzeEc5V2hteStEaGxxamRVOWRVOU9UU0VUR2hwUi94dTNudnZUVmNTU0l4?=
 =?utf-8?B?dXVUTlUrbnpLUVozdXduRjNlMUdIb0NFSmJaWVErMHVBYnVmY05XOTdlSGVS?=
 =?utf-8?B?SytTemhreGNxcGl5MXRyWjFXekVVVEFpcWhTMnFFTXZPckFnYXlrSWcwd1l6?=
 =?utf-8?B?ODJXNWZGcWxkVGw2dWNqNWJiQzlCNGhnWm1Od0dtSXF1M3ZaVVZSakhvaGky?=
 =?utf-8?B?VXBHaEt4SWJsK1U0MDlDYlo0eTZyd2J1TmlnMkRmZ2VFeFUydnJqYW94RmEx?=
 =?utf-8?B?VlFST0lxZXN1NEEwa282Vis2Z2hBNW9nRzN6VlN3N2VVbkxzWm1hZFFZZGtB?=
 =?utf-8?B?Q3lTMllJd3pqTlRTSTFMUmZLSENhY0crMVpZOGo5b1ltNFlPQjdicnRaaVhu?=
 =?utf-8?B?STB3RXZVV2IwK216TVBPaFZjeUZJa0YrNHpoUjVTQXRXcndkQ2dkTHQ3ekdW?=
 =?utf-8?B?amNFb3lMR2RMSTJTbzJvQVhsWXVZL3pvU0pudVU1QUI5MjBucnNZZnZ2YzU5?=
 =?utf-8?B?d2oxS1JZbjN2d21FazYrTW9oN0k3NmF6ZC9OczRqOXFQM0VGZjI1cndyL0JC?=
 =?utf-8?B?UTQxeXlKS3BydjdWU2ZYVkZHQm43VllEOHpzTm1WZ2J3RlRaMXh2QkdhMGVo?=
 =?utf-8?B?bFNicXVEYUVqelVVazZpQ2RHendId0poeDdoT2traGsvamRFOGdvUzRRWnZU?=
 =?utf-8?B?UlNkVHVxalpYS1JtQm1kYk9ZSlNLMk1HajhOY1Z1di9oNG0yMHdUbDZBclM4?=
 =?utf-8?B?U1cxV0psemNZajBKNlVtK3JCbTQwVVNsK1pSaHV0NGJFUTlhMFdyWmlUWDFq?=
 =?utf-8?B?aS9IK3k1S2wyUE5KSjNxYndlaUIyc2swSFhPMDBKalhPUElCSUpIYnovUkNa?=
 =?utf-8?B?WjFicm5YWFI3c3RnUFdmVncwN1lQeVd3bzFnb3Y4SDRkeXF3YTdlU0dSb1pR?=
 =?utf-8?B?TCt6VWZyWTFYMGRublJmWWhvOVFrSjR1R1o0Z202SE1KNExKbWFRUkpBaENX?=
 =?utf-8?B?M3l2NGUwRmMzWHdadlptMTlKSk1vUzZaYWlkWFR6K0RrRzNQcWtDcWh6Q3ZS?=
 =?utf-8?B?SUk4WEM4SUwweENIWjNmVlQ4RzIwdFd4NXlSN2hTYXFUQkp1aHU3aGRrd0pJ?=
 =?utf-8?B?NUl2RzE4K2JOMnY2VW1RS1puUllqV2RqUHRFMDJZLy9MWExyVUNJVGZyaDBH?=
 =?utf-8?B?RkJEUFNXU2ltejBEb1g3cFNtUkpvazBSWnZLbG41ZzB6MnNGS0s0L1NFejB6?=
 =?utf-8?B?dTFXUjRoT082NGtqTVlFOTV6OHZWejFGV25QWlI3TEg4ZGFLM1lHenF4MWZ1?=
 =?utf-8?B?Q1owSTB3aXRaeHJvRFNweHFKa1NHQklrdkF2ZWNWb2hzODZXUmQxMURFSWIz?=
 =?utf-8?B?UDlZZTRKOHdPeE1uejR3Vmlja2JmMzdKZkFGeXFtRDRXREdCSzh2b3g1dFFS?=
 =?utf-8?Q?b73QOj/KRUdhesqa2y+/A0Dx7VCBBiDkVDuvZew?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 102d8348-da31-4539-9809-08d934a12237
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 10:41:32.0622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh8TNzwp/ww0GoYYOk4Yc2Gc6CVHwu+uT/lyuasUAy8gkq+cSy1OxG54OMFUbUO1sAV6rgPxkHv4i5fBvWR+F6erIzJblBZj67PXfSv6SdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3864
X-OriginatorOrg: citrix.com

On 21/06/2021 07:58, Jan Beulich wrote:
> On 18.06.2021 22:27, Daniel P. Smith wrote:
>> On 6/18/21 8:26 AM, Jan Beulich wrote:
>>> On 18.06.2021 01:39, Daniel P. Smith wrote:
>>>> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XS=
M_SILO and !CONFIG_XSM_FLASK
>>>> is whether the XSM hooks in dummy.h are called as static inline functi=
ons or as function
>>>> pointers to static functions. As such this commit,
>>>>  * eliminates CONFIG_XSM
>>> Following from what Andrew has said (including him mentioning your
>>> changing of certain Kconfig option defaults), I'm not convinced this is
>>> a good move. This still ought to serve as the overall XSM-yes-or-no
>>> setting. If internally you make said two variants match in behavior,
>>> that's a different thing.
>> Apologies that I did not express this clearly. What I was attempting to
>> say is the fact of the matter is that there is no logical behavior
>> difference between "XSM no" and "XSM yes with dummy policy". The only
>> difference is the mechanics of how the dummy functions get called.
>> Specifically via macro magic the dummy functions are either flipped into
>> static inline declarations that are then included into the code where
>> they are invoked or the macro magic has them ending up in the dummy.c
>> XSM module where they are wrapped in macro generated functions that are
>> set as the functions in the dummy xsm_ops structure. Thus it is always
>> the same logic being invoked, it is just mechanics of how you get to the
>> logic.
> That's what I understood, really. What I dislike is the inline functions
> going away in what we currently call !XSM.

I'm sorry, but this is an unreasonable objection.

The mess used to create the status quo *is* the majority reason why
fixing/developing XSM is so hard, and why the code is so obfuscated.=C2=A0 =
To
prove this point, how many people on this email thread realise that
calls using XSM_HOOK offer 0 security under xsm_default_action()?

Having xsm_default_action() forced inline isn't obviously the right move
in the first place, and I doubt that you could even measure a
performance difference for using real function calls.

Even if there is a marginal performance difference, and I doubt that
there is, performance is far less important than de-obfuscating the code
and fixing our various security mechanisms to be first-class supported
citizens.

~Andrew


