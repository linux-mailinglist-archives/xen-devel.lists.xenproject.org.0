Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C871138AE3B
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 14:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130928.244973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhos-00079H-Vc; Thu, 20 May 2021 12:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130928.244973; Thu, 20 May 2021 12:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhos-00076P-SW; Thu, 20 May 2021 12:30:30 +0000
Received: by outflank-mailman (input) for mailman id 130928;
 Thu, 20 May 2021 12:30:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V2Ic=KP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ljhor-00076J-0Z
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 12:30:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c89876f-37e6-41c3-b55c-1262c17a5cb3;
 Thu, 20 May 2021 12:30:27 +0000 (UTC)
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
X-Inumbo-ID: 1c89876f-37e6-41c3-b55c-1262c17a5cb3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621513827;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=S6R9/4+ouCIYKdaAg20d3aEyrHyjFZM5VLIj6sTkVjA=;
  b=KN19loinZsyYzZqwwvk9rS/aR0O+gPSJ+zEUv/KIiLQUuByh7cKpAi6I
   l17c4IOhCO3VAkHwuk17o2KHrl1RSY4MXdl0sOQrC9YXHHSbPrXB/vePg
   gEJzxelO2AdEdrjW64VtLV1bUhvvw9VAbAO0/o0J0xeIwkzp0ln7ZfiEe
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ingEAIdoWJ4amoCfXnaXqwCfpqXOGuDL8Go/9mxVmtzuQsI9GYJ/2cean/rDTaSQhEVDI4u+J3
 OPBW8YLvwofcVf3dKj2LNyx9yrkx5tvsHyXPVZ4a9Av3UPIqTCOwtdxDWEt+dy+0HN7M4JuzN/
 VqXV8hZUKznBlTdB9JWuMhnR3udXoIUCfzkjIJacbZNqeXfj3ULTk0uWSbNdECdnr1Ios2ydZX
 oM1iR+lKC2Cpd3UfZdx+iuyprGBuy58WZ/3HnRmQcSsX/1CJ72J2ZebsZ8kNOKFPpNsbqs+rkM
 k7Q=
X-SBRS: 5.1
X-MesageID: 45773330
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:8xppoqgwj5qMiPuwrhCuMMnbX161fRAKZh0ujC45NGQN5FlHY01je
 htvWmGGPffcYjP0f4t0Oom0oEMH75aBz4cwSwtr/ywyHywb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CI6iufQLlbFILas1hpZHGeIcw98z0I58wIFqtQw24HhXlrc4
 Y2aT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YR14Evzuofk8bxBzOiB5F/UB5Z3jeVHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmGq8236zPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaqDO
 JVCMmE3BPjGS0x+Jg0sKoATpvmxqnWheBJI80io/4NitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoTC7+Q5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGSpU938UhuQsHOC+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceWjgCx
 lKP2dTzClRSXKa9ECzHsO3O9HXrZHhTdzZqiTI4oRUt+YjP8aMKkzPzR/1KEamf1proOxWo6
 mXfxMQhvIn/nfLnxo3iowqe2WP998CUJuImzl+JBzr4t2uVcKbgN9TxswmDhRpVBNvBFjG8U
 G44d99yBQzkJb+KjjDFZOwQELyz6/+BPVUwanY0RMJ4qVxBF5O5FL28AQ2Sxm8yaK7omhezO
 ic/XD+9A7cJbROXgVdfOd7ZNijT5fGI+S7ZuhXogj1mPsAZSeN61HgxNBT4M57FyRd8+U3AB
 XtrWZn1VitLYUiW5BG3W/0cwdcWKtMWnjqOLa0XOy+PjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQBbdSRkXciu9aS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:ymSPMKxrJ6Um06LSKKtYKrPw5b1zdoMgy1knxilNoNJuEvBw9v
 re/sjzuiWYtN98Yh4dcJW7SdC9qBDnhP1ICOsqV4tKNTOO0FdAbrsSi7cKpQePJ8SXzIVgPM
 xbH5SWZueQMXFKyevCpCyCP/lI+qjjzImYwcrT1XVVdicvQL1h6goRMHf9LmRGACRLH5gBL7
 zZwsZcvTKvdU8aYa2Adx04Y9Q=
