Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5CB619A6A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 15:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437645.692076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqxvZ-0000QY-U2; Fri, 04 Nov 2022 14:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437645.692076; Fri, 04 Nov 2022 14:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqxvZ-0000N6-Qq; Fri, 04 Nov 2022 14:44:13 +0000
Received: by outflank-mailman (input) for mailman id 437645;
 Fri, 04 Nov 2022 14:44:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hilw=3E=citrix.com=prvs=300b5b1ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqxvY-0000N0-Bb
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 14:44:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22bd160f-5c4f-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 15:44:09 +0100 (CET)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 10:43:57 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6575.namprd03.prod.outlook.com (2603:10b6:510:b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.23; Fri, 4 Nov
 2022 14:43:52 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 14:43:52 +0000
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
X-Inumbo-ID: 22bd160f-5c4f-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667573049;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=QCR3buhtKy1tgHuvtA2sxL3L+l3cY5M3jgQOD2py88A=;
  b=E/ipuZkbI9ORR0WUV3tjQuE8wYFinB2BCJspfC360I8kJxZZeyepFtkB
   ZSMsOw4W0WhIoPvlfxjW/yUb22eFlqLTD71RNoLbHGdXR2M5ZSOOC98Wr
   1GVKueyXk/nFjy8JW9t7Jr7n3EOiZ3nXHlmrozaOBO5jsLfYy93bQIDG2
   s=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 83786073
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X/eNJKJ2kcw+PooAFE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENSgWMEx
 2oeXjqOPq6JY2D8fI1wPYnn/UpXvceBytRgTgFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRiPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pHEJp+
 sYaAgoqcwrTiO3umInqEMxV05FLwMnDZOvzu1lG5BSBUbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTGMkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL32b+RxXygMG4UPJG0pqRGgVCD/EwWGTMsfl6+md2yg3frDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBONB0mLicSHbY86jOqzq3YXQRNTVbOnNCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:tNHUm6G1NBPMqjSkpLqFB5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAvhHP9OkPAs1NKZMDUO11HYSL2KgbGD/9SCIVyCygci79
 YGT0EWMrSZYzlHZK7BkXOF+r0bsby6Gc6T9ITjJyAHd3AQV0gs1XYMNi+rVmlNACVWD5swE5
 SRouJBujqbYHwSKuC2HGMMUeTvr8DC0MuOW29xOzcXrC21yR+44r/zFBaVmj8YTjN02L8ntU
 zIiRbw6KmPu+yyjjXcy2jQxZJLn8aJ8Ko1OOW8zuwubhn8gAehY4psH5WEoTAOuemqrG0nld
 Hdyi1QTPhb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86I9Apv/MSTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uPp2Y4m+J7tQ0VbWInUs4ckWUjxjIbLH9ZdxiKprzPUd
 MeRP003cwmPG9zNBvizyhSKN/FZAVCIv7JeDlDhiWv6UkpoJlI9Tpl+CUhpAZ+yHtEcegj2w
 3lCNUbqFgcdL5iUYtNQME8fOCQNkvhBTrxDUP6GyWXKEhAAQOFl6LK
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208";a="83786073"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffUwnnoV64AnxV/txTOlINnlSfF/lvs8jv28FhQCW9egzp5w/tMsOrhLU7KRVD05Mo6o34t3y2Ys+qz6ZaB0cJxAwys2MdhI6ShW45x5nlC9Vz2PF+DDrSAWDPwbjL9UDQd18kyNaHcuxHP52BQ7fe4FownhkDVPBqSesNbLJJVV08hhUHxJkr3E7e03+IgRSF2d7ptcGHoA0i+T6MPwwpAgZBD8wEg0+J840Gq3ci6TqA8gY0W3C6TXLqiWP6hI6al7gGsCGxK0O58aXmNLo+xfgJNoEHJ000tpeLgpNLf2m7UDTfSzOnE4L4Hu9u3zNtbl34wqcHE+1ZfAoZBVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiTC3iBMMn5XknycOPDU2c+SpR5bWjbLEZclwPJqbxA=;
 b=WDmDvnAYomSoa/wqq1Ec0/4aCztlZ2qdj6/f4zj7MZ0kB0QLJaCyzTjSpK+Mf7QOg6rrf3oQXNy0dQSuEC/swB+TpTmhCSaNTQO9k6GjRNppXCXqascgzHFV+bQzO8e672/6stlONKjNttp2WPO+zMfXh/ShmA46A44yaaAy9sjx/wEMPc2SPKqKE5Ea8IQ+zyqOJzOMLDCn+bXrhTBofLeyFXy2fIVNY82nkvP2+VtpSVOWUOHMcazHI6OVMMYQ9IMRVdkNieHtwr322TtkNsvDN9PIwx8SWPRx4Nvi1gTmhu1k+jPZ0AgtzZtF4MwLl21Fy1ogwNvYF2qR/CzQMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiTC3iBMMn5XknycOPDU2c+SpR5bWjbLEZclwPJqbxA=;
 b=sIaiZDxNHUEkyJiT9vI1zagxSKhOKip3HdrA7WzIwS+h9UbM8CRxchcbDYMMQySBbkeWXvqaWVoUTJExy78FnxdzXJnroooe+stLSYU39eYFvJ9wJ2DJr67PMqYbNaoZ2igZw1ClrpiqoPAHQ4mxCaSZtcpKF81w1AZ81MoFyOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.17] Revert "x86/HVM: also dump stacks from show_execution_state()"
