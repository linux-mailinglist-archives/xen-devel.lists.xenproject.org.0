Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B427A1704
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602906.939725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2zz-0001SR-W0; Fri, 15 Sep 2023 07:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602906.939725; Fri, 15 Sep 2023 07:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2zz-0001Pd-SQ; Fri, 15 Sep 2023 07:12:19 +0000
Received: by outflank-mailman (input) for mailman id 602906;
 Fri, 15 Sep 2023 07:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x70d=E7=citrix.com=prvs=6154552af=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qh2zy-0001PX-GR
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:12:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 324e2a54-5397-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 09:12:16 +0200 (CEST)
Received: from mail-sn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2023 03:11:59 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN9PR03MB6156.namprd03.prod.outlook.com (2603:10b6:408:101::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 07:11:57 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 07:11:57 +0000
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
X-Inumbo-ID: 324e2a54-5397-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694761936;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7ozf+eVI8ZZWyTDF8qubN7845ed21BO7NSYAFZ8C7Yc=;
  b=NOuRvoR/2naQu15/NvqxVN2ZY15lqVP9hYmZ0YRoRRd/aT033MHUqMei
   ACVIcr+ZvhIviwZdM9avsFuyKThp3nv0KNedwuz1PCdCodtfvtyxKqUDW
   5mNanJFzs9tywWMglRmV+u4M+N02ZnLxJF3s4R/MGfxIBKWw5TeBGrDEk
   s=;
X-CSE-ConnectionGUID: tOxNJSBKT3Kir8+MFZFZfg==
X-CSE-MsgGUID: IyClZKXiT3+fhUTuDJVX5g==
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 122748076
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:I4kLqaKKKPRaSI3oFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENS1zAFx
 2UaC2qCOf6CYTDyeY91O4XkpEtUupLWyd5hQANlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wVjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5rJnFo1
 8cyCwxWTRGZ16GT7oCVeOdj05FLwMnDZOvzu1lG5BSBV7MdZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTSDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj22bOfxXylMG4UPJyp3fpYo22S+jdQBh0raUaXg8eJ10HrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+pQSiaPCEUKSoZY3YCRA5dud37+tlv3lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRONfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:Rn/cRa9s7OYeLxWJQoduk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdkTN9VLXJOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6Q60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdl11bSjXujxVfzq83wQzw3T+JHmIJiaxPcr24tpst13q
 5n13+Q88M/N2KKoA3No/zzEz16nEu9pnQv1cYVknxkSIMbLJtct5YW8k95GIoJWAj69IckOu
 9zC9y03ocfTXqqK1Ti+kV/yt2lWXo+Wj+AX0g5o8SQlwNbmXhopnFosPA3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMoXda3Inale2OMDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJjs3IocU6GM7zB4HRyyGGPfIyBZ0Wu9ikHjKIJ/4EUBYCbfhFrcWpe0/dJ+J4kc4nms/
 XaAuMiPxasFxqoJW9z5XyPZ3BjEwhhbCQrgKdLZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-Talos-CUID: 9a23:jtPwBW097Hlz7q3bSthkYbxfBuc1VF/m5lTseGy5EzYqbZOnZ22e9/Yx
X-Talos-MUID: 9a23:Kx+s+wTCohr0nq0NRXTNlRpmBuRY4pj1S04NrKkbl+u6BXF/bmI=
X-IronPort-AV: E=Sophos;i="6.02,148,1688443200"; 
   d="scan'208";a="122748076"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq7W6OjSv2+GFWZ4OsVoa2NBKJ9aQNhWYz/7Lml+z7WIMrQGLaRdNFkSufFyhOou3kFInZqeF3DTkEDdlpHXEDeuBWlJBAu2zopZPbewRD+5o1JdD3lnInN7E4Xurt31nHNzqvFUrV0GDKv7EdZ+740jz1pVLndbA/G+YsKtx+5YQ7rkFgOlcorPw58yj5Kdtk5zGkag4tKe4sFN6yTLuhcLD9ZT36PaFRGd4XcAf7Jh+RvSBfVCkzv/M5y0LkegIpRVwx7rxhfNkpoA1FwlIhD/365oetLzziHmyZrPtAnjxzcNhQvk4l1tbyBxG5exhm2vYw2ZQOHAwJVV5Rw7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAovjH54jEtDgouGRaoL423oBZxIOk8/pI0kpBorQEw=;
 b=n5H9rF+CUI/MXG8ZxAMw3bNF1MqD13a4MkUmyfXfdRd0mHjnpbm9KRGnc6lK6IFyN3DllUyB9Mzgf+XGGIPw9kL2EalfIgbIW26R6lIKPmbklgy7mR3jdbM2REYIUhI2ic67+UDR6z+uYsygAbpCEc6HoQ4jag5yVpSI0ExRTsfPb00+jiP4HNJOw85gBgjsqkCZ72hzabs4GXYLE120HbKHrQ8I0LeYf15VJsO3UzfBz1/li5qX3uQvqGeA80/YSOd/IZQ57YFPfjpRoZRa+W3TGYque9eQZmyWUKp83JVc7GuVv/AoRZLqpykmAamIh1YhMxZJHFelRnqpjbAzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAovjH54jEtDgouGRaoL423oBZxIOk8/pI0kpBorQEw=;
 b=VeC7j4uh+NDWHYmcgXy8QyDPNiYHB3DNYoa2vH3Z4ykieR1m+MDKSZaKWCkpKn0Pz1YKXy4LP9I/257YKE2bhNOv7nwmbmyIxFTFgAklE8LuGOt84VPWPnPNjqN55rd2B49si7H9HmaW6k3Rbws+MaaJXbNZOJu9KuRSLQByrXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 15 Sep 2023 09:11:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/shutdown: change default reboot method preference
Message-ID: <ZQQDthWFElFEOhZ_@MacBook-MacBook-Pro-de-Roger.local>
References: <20230914152120.92696-1-roger.pau@citrix.com>
 <2d767f96-9f20-e786-9148-cae5c30a41fd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d767f96-9f20-e786-9148-cae5c30a41fd@citrix.com>
X-ClientProxiedBy: LO4P123CA0298.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN9PR03MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 344120fa-fc98-47a8-ef70-08dbb5bb0c08
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WHBzjjLlDpu6sAni7RLhN4TMPsHg+2DTpJTvP3ntbfTgkDzwgxYuAmqV+1evQUJjOpvd5PEq3ZRAZLXMBtVvgwgZh5i1bcqLBGQLstcv/wr5pKkbm9xU4PYtbA/IP4nphYwvv6K3xYQRityY1odNiWM0L3ltDaUpOdk/CYN77B3U2ew2FLkRe7u895VHgWi0ydOYEWjhWX2cb5uHta8M6WTtQ54IlfH7s8A76IGtbIAwf3fNFWr9o9niL3kmzpXVHbuMlcfYncHYmXkT+tM8QoAPZvaDFbW0cjngbItVGFl+jAmw/ZCAJFMr/qUZERIAv7tBRirtLGgT6DaO7hAGZbWuAUvEwVW9OhsiI+576f15QV6y58tEGuWLGX/zfGtTPP1V0D2NCQCG0wJx/DzAu36B3tNtDz0zGFvcQzx+BQBevtwQWPsxliBmdWt4M/GOYnL55anfSM+QY+ZDOybSyF0Dr6BhA54a4eLg1Kx90mKBLMqa9zcCtmEkRwvVjZcg+mfdS/WyMD43lDsckyCxHjAkSJerVufmX3PmCmkl7qmNiWyZeDlovTp2PpFFxpj9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(186009)(451199024)(1800799009)(86362001)(38100700002)(82960400001)(85182001)(6636002)(478600001)(66476007)(316002)(66556008)(54906003)(66946007)(2906002)(53546011)(9686003)(6512007)(8676002)(5660300002)(6666004)(6862004)(8936002)(4326008)(6506007)(41300700001)(6486002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejBKQ2ZsTHNhdytKTnBMa1BvakZtNTdPR3RpUVpJa20zT1F5NERnbmVrL0NT?=
 =?utf-8?B?SkZvS25udEJNNXhZWDgwWEI4SGJGek5uSzI2YVNPSi9tVisrdzhrS0dPMXZ6?=
 =?utf-8?B?ZEU2d3I2L0FuN3NyTERXSmQvdXFFbzlPekFUaHRsc2FpKzJJQ0p1TkhCMGRj?=
 =?utf-8?B?WGM4R0F4OEN6T0RaMWYxMmkzbC82K2RjKzhxMnZCdVZSQmoxYVFibjJ0SnFl?=
 =?utf-8?B?NzVNQ2puQkJsT0NqN04zRHFRQitOYmQya1JFVWx1UklBakl5TGdsZDZJSzdx?=
 =?utf-8?B?V2JkaWk2d2N2aWhzdkd0N20xT05pdGs1UFlLTkJ4MEE3TGhvTGtVZ2tXV3hw?=
 =?utf-8?B?UG5VM0Uwb2hhYUVMaHp0SC9WL2ZuTHowVFZuREhLSm5WTUF1K3Zwdkl1Z0Z3?=
 =?utf-8?B?WmtOTlFTQldlTDVxbmRSMHhpZWNYdmxyalVSeW91TGJ2aFhkVjExNEdmWWh4?=
 =?utf-8?B?Y290THVMWlhIWjBuL3ZTTXhINkM2bG9DR3pGNDNDbkhPR25kK0xHTlBhVlMy?=
 =?utf-8?B?M0FrYUlGNWE3Uk5MTUJLTGd3WVhheUl0RE5NYzE0emNpcTJ0R2hQSTNUand6?=
 =?utf-8?B?KzdMMHJqcFRqWUZDRm5DdGkyZUVhRm9sOG9NSVFnWXVnTXlmTUNRWnhXNm8z?=
 =?utf-8?B?eEJ3S0ZBZW1FaTdhTC9jSHVDdEZaMGdWVXdoV3JnSkYwL2x6ZXJpMkwrUm4y?=
 =?utf-8?B?Z1U1WHNFQjZlVG9TandPOGVST3hFcXBWeUJYRldGeXE5ZmZTZW1UM2toNlU4?=
 =?utf-8?B?WXh6ZzJjdU9RcktHanRTVVIvQVloNGE3R3VtbkJBMnpYKzBpdTZVTkNYSEJS?=
 =?utf-8?B?VzY4UUw5WGtKVWNmYnFxUlVvZXFtWk9sTTIyZ2Y5cmgvWTE1S0I1Ly9XQjkw?=
 =?utf-8?B?SUVnK2NtOU5nUjVpUlQ0c2FydFNXUFFkb0U1WEp3Nkx6ZzQrclJKR2NRc2xy?=
 =?utf-8?B?M3pnc2Izd29mTzFBSmg1M0ZUeVI5VVQya29ML2dsTkNRdWZzVHB0VldRTVNr?=
 =?utf-8?B?VEtoU2xmWE4vSm4zRkd1RWEwYUxpSS9NMVR0azJ4TGM4cnhZRTE4Wnc0N0pa?=
 =?utf-8?B?aktvV2wrVUdDcHd0YkIzZnRkT2M4eEViK1N6NjhOcjJSNkc1Q1VvN1FvVEdu?=
 =?utf-8?B?ektzbnROUVlhV1RSekxzT2RBTjZlVkpLbnBQUENuMEVBNmpFYkJ2WnFaa1Iv?=
 =?utf-8?B?OGNwK0NyY2VTcWpuUmQrbUdibytscVRmUHVVTTRrSGdSM3dJNkRHeXkrRnE2?=
 =?utf-8?B?ODZOelJyUFVWcUt0NTNnbWlaY0UzTmF2dGxvVG5HdEZwRTFCVVBEdGdiZ1dz?=
 =?utf-8?B?RUdkTHhKQjNyNlU4UnAzOFFYYkg0T0RPVUl2SGdpQ0F5ditjVXZXSWtqRU9n?=
 =?utf-8?B?NEdpbDJuQ0h4ZjVaVGlBWGxBa21pTEdFdFh5ZkVzVHZUWDRwNmRnMDNiUURN?=
 =?utf-8?B?NkVaM3hWZDkwMnVOSjlaQithNks0Rk1OQWpCRjdBY0RqNnVGd3lwZkNXZEw1?=
 =?utf-8?B?cE03KzE0LzN3ZEtNaFVtWGY3c3dkN1VlOEx2UkZPcTVpc3YwTFBhTUFEcmsx?=
 =?utf-8?B?QlZsWlJPalliY0tDQTIweFJqWEJWZDZXUFBBT3lSSHYzRVhTU3Nia0VkajRn?=
 =?utf-8?B?NndKdGdIQW96WWV2NnhSckpwcVVZV3A5ZkdQVU1ZeGw3U1VWYWVCSWZiZ1U4?=
 =?utf-8?B?amFPSi9RM2czb3JXUW4yZUlwVTBtV2JtdzJpSFZvQTZMWEtlem1JOTFhYUJH?=
 =?utf-8?B?NTRtUTE0TWpHbmQvSmtsWldxdysycmpjOTBrQWowVExvYmlRakEvQUp6d3Vu?=
 =?utf-8?B?OTJ0a0wwZ1ZvQkI3V0djVUMxS2tRQTJHam1xandHdXRQM0VudjMvK0tnakty?=
 =?utf-8?B?ZDFVVVlLZDFBb1dSSHJZcmYwbFdwVy9vTG5mUWlHVDROYkZNd0hIVVdycGZ6?=
 =?utf-8?B?aWtOd0VTVnRBc3llTzYxdHZpbG5oTFp6UE4zZWJBbktEOGJ1Y1A1SUx2ekhh?=
 =?utf-8?B?M255RHc2amt1dnByK1IxV3phai9FRVhGand0eFY2ektmRklBOFZ6ZStXVXlU?=
 =?utf-8?B?RUQ3TWNlbXczcUtidGFEcElSWlRtZnhYSDlLVitNYXI1aCswdi9BUGJLQWJy?=
 =?utf-8?Q?qHR0o+lGYfqdaiT/hzSB44zEo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oObconsRRohDJfrlOvWWIFEM+1TFx7pKaA1X7OFK7GYCb0bwXXHXqEV17nvLki0JDrKbMoH6C+JSpNflxhV9OxED8bmb1oeKOxIb3mniH1tkxucUpYmop9y6GY3khpIHxj5lFP/k+gnXUHRlV1gKcH6PLv+Pp2lrWLzNoJnGGZrwjOOu9UPJK/Z9uQ7IdRMDEJpNERRYmz00KYAQrQyqhAHag6e5Ka8rx+XeX0BNty5vto4HeB/ga4BiHQ12B3rPLGI0KfBW/mAVG48pMhJKYW1BiNw0BZb1iwAq/dLXblBr5HAvyyLmo1YloNX8RqZclHhEv7FiT53fQnsNBGxEhO2RBbCXqHbvbvU+VYprC0FW00YT0+9W7LIaYkFU/Lxj/d0Azy63gmVvFYS1bt4h5lS8lg3BF20qXSWJUiIr2LlVZP8nd9PoaHyUwzsZ5x2ic7xDH1Bpe4MW024+wHm9odIgzXZ727hywFbpiEOn2+HmjYaEjhAdKAlBsChXlfGDylsa+YyV6vLzx8AG7chIzZYXG5n/6myOaBSwJXILCLNkrPyCFcPIoeo7jt0HrE0I9Mtip6eZg5x0Xdatlw+3jVGEOlaN4+LA4cjGgRdwkwZiRCuvE/+DppHOM0ShQZbrZCi/VD6gMDi+SxqyDeAifHf+InQ7dCBLuyUDa/q0fuQFhyH8G5VxxhIO2zENNPtxdXTqKbwOIHBk6l7F2TtXd0VViWNKtJZToPQ6aBWtj+GgnfPNjt18vLUjjp5KwyGN++BxwZ5/a0V/R+RgU23m1qMmGbhRh4rnLbFxoLF3mifp00UvZdNsx85zE4hSSly8
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344120fa-fc98-47a8-ef70-08dbb5bb0c08
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:11:57.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx3o8IxpaGLMuNQNk9hu4k2Qn81gNvFJI/md78Wuqi7YSXT+Bbz/BAOM/Wkv7znSZ+KhlKNQsi6acnD4BG6EfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6156

On Thu, Sep 14, 2023 at 06:42:03PM +0100, Andrew Cooper wrote:
> On 14/09/2023 4:21 pm, Roger Pau Monne wrote:
> > The current logic to chose the preferred reboot method is based on the mode Xen
> > has been booted into, so if the box is booted from UEFI, the preferred reboot
> > method will be to use the ResetSystem() run time service call.
> >
> > However, that call seems to be widely untested once the firmware has exited
> > boot services, and quite often leads to a result similar to:
> 
> I don't know how true this is.  What Xen does differently to most of the
> rest of the world is not calling SetVirtualAddressMap()

Hm, but that doesn't seem to affect the rest of the run-time services
(at least on this box), it's (just?) ResetSystem() that misbehaves.

I can remove that sentence however, it is more of a guess rather than
a fact.

> 
> >
> > Hardware Dom0 shutdown: rebooting machine
> > ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> > CPU:    0
> > RIP:    e008:[<0000000000000017>] 0000000000000017
> > RFLAGS: 0000000000010202   CONTEXT: hypervisor
> > [...]
> > Xen call trace:
> >    [<0000000000000017>] R 0000000000000017
> >    [<ffff83207eff7b50>] S ffff83207eff7b50
> >    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> >    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> >    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> >    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> >    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> >    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> >    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
> >    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
> >    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> >
> > ****************************************
> > Panic on CPU 0:
> > FATAL TRAP: vector = 6 (invalid opcode)
> > ****************************************
> >
> > Which in most cases does lead to a reboot, however that's unreliable.
> >
> > Change the default reboot preference to prefer ACPI over UEFI if available and
> > not in reduced hardware mode.
> >
> > This is in line to what Linux does, so it's unlikely to cause issues on current
> > and future hardware, since there's a much higher chance of vendors testing
> > hardware with Linux rather than Xen.
> >
> > I'm not aware of using ACPI reboot causing issues on boxes that do have
> > properly implemented ResetSystem() methods.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Wording aside, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> This is a giant embarrassment to Xen, and needs fixing.

Looking at Linux I think we need to add an override for Acer
TravelMate X514-51T to force it to use UEFI, will send v2 with it.

I do wonder if we need to keep the reboot_dmi_table[] entries that
force systems to use ACPI, as it would now be the default?  My
thinking is that it's likely better to keep it just in case we change
the default again in the future.

Thanks, Roger.