X-IronPort-AV: E=Sophos;i="5.82,313,1613451600"; 
   d="scan'208";a="45773330"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7wkF3/MW7GkQuMsxmqZ7BuYd9ZxXKi0bEc+SWX3PevcmSru6Sfez0kyhZeam3i3Al7UaRnemSyiGbpFpD+Qqon22RVrKhF1VlvkikhR+Fl2ONzifYuATYd85ZgAsOH4tNZMD8B8IKEhxfIeOKHsCkKFUeyVlEbgtmbdDhg4TYPg8vjiyPNTEVE5q7I5dyinEaKnNXqI40Yb4B+qQBn36DUy/RQ3OnkYebEFp7/h1HLZw9gjy1exZCrNkYqL0DjAk1cThYNTbqFQraiP85OnusOJNeOT8rX6nxnPObn4xphRqw3yOQPhsiPhysE7DgGGEpBqj0+BAbN0eeOknTpbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHxq2OPylvnc+qBbuMabDm0op4+VbArYNpTBZ2saP6I=;
 b=dVThx6r+9iDIWoX+Di9n4xUXP8Abcqlzxg7E7Cka8DapmGK/tSLVqRBZTgAS3JSVy5DX4M4oY9hJBWmhO1nOXQpHzdjs7xRDA3FHCQwgaP+ISXUVOiOiuR/kBmXyzrsWtcBqVYkOvwHMzzn+GyRxR2CvKGWf5fD3G//Yqqx9sQrGS9k3CXvYg2NEyJCUvnNHQN0BSF9zz32GqpnWty3RggwXiFgSeggCe72VtEZH3zIvHcprtFIcVgNOl7TY7DO/urJxMwvKDgrceObeawVl4AbnysOTw26vGAxi3i6XrrH6kkTxZ5WQpF7LNv8FkIexWiLTdiFkJd7vYchqIZ29vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHxq2OPylvnc+qBbuMabDm0op4+VbArYNpTBZ2saP6I=;
 b=lfjq1AXBssrsXCUzjmB5Wdc1qmEBo11d4E8JbSFXsGlFThLPbnGkM0DXiONZ6ntzOkD6gmQZiV1LRK9iNLRK1S1e806BrFpR6wFv0Xx+EdqUrJSAzIsDeEmpLEYhsmn0E2kCvUOqXnSl9svAcYgPeG0rD7VwintNhfhiQXm8Dtk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 0/2] libelf: small fixes for PVH