Date: Fri,  4 Nov 2022 15:43:37 +0100
Message-Id: <20221104144337.36844-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9b5f4b-a177-48ee-8023-08dabe72fdba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+EWxPaROtgRMlpkwJR0OQLpDjJJWrW9Gv3K1CHhwdawQxPil+cl7aylNkcj1rFA1pXCTw3Vo1cm+HNg5ikvCqfaDMQ7uuzXxjIHyEd0+jaht1H8ko24uMjQbY+y+t+nbhb+4XOkB2pxUxewi9GEebVWtgVJFq4RtyHD5JozP61BO/QCVeMQ+lyHu4AYQxCIl3WsPVy98vacAZntgZO+R/Tz5SBwtP4TXVUNdrAZ0HOkK9ClBWU9IWqEMQ3usAuNlke0A4VSJqZI3k1et5iZPN3c/yDiMJiw1zCpno9DFG4NSD5m7lRkYYYAbwnRKG7XKaUVIwbin+GoUTRPjOq2s/bI353DEDBR0KI9JixT+g+IKqDqvuczx3gL2kag0Ptvug8n8Bq1wYHzKCVA2xEol9lpJy4aQVkRnJ/LkOkS8ZArqxwP00FCFeNShceRlnP6Q9enivd37tfm0TqyQZ+AbqVCNQnBSRA2oLsWDiUv1xoQTzHvxEG2WMNahE5cUUozGJSnOqtxGFSyX+pXT3/Ar05cmJ7hjQgHFZXpexh5rY6NojWw/U79tmxG7CPtSXNvYdF+IaRMczlEiQio04UUKz/9zzl1uS3Hs7fC0iauUpsh+keydC/3zG+o81VrQITjRge5MMge79oKtxQW3WdQI8xkyr9bl5Sezkt3PZRYpRVQJJlrF3BlC94A15VPwq33HvdpZ/K8Ll/P/se+hN3xr5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(82960400001)(6506007)(38100700002)(66946007)(86362001)(26005)(6512007)(4326008)(8676002)(66476007)(66556008)(2906002)(83380400001)(8936002)(36756003)(41300700001)(186003)(1076003)(5660300002)(2616005)(478600001)(6666004)(107886003)(6486002)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2R3bG9ES2ZGREZoWmpkczhIQmxlNE1ueHFzSmh3UjVkckdxT2dXR3A3NXht?=
 =?utf-8?B?bDZKaFlxMWZRKzVBZ1RDSVVkUlpWMEVCaFNVbWtYaEVHTDlYbVBMeDNOa2pl?=
 =?utf-8?B?VnBXdFkzMmFvakhOQUNrRG1xT1Zpdm9nMUFxamlVT2NpU1lTZ2FIam1yc1Rt?=
 =?utf-8?B?bXdzajlPMzIzdHQrRDg2ZDhJM29ncnJrU2UydDBQR2xuaGZYK0dSWVVuYjQv?=
 =?utf-8?B?ZDR1dk5JdzMwakk5d3hGNlVFMXRlbWh6UDhucDluR1JUUU4yVzc2cEF2aldl?=
 =?utf-8?B?b0FML2tibWFrOXFBTnluZ0M1REJSSXA0UzF6bm8yS2l6Q3NJMElqNzdmazI4?=
 =?utf-8?B?aWJZZFgvUkpDMTl3aHBSc0R5OGJFTGZjNTdORndkclBKeENzWVFCd2wvOHBU?=
 =?utf-8?B?amQ5b0dabW9SR3gxT1o3WG9MSnVTREp2WmZpbFpGSS9KK3VlNmxEM2ZqcnEr?=
 =?utf-8?B?V3ZEb3poTXhZRjk4bkhTTndBaEdzck5yWFUwOVZRRGdTcjl3bUdOdnNJcjlp?=
 =?utf-8?B?ZHRMOXI4TklqQ0prV01uT3B3TUNaT1owUXZ1Ym5WNm5hd09FOGYyTENYdEtt?=
 =?utf-8?B?RU9DSWN6TTBNRmFFWnIvbTE3QjJLZ1U0SjZOenlnamRPMGt4Q3o5VjFqbEtX?=
 =?utf-8?B?eGd6K0pjN3d5R3hkWFBLYXBSZTFWUGtJYXljeG02MEROd2x1bWplR3JxMlRJ?=
 =?utf-8?B?bjhNQ0pOTEg5b1A4bG9FSTUybkZ4bWVTYjdtbEdkc2xTakN6eDJ6dW5vZW1G?=
 =?utf-8?B?VUtJbXdqUXFZeDU0b2tkRVp1RmxER2t2VUc1eUFLaXNwNUVNdUZWT2JXWjBs?=
 =?utf-8?B?YXAzYURhK2c1Y1pHakRpc08wN0dtWlhqbkwvOXVyY3lCa1NRQ2liWmJNU05h?=
 =?utf-8?B?Q2RGVWcyZFFPTE0rMis1T2pZVVNHdVJaNkZ2ZmxvdHpUakhXOHhwMXFPaC9y?=
 =?utf-8?B?ZnFJejdrYmc2SHdYeGRYdE9keEQwVG13WndZcGxKS2RCYk5wbVBiSnpEdmYr?=
 =?utf-8?B?dzlPeW4wOFo5S3JncDZzbEx0a0p5c3NqZnIzUUVENFR1cjlYM1kxbk9IWXZL?=
 =?utf-8?B?U2V6RDdKWWdDajhFTEQwMFFxY0ozZFZ2bkxZdnNTMGdhc2FUSHJlTHFQcTJn?=
 =?utf-8?B?L213WWxwcGNrVG1naG4rbEZHbzVEOENadUZ5YnptOFRSaDJYSGNKQWpVdTg0?=
 =?utf-8?B?MVQ0bWpHdDMyZGpmUjNEd3c0NGhtUndVakJNYVdrdFBzazZ1bnFoVGtJUUtQ?=
 =?utf-8?B?WU1tV0tYeGNQNkF5WDN2azQ4czBvc29lR1AxVzloUFRGMEF0Q0c5L2daakVl?=
 =?utf-8?B?dXMrMmpxUzByUWw0TWVqYjV1Z1ZVUlBQczdXaDk3cHNndUhNemJqUy9MbGpy?=
 =?utf-8?B?OHhoTEp1S25Ec1UwT0I0aU5aV05XbnRRTkVBMUYzMjlySVkwK1A2MEpiemtT?=
 =?utf-8?B?ZU1vS0FLNXZONW5lQzI2ZDdYL3dkZDJBQ3luTFRBMnY0QVRmTElsWDA0S3gv?=
 =?utf-8?B?eTZkVFQxLzlqVS9WTlFnY25FUUpTT3V6M1RRL29QMThKd0RJMGZRQzhnQTQz?=
 =?utf-8?B?VzR0Nm9NemQxSXlacnBqK0lkYjVxbkpkT21OTmNVY0NYN1dBaitob25WaGhI?=
 =?utf-8?B?VElCQy9qU2xUa0x4TlhKeUJITkNVNlZTVzA3SjRXZDJvMzdMRm1uTXprKzZX?=
 =?utf-8?B?c0t6ZmdBR1BIbnFidHArdWE4bjZEdS9TQ3F6NUFSTnVQYnRTbGJXV1VGaUJZ?=
 =?utf-8?B?ODVBL1FZQXhDMG5yalhkZFhMNzRtU0ZPeXk5VktoNnl4YzFKdEZYQ2pXSENO?=
 =?utf-8?B?Um1OQ3UwNVNYK1dBTnJxdjQxS0JaaCtKSm90SGRKVStySitZclQ4Tkljckwx?=
 =?utf-8?B?eVVSWEd3Y29hc0c2L0NDbmNtUmJCTUZBY0VJV0d2eVdldkg5TE1iMnRzQXVk?=
 =?utf-8?B?QldicDBTb1VGSzJVMlBhanZ2T1Q1VDdaUVdkTXpDa2hweS90SXlUT2VPWmNj?=
 =?utf-8?B?ZWh3eGcycGQxTHIwTDZXQXBPMU9OOEtOanlmV20xM3hPWXdUSm1MKys5RVZD?=
 =?utf-8?B?MGtKenNOVzhFWWcxaS94dGV5MkFSNUNWTGZIS0NYWm4rS3ZuT0xmT2xaMXgy?=
 =?utf-8?B?WjhqVUJLMWYrbFFqR1JKWDFNSlpGREU5d2o2Y3FzcWkxZEg0QWVIQXdmUFZP?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9b5f4b-a177-48ee-8023-08dabe72fdba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 14:43:52.1253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZc46r5hqCCDJp24IvtNKDAJ2fjuK0rIkx/u0HCxD7ddT2XwhKY3RtwVbk9ObiNv79SdhBagJrOseE5NPLBa5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6575

