Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DCE365AD6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113739.216736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr3c-0000bB-DK; Tue, 20 Apr 2021 14:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113739.216736; Tue, 20 Apr 2021 14:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr3c-0000ap-AC; Tue, 20 Apr 2021 14:08:52 +0000
Received: by outflank-mailman (input) for mailman id 113739;
 Tue, 20 Apr 2021 14:08:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr3a-0000ak-Ds
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:08:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f28441d3-8d1f-4263-92d5-b3a335a6ba93;
 Tue, 20 Apr 2021 14:08:49 +0000 (UTC)
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
X-Inumbo-ID: f28441d3-8d1f-4263-92d5-b3a335a6ba93
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927729;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=J2ZZh5ox4gg5XoXoJ+K0j409xeO+sNExc6Owhf0rAw8=;
  b=WzL9D7CZzUi/mHgyohz5pcJ/whvsaCSslMa/AqwDzDopS5Fiza3nTuxx
   5GFCqE4yzPZyYrrcRbKHz2/Q0y3evO2KjnQpVdAPD75TOMUWPCTSy+UDP
   y+9uIvNu9ARdadwrlq4Igp2JF6vUHZ0KJ6OWIZHKhesJeHW4rUDG0XEvY
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: K2T9K8F8cEa6HWoi6mCjj3UGvwMpPSZr/0Qp96odeh1MbcL3VifGlwZI3bB9O9y0lvV7/04uVl
 epFV7aO0X8RBd+XK8MyUJOao4FN8g/10j8VapIaYXhXz1CtmcbcknbyQLNsM1CrMxLXfGtW/OR
 MW4ZBIX9jClyg6N3FQN+nPO4JY/45xLcH1aWKvDInZr4OAodgh/MpII93NKXoNT85igetrhmO3
 KGdTA/LFSLVgHcF9hkdiXNkIJiDo7Km6GC6Vv97VcvoAYzlUQDykUGl2VTWs9804ib3BjaBMAo
 nhE=
X-SBRS: 5.2
X-MesageID: 43472836
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/4pBxa6gP7QOfTZllwPXwRKBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3Xa6JJz/M0tLa6vNTOW3VeAAaNDyc/ZwzPmEzDj7eI178
 1dWoV3FdGYNzdHpOng5g3QKbgd6f2m1IztuuvE1XdqSmhRGsNdxiN0EBySHEEzZCQuP/oEPa
 GR7MZGuDasEE5/BqiGL0IIQvTZoJnznI/mCCRsOzcc9AKMgTm0gYSKcCSw4xF2aVJy6IZny0
 fpuUjT5qKvs/a0oyWsrVP73tBtt/bKjvdGDMyIoMAJJjvrkRbAXvUdZ5Sy+AobjcvqxFE2kM
 TdgxpIBbUO11rhOlubjDGo+w783C0g43XvoGXo/kfLkIjCax8RT+9i7LgpFifx2g4bk/xXlJ
 9v5Sa/saFaCBvR9R6Nn+TgZlVRuWef5UY5nfV7tQ05baIuLIV/gKY4501vHJIJDEvBmfsaOd
 grNs3a6fpMGGnqCUzxjy1qyNyoaHw5Ag2LdEgEotCUyDhbhhlCvjIl+PA=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="43472836"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n14RFeUvxFSsSrphFcQzMx6gpW6tpStheCYzPvUCEFlOJIZ+o41qn3+ayXXmTHRVDgTlL5fjrRUTJKZYNbyZhOQHOKleW/e08mNCfC8bbFd7IKW9dWkyUD9KhMlY/MXG9w5dQvaEgPnc/BogwJlXKVJl1fcztVmUnxOF+18VBDuhvmL6qD/oBlXBfQ+p3OaUcoVj8ndwPymADsi4KS43lAiTnGxbbnUMQRk8alQA5xxYbcHNmUD6OZa1b5GLHK3J5dGXU8t9dm0+5vO02O3DneAykwSKudXpsZjB7ZoyC37SAQVTUWJawE0e3vbgS1cndHYSeSZUDUGBIIMdpKtZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFnIPLZp4CjpVGUwuH9aTepqLh3vMemrkEdRAigo64s=;
 b=RXJSXdr2uwam5W1W3HLCXeYv55OgpS1E4b5DlhDtxM1xifz5DYuWyTGTO4jg3snC5EeFxKHAR3l65XejUX7VLCIgg/f56eHjzTjDlOZsjCLTjOCxb4b5NynHv1pt1MwPc22SuJaKuExipW2uIg536fj3nZhs7zarEsnSVs4jmUkKFFaFBzqEPFDsURWQF+jzb5pGBiycrRIT9FmCx3K4NFaQISvPmHbXHp98vtob5ab12vM1VR9hdI8KbR8cN8PdmbiHTdZvoIoNWkcSvzKA/3OQOFNsLIOk6YDwP7XzmnFN3Gcdce1JrUBc96YwF1DGB0dKOEwW1zWS/p9uAizy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFnIPLZp4CjpVGUwuH9aTepqLh3vMemrkEdRAigo64s=;
 b=fNPZNXcbGj6E58aF4oTa49fJ//xy4Vr8oUQBedMIrJEVY7CrwhmcLuuZo93pJMUsaIEEh+WI/S5E9kXZ7kULhUC4VWcvGlXvQHMxRNDGTRZa8KulW2h+jO2SsjGcadODp/fhuk1QsnPQVa4Qdiw+B/RpPjVLXbk5AT76pvz3/MM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v4 00/12] x86/intr: introduce EOI callbacks and fix vPT