Date: Thu, 20 May 2021 14:30:10 +0200
Message-ID: <20210520123012.89855-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1584a063-ca12-4813-f9ba-08d91b8b09f8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42189054F6C828D3932100D18F2A9@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L9nL3Wyb91xTA3qbCewHlZUaniCgdzRDcZ0mvS282rNAGUS96W+kmb823rWFBHL0IB+9mrY/a9wQeLRAlGBcp0sBrR0cP5H+a+iiFiUt/Rmlyr7MlJSL8CogOnJ8VySRvaWbWhHxMAELdRdi057v1u88DnVDPRUTu9n+Jcb5vh8KWh/zQaVmviPoRq2rw7yYc23ygi/l4k/wS9GaqPSHSe313psqUvNExBa6680PbYPAVxPDJEN2WfX1+BYoIzqMlo+7V9Zri5CJ2aX0WRz1r+bjXAIMdIoIxKNsLDRRdeNANKR+sTWUZziGwmiW15wchdau09aMNfwqqy4JCdYo/wl1iZlr5ysEdwU0xqYB3Sx8r/C+JlgC26e1Omv5YPtnbnckSbGNseYXqjGQdmOPniHLjJIFg30kMhFNxLMGq9KWmlWXY6q6xo/yfwrkhQ52cHrq2nhuE8jX28mY5qZQtZSnegS6iT1ARrSgWz+ic9mEhe576NLGtNUdhuW9N5aqMI3ovBEVhF6OLCDG0Nx1jUBLA6X+/ogZnFd9ubhVKmGR0qiBxiWJT4sTN5bj6x/GFcoUpvZ/wrWcw8vLVxDjyfku5BPatngdcNe47uDSDdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(6496006)(16526019)(8676002)(5660300002)(8936002)(186003)(2906002)(2616005)(6666004)(66556008)(66476007)(956004)(66946007)(1076003)(4744005)(26005)(86362001)(478600001)(6916009)(6486002)(38100700002)(36756003)(316002)(4326008)(83380400001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TTNHeUFHMUJUOHpQMitzZlhFdnNWTmNPbTlOV1V2WjZWRjRiczZPU2R5b2dX?=
 =?utf-8?B?VkV1YjU1OSt0TXhSZElTSXdTeCswbFU1Um9SVVQ4MlowclIwd0FGZUJpQ0kw?=
 =?utf-8?B?VEFmY2x3cG1uK2NWd045WFROeFFIYTNlbUJ6VVBQSTRqWDk4STZ5TEVoSVkx?=
 =?utf-8?B?dVhiUVRKTk8vOUlMM2pEWEtCZ3FrZEtRWG9Fa0lDcE5ieDd3a1NJVXBqdE9s?=
 =?utf-8?B?M2pCYzM3UkVyOHNxODFob0pEb0Jha00wbTRoMm1HUHEzODVMNEY4NnNmL092?=
 =?utf-8?B?M2dWbGF0OFdQRlZ5Yk00TGNWVUJrbSs4a1E2R3ZyMjZLZDE2eDBiQmwvWmZC?=
 =?utf-8?B?WUlGNzYwSytHcnFhbjRVbEFld1RTMlphQzVyV3pwcHN6V1gyNWkxMXhoWlVF?=
 =?utf-8?B?cGFuY2V2TjlWM2VLOUM1Y3RaRG15alJyeE02SU5YTUtkZlAxN3BZNXQrb1JE?=
 =?utf-8?B?K1JPbnlqNmZIVWVPY1B6MkRQZW5obThmbnFadDJDWTM4VzRtZGlQV2dtc2N2?=
 =?utf-8?B?dE9iNWlnSVc3eSszM0Y2M2kyMFZoc2lmRFUwRWN1K28xTU9ZY0IydEVQSnlo?=
 =?utf-8?B?VEQ4YnFTODhSbTJqUHd1SFJOOUNRSWEyTE51Q3p5V0krK1BkWVpWb2lDZlJt?=
 =?utf-8?B?UkZTYytUZitHWm1RSUlrMnZnM0VESWc3Si9Xc3oxMG1nWXQxUG5hTHRNeVFz?=
 =?utf-8?B?OWErdU5IOStsMW5UM0dUeGh3Nk95U09vb1YreDd0bVR1Y0ZxYm9KekpTNmsw?=
 =?utf-8?B?UGZiQm1TNHIxZzJwcUZhYW5pdkUyRU9JUVJDOTZ5N2QvTHZ4OUdHb1EzTUhW?=
 =?utf-8?B?eXRISm1CbnBMVUZKdkdrdmxINkZTVEdtWjRpMlVUMUg1NWVQMGd4MnRyejZQ?=
 =?utf-8?B?UTcxVFRlY1I5SVJYbWkrSXpuZnZxZTlMK3BMNkxjVnZKUmxVSHRNVzVPYlh1?=
 =?utf-8?B?MXl4WTBPVkNBR2h5N2UxMTNrVTVoT3d3VGNBVzVEeW1vVXV1REZRbTBZQkdx?=
 =?utf-8?B?cnJlLzBCdThNV2JYVWQrcE1Ra1BINnRiZ1hsSWpSL0JKcUVNdXVQdGNDVFk4?=
 =?utf-8?B?Q3lEeTFFL1VFU09SVTVZT1E1SE9mamE5UTNKd0ZreWNscytVMUprREJwR3hk?=
 =?utf-8?B?Nk4wb1VaaU93bjE2NTQ5WFpjWG5KU0wvdkNtSXhyc3dZN2xTY2h1SmMyQ3l1?=
 =?utf-8?B?OXZlTy9VNHlTZ3BXWXI4aU5iRnIxMFE2TmptQkJRUWo0TzFaZVZXcWQxNU03?=
 =?utf-8?B?RGhiZkdUZkhHMUZ4cDkybjJFYzdkcW01Mld0WUYvVU5YOEhaT2RnSkx6cmVp?=
 =?utf-8?B?dkRLUEd1NHc4ZUFvemtVY2xHNkpveWNBU2gwRk9YV2IrMjNab2ZUZ0xzNTdz?=
 =?utf-8?B?SDk2RW1KTXdYUE9nVEUxT3crcmIxOCsvOXpkRW9janJydE1NOWxqZkEwU0tu?=
 =?utf-8?B?UHJnQkEvVHdmdURUdDhHMDZsUXBOODFZY2pOUEw0eTBDdmdWcFZydzlpNGkx?=
 =?utf-8?B?L1l6Y3BNMkloQSsvOFlBb2k1MWwyOHB4NlF0UXRIRzZMSm0ybWJWdFh4aStt?=
 =?utf-8?B?ZCtrWDdxdGs2QStscnZCdFRVMER3dm52cGFxRnpzcFBZZVZLQTRHdTE4RGRU?=
 =?utf-8?B?RHh2L2p2dXJOY2ZzSk9udWdHaXdYc3ZqTUNacktFUmhvYVVhRWhLRCt0Tmd1?=
 =?utf-8?B?S29RY1daMmJVYXpMRmFjc3N3RzhrVWdTR2VDSXdXMXRWTzlHRnNXYXY3amo1?=
 =?utf-8?Q?f0njpybwj7Tuk49tjAC4RKuOjn9egklIOukLZ5N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1584a063-ca12-4813-f9ba-08d91b8b09f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 12:30:23.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDrVkTruokSL9KYxtYBFQsRxNzq9Me39syvq9qZ5Cxws2l5wdhrKbNJdK3LyAh6R5rOIFJs3a3Wj5bOa6YwmEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

Hello,

A couple of small fixes for PVH loading. The first one is likely not
very relevant, since PVH couldn't be booted anyway with the data in the
__xen_guest section, so it's mostly a cleanup.

Second patch fixes the checks for PVH loading, as in that case physical
addresses must always be used to perform the bound calculations.

Thanks, Roger.

Roger Pau Monne (2):
  libelf: don't attempt to parse __xen_guest for PVH
  libelf: improve PVH elfnote parsing

 tools/fuzz/libelf/libelf-fuzzer.c   |  3 +-
 tools/libs/guest/xg_dom_elfloader.c |  6 ++--
 tools/libs/guest/xg_dom_hvmloader.c |  2 +-
 xen/arch/x86/hvm/dom0_build.c       |  2 +-
 xen/arch/x86/pv/dom0_build.c        |  2 +-
 xen/common/libelf/libelf-dominfo.c  | 49 +++++++++++++++++------------
 xen/include/xen/libelf.h            |  2 +-
 7 files changed, 39 insertions(+), 27 deletions(-)

-- 
2.31.1