This reverts commit adb715db698bc8ec3b88c24eb88b21e9da5b6c07.

The dumping of stacks for HVM guests is problematic, since it requires
taking the p2m lock in order to walk the guest page tables and the
p2m.

The suggested solution to the issue is to introduce and use a lockless
p2m walker, that relies on being executed with interrupts disabled in
order to prevent any p2m pages from being freed while doing the
walk.

Note that modifications of p2m entries are already done atomically in
order to prevent the hardware walker from seeing partially updated
values.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/traps.c                 | 35 ++++++++--------------------
 2 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8e2816fae9..4cdafe2c4d 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -493,6 +493,7 @@ static always_inline void rep_nop(void)
 #define cpu_relax() rep_nop()
 
 void show_code(const struct cpu_user_regs *regs);
+void show_stack(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
 void show_execution_state(const struct cpu_user_regs *regs);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 5c0aabe8a3..c1e5ef1cc4 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -278,6 +278,10 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
     unsigned long mask = STACK_SIZE;
     void *stack_page = NULL;
 
+    /* Avoid HVM as we don't know what the stack looks like. */
+    if ( is_hvm_vcpu(v) )
+        return;
+
     if ( is_pv_32bit_vcpu(v) )
     {
         compat_show_guest_stack(v, regs, debug_stack_lines);
@@ -586,11 +590,14 @@ static void show_trace(const struct cpu_user_regs *regs)
     printk("\n");
 }
 
-static void show_stack(const struct cpu_user_regs *regs)
+void show_stack(const struct cpu_user_regs *regs)
 {
     unsigned long *stack = ESP_BEFORE_EXCEPTION(regs), *stack_bottom, addr;
     int i;
 
+    if ( guest_mode(regs) )
+        return show_guest_stack(current, regs);
+
     printk("Xen stack trace from "__OP"sp=%p:\n  ", stack);
 
     stack_bottom = _p(get_stack_dump_bottom(regs->rsp));
@@ -655,30 +662,8 @@ void show_execution_state(const struct cpu_user_regs *regs)
     unsigned long flags = console_lock_recursive_irqsave();
 
     show_registers(regs);
-
-    if ( guest_mode(regs) )
-    {
-        struct vcpu *curr = current;
-
-        if ( is_hvm_vcpu(curr) )
-        {
-            /*
-             * Stop interleaving prevention: The necessary P2M lookups
-             * involve locking, which has to occur with IRQs enabled.
-             */
-            console_unlock_recursive_irqrestore(flags);
-
-            show_hvm_stack(curr, regs);
-            return;
-        }
-
-        show_guest_stack(curr, regs);
-    }
-    else
-    {
-        show_code(regs);
-        show_stack(regs);
-    }
+    show_code(regs);
+    show_stack(regs);
 
     console_unlock_recursive_irqrestore(flags);
 }
-- 
2.37.3