Date: Tue, 20 Apr 2021 16:07:11 +0200
Message-ID: <20210420140723.65321-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8848b4e6-15b5-4596-c380-08d90405cf79
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3068C63AA380402A1826D3908F489@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/6ZWAGkxTdb1iA1dQV6QL8Kify3S43mn17YRroNNMSTeVrWMsd7LM6BoDjzBh6L9ukQn1VwXOQwbLqkxhMxudrWFTuW9WEHnAwBjPdbODopWF+UAPA+JEvBSl79iEwIh4NQlNehIVZeNpPUj6s9gB/oytGytDKglj3Up0EaYDPp6PAuhSSQhGLMe3/OPWaoRj0f62w8fLe3+Mb93jCPa7xyMeaJTXOv6wTLQMq2OcrP9ZhEko8dd3dB7Wf/IZSv8eyXZDL0nRK78K/zr9QGIDVCFfUzhuS1ZuKv3EM7hkNhTrjCIbaQUIhVlsjmg+j5zPD9yrgICt0aZE58ZGhEeLt6riSEFUfySkFyh2V/fgpJCC4ZRC18qb5pZeSXfeW4uSdmOzSYp94ryrxYjbUhR1f+2Npb3rgOS3rPoqqIr5e4VXFcrN9ljIBavSKpzyFb3w1ROkZ+87uQUw4CffMM+uXNSQfzbbHHtmseRYWN7sTZzyhkiu6J8Doo5KujvcMwLCwn2d/wFXmkMp8vjLKIuwojRr8VVmzd8h4ye2cfBShAQzsah6iB28kwDD9Dp1AjqsDOXD/J6WXW4lelRg07MXc6cJvd721boXDSOPaSFzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(54906003)(316002)(2906002)(6486002)(956004)(1076003)(38100700002)(36756003)(2616005)(16526019)(5660300002)(6496006)(83380400001)(4326008)(8676002)(26005)(66556008)(66946007)(66476007)(186003)(8936002)(86362001)(6666004)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0tEVXFXQ0IvYTRLR29xeHN0bkhSdStPdEU0TjdBN3hRSlIxVndBUE4zOW4y?=
 =?utf-8?B?enpQSnZZZElGLzA0K1BLcGVSYkZMT0E3dUJBNmhJRFRBbGxCbFYvQjhCV3Q0?=
 =?utf-8?B?cWpxbUhPWTNsLy9tVGsyNGlqaEdhSkI4VTcvZXRTTXRVYWZkQm9BV3d1TDVi?=
 =?utf-8?B?NUFSdTkxcUx0cnU3elBFOElkRnJaM1g4a2cxQm1vVUQ2MFl2SWVBVGJYUktx?=
 =?utf-8?B?cS9QeStmYlZKVkJ2Sjljam5hWUI0dy90SkJmOVQ2ZjBuT3BkOURyek5qYWRJ?=
 =?utf-8?B?anlXK0ZUbzkyZ1pKQTJmTk16NHZNUnFjUGltakFWbnBneTVGQXZzWEl2blVH?=
 =?utf-8?B?aDlFYkNacUo4dFpHbjhyWWc2bWJuaXlrcHRTbU5MUGZNdzhHUDhsUFFjdU5D?=
 =?utf-8?B?dUNjRnRIUi90K2hWekUxckN1TzJad0VwQ3VzWmgvbG4yTmFxTnZQZkZCaDUy?=
 =?utf-8?B?WitPNUNIY1NTZ3Eyd0h0azBkZXRkbFpUdExLTEwxK0l2a1NuclhYM1ZtYzJI?=
 =?utf-8?B?eVFxUnBJRWwxVXBSeTJWT1BUTU1aRVFGdzlXeVRuTHFmempmTlJXT1VEeGxH?=
 =?utf-8?B?T1BhdDFtQnVqU3FoMzBpOGxCUXp1RVEvWWhPd0dHRzNMR3NoWGhoajBFaUgw?=
 =?utf-8?B?WmN5U0ZFcC9TRjNyc21VWlNqMTZFVldFOFd2dGRkU0F6QmxTdTVqYWVQRWcz?=
 =?utf-8?B?b3JUWHdEaU8xZW1QVnJtUzZwdUJua2pQN1hEZVNEVXZMQWJzYi9IazZhZk9h?=
 =?utf-8?B?ZHJTb1hGWC9kL2RYVWN6V0FiczZSU2RmZkh0TENvU0lDY2pISXB2UTBvelhB?=
 =?utf-8?B?R011N3kyRzFiL3ZlUVYrL2FRV2NUU1dydklzQ2U5VkR1RzAwZExqRDRhRldJ?=
 =?utf-8?B?MjhEbXIzV0Z3VEg2VjkvVmxPVFJWUmp6WDBSQWVGWXdrbHp0eElTUFkrYlpT?=
 =?utf-8?B?Q3U0dHF0dFlmV0lqMXBYT0tOajd3MTlUbktvdjhBNDB1RWdSdTBrMllobVpJ?=
 =?utf-8?B?cERTK2RHOTVFY3lldWt3SUdodHM0ck1aVzhESDl5TktZbzZtcnpRWDF1MU5G?=
 =?utf-8?B?bWVHKzFTdHRta3p0Nm5QVUdYUitJcys1QlpRam05Z3FzaDVCVXBobEV3N2Ir?=
 =?utf-8?B?MFBFTUptWENSNGJPQ0hyc1RrNjJYc3NtcUF1SzVoaGtxSTFCSlZEWE5Lc3FS?=
 =?utf-8?B?WTJjdWs2N2tmVDlNekRXMWxwVmFNeWdEZTdtNnVhVHRycjRWbngxN0h1a1gx?=
 =?utf-8?B?eUhLdFBjWGhUcDlNcXhuWExEYzFSdHcyWnFRTkppK3hEQnhwL0M4UHVDenJD?=
 =?utf-8?B?enB6Nklqanc1YnFaSUxXN0hPRWViemUyeng4OGtKMFZhaFBCckZiaHVZWmtE?=
 =?utf-8?B?dXVEWmZ6TVBmMGpCbHBvanVxQlNVZTZybTZ1SERLbDJPc0J4eDYyYWFFcDhB?=
 =?utf-8?B?dFVJc2t1UDNzd2FZNkpmTXJIZ3pzY0tTTDA2ajEwOVZlVEtoVUZaYTE5cjR0?=
 =?utf-8?B?eGJJbUJ0cldlbExmRDdXZlcrTk8xUy9rc0lFYjFXQmNuZ3oxYjJwUmNldHNU?=
 =?utf-8?B?SlJvVGdsRWV1SzRFWmxDS3BRZUgwZXU0UnIxbUhUOFhWTmZEVWsyM3Y1M0to?=
 =?utf-8?B?bG54cW1KQXRCMkFLR09welpvakZXdXZMSWx4K2p3TldkMExEM1lQK05zOVhS?=
 =?utf-8?B?STF4VHFPcFZ0dVFkK2JIU0E3K3J2ZmE1ZWtqUTR1a2VSUXdBdWRUWTV1L09z?=
 =?utf-8?Q?wAcNN5f0YjmiWsc5hjxh+PzJqSA+qJEilO1Lu4h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8848b4e6-15b5-4596-c380-08d90405cf79
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:08:45.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkjiDyJIkWr6C/6qRurhiDrYov26F7uXI3oLXXTkWy4IYKFCzElTc0nobC+fSsD6Rq26TeFwuH5U2DVL3bcm+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

Hello,

The following series introduces EOI callbacks and switches a number of
subsystems to use them. The first one is vmsi and dpci, which are quite
straight forward to switch since they used to open code hooks in the EOI
handlers.

Finally HVM virtual timers are also switched to a different model where
EOI callbacks are used instead of checking at every return to guest
whether a timer interrupt is being injected. Note that such change also
fixes a bug in virtual periodic timers that prevented injecting to a vCPU
different than the one where the timer is assigned (and that would
currently match the i8259 target).

Those changes are paired together so that practical applications of
having EOI callbacks can be seen in action.

Note that further cleanup can be done, but I think the series is already
big enough and provides a clear benefit.

A couple of notes from the testing performed:
 - PVH dom0.
 - Windows guest, limited to 2% capacity to test delay for missed ticks
   mode - time is consistent in the guest.
 - Windows guest migration.
 - PCI passthrough to a guest.

Thanks, Roger.

Roger Pau Monne (12):
  x86/rtc: drop code related to strict mode
  x86/vlapic: introduce an EOI callback mechanism
  x86/vmsi: use the newly introduced EOI callbacks
  x86/vioapic: switch to use the EOI callback mechanism
  x86/hvm: allowing registering EOI callbacks for GSIs
  x86/dpci: move code
  x86/dpci: switch to use a GSI EOI callback
  x86/vpt: switch interrupt injection model
  x86/irq: remove unused parameter from hvm_isa_irq_assert
  x86/irq: drop return value from hvm_ioapic_assert
  x86/vpt: remove vPT timers per-vCPU lists
  x86/vpt: introduce a per-vPT lock

 xen/arch/x86/domain.c             |   4 +-
 xen/arch/x86/emul-i8254.c         |   1 +
 xen/arch/x86/hvm/dm.c             |   2 +-
 xen/arch/x86/hvm/hpet.c           |   8 +-
 xen/arch/x86/hvm/hvm.c            |  23 +-
 xen/arch/x86/hvm/irq.c            |  93 +++++-
 xen/arch/x86/hvm/pmtimer.c        |   2 +-
 xen/arch/x86/hvm/rtc.c            |  30 +-
 xen/arch/x86/hvm/svm/intr.c       |   3 -
 xen/arch/x86/hvm/vioapic.c        | 144 ++++++---
 xen/arch/x86/hvm/vlapic.c         |  72 ++++-
 xen/arch/x86/hvm/vmsi.c           |  35 +-
 xen/arch/x86/hvm/vmx/intr.c       |  59 ----
 xen/arch/x86/hvm/vpic.c           |   8 +-
 xen/arch/x86/hvm/vpt.c            | 514 +++++++++---------------------
 xen/drivers/passthrough/x86/hvm.c | 223 ++++++++-----
 xen/include/asm-x86/hvm/io.h      |   3 +-
 xen/include/asm-x86/hvm/irq.h     |  28 +-
 xen/include/asm-x86/hvm/vcpu.h    |   4 -
 xen/include/asm-x86/hvm/vlapic.h  |  19 +-
 xen/include/asm-x86/hvm/vpt.h     |  32 +-
 21 files changed, 630 insertions(+), 677 deletions(-)

-- 
2.30.1


