Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1516D41A9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 12:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517361.802576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjHDX-0007zW-9C; Mon, 03 Apr 2023 10:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517361.802576; Mon, 03 Apr 2023 10:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjHDX-0007wW-5R; Mon, 03 Apr 2023 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 517361;
 Mon, 03 Apr 2023 10:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjHDV-0007wD-7U
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 10:15:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6854e9c6-d208-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 12:15:10 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 06:15:05 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6534.namprd03.prod.outlook.com (2603:10b6:a03:38e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 10:15:03 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 10:15:02 +0000
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
X-Inumbo-ID: 6854e9c6-d208-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680516910;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=kyjBEWr4eKfciZIpQc5jF5H6iyzmnfPSIHD1SdEfCtg=;
  b=ff8PnGMXVFvycCk2sGi8FlRgjeARZAHoMuvK68x0zNRMkDK9hqKO03xH
   xEv3mxyH+YG9/DQ2teUe97a0/lh+H7zyef73oPn2bM6TUyfwApDKARQS5
   xYOhkRAoyYJrv1z1ER/Azvk0krN8KqTuhw03IbFVuP3hO84OZZ40xY+SI
   c=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 104127755
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e7v/ZaJpa6pe36ieFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENS0DVSy
 TEaWTzVPviJYzT9fYh1a4Wz9U1V6MDSmNNmTgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4sXktX/
 6FfCwwofzndo8fp3ZiDFeZV05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLk2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02raVwnymBer+EpWkp9pvpw2W61UrM0UIdwKbudWy2nyHDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8kN+pES0cLGtHbylbSwIAuoHnuNtq1k2JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:lJsV9qDt6wCk8mHlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="104127755"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLNLFtP/mLsiN0Spq6kEemtwDqhnWaMyyjNvSsWBS4Amj7Ya+uUaODmSW/4XJTlnbUHlUXlXLmIUsNilA9Ta/TVtcONn6r55cFfG71fsz0ldzUvdKM5RPsQqKlBoNuEJ9v0TLLBvWNXwmotrh2wfoCOyzMvMdeHKMiRhQkTRKHch/3BTMVzUDahK4EFjNbihBNpVlMZAktk/VxOvlaZtFsOWMePFgGBbi65/SXnBXaxtxRw2LCKa0u7PJNA1eb4O7EpZnMiraWxdQljdApjCZ/oD9sXLAJFcc/VorFDNedcKulredIY53/XfwQiTDHHrPHLxioOPEZZ5afp9Swl2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkDRg+VPEDuLPHDY4NyiLNhDqmUdPszHPJ+4Hgl9ygo=;
 b=DhcRLAqhhOZQNew+oeJUXeRyqtacTvgq3kWDfnT/9sQ0NrW8wA2OZSmGWr2dR3+ElffqNc454lBP33JjEHMuPtynjbhB1CNpmCOh1L1VMqrd+VRgt+CdlL3bPtnxH82lxuTjCiPsMnbAdO0OHp3Ygp5qJpYfvPBbt9XZQpxwTlfuSEsIq8hN5xD5VQaz/o1wQbKi49IzM0G/IbKHaFPpCL3b7LC1hwg4cBp26nwDRnxKoG5EQX1c325sTg5/gEygaBOCZaN7cP9K5qXBKxcG8I8RuoFF+awZdcvba3VmH7ncx+ktYnGbYJVmW/5N8KbO4w5temK7DUwqxW7e8ENaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkDRg+VPEDuLPHDY4NyiLNhDqmUdPszHPJ+4Hgl9ygo=;
 b=XtReE/+iXbtnyK8pcscBzJ833wREmKbrrHf3Txuz/s4zOSJ4ho2HVknJNZ12GR6C1gFTDxWkT7FJkPIRMeau31eKYCZdLTMb+C5CfU4x9BDnuyHVMI34v8VUrFHDlL7pr2AFCLC09cg8ChgpI6dIzkYGC1lcdq2stqzXBS9Z4xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Date: Mon,  3 Apr 2023 12:14:49 +0200
Message-Id: <20230403101449.93323-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:408:e2::29) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b3c7fd-2b73-4bd3-d6a2-08db342c49d5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r4a2/2p7PxspTwtFRTS1DSY18LBpP3penWC+ZlwH+an/NIlxG1kxBVTeFBUd60muuzrCXNFkDsrS6kvw6a8GYmG0YyV5wiBSglkrD1Cc4jxrGkQ26kzMCUovCMhFvkmgCohzxuPzlj7V0HcY4xCBnatHD9/80jEw9aqDGS2UBGA2VxOZVhpzM4ai3RvGrTgFIB8yUwoTU7n+C96zjCupIq7ruMVOMirv6qiDbPgMBcZ/X7zoJ5rysTRbrg05GITkFTPu3a3sv+ZfrQeOYdN1Adld7F3AAEahfjGSdIfAV1uxpnoCEC0uKddwoJdCXgYwLtJCEiN6LcCbTYu1VGwBw6qaeWhtaax7fWIn7SKRXFhaiZbWxf2TVzWtKJhcdSl8MsYSyj/JmZSNKqK/Elyk8mKnuVl2SvCY3vftIpJMkfgTSJmKFRloOP01y+u8ks2gdEckMeDuj39SJvmk5xYqJCqP0pE77dFzfUIhrRv54wUsNW6h8sKfBee0J8n9MDNqF/K8swQrlHrumbET9X5tD+Q7xxb3/7Ugby9f0llkeU8LkZ/AdakjGcSvTMWKFjWL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(6666004)(478600001)(8936002)(41300700001)(8676002)(5660300002)(54906003)(6486002)(66476007)(66946007)(66556008)(4326008)(316002)(36756003)(6916009)(38100700002)(186003)(82960400001)(26005)(6512007)(1076003)(2616005)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTd0MjkxK296bzI2Q2ZSYmlsR2x5bSswdnhiZDFCYlRhSzNLOHhRQytVNnFs?=
 =?utf-8?B?bC9pVkFUeTMxR1hDNGRpcFhWRVNnZXV6NEpWYjlVRndYeXZDTEJZT0JnS1VO?=
 =?utf-8?B?anlrSmlFd0dLS3paT0k1eWFTbkpYSWo4bzk2WEsya1NaWHV2bGpkVzNLdjQ4?=
 =?utf-8?B?czV5Y284SDBDeVZxMmFkTTlBdGRXbjQ0NFZBUzE3QnZ4UmtjQWdDNElic0gz?=
 =?utf-8?B?c3NVaWpQeEdBWlpxRS9FZ09FVGpjQ0o5R2EzaFZ5Umlrdk5xN001VXU1dWl5?=
 =?utf-8?B?ZVd2MnJKYTR2MC9iU21BMEkzQUtGWW1nK0JsdnpwTnVhei93N0Q1VkVZVFZ2?=
 =?utf-8?B?aGEyNnVJYnBxNHRtWEN6S050a1FVd05idzIzVGZ2QzhBRk9GYzlOb0hSNGhn?=
 =?utf-8?B?SEM2L0dHOWFLblVXSVFILytnSU5aNkF3bUZWQkJjSkpUb2c5aVRhOVRUemFn?=
 =?utf-8?B?dG1waExqaXlyTUwzaGY4VU10bTV6UTlBcjdpTHlpZ1RUNWdhVzJYZTJCNjdy?=
 =?utf-8?B?VWZ3bUU1SEswTG8xaFoxVnZCaGVnYU0wSlZmcURiOUJZMFpueDZGZlZncUVk?=
 =?utf-8?B?L3ZRekoxUUVhYlJCaWRsblh4Ykk1Ym1ZMVlVbk1UdCtEdTdLVHVpeFBsWUs5?=
 =?utf-8?B?eGhHL3cyY1FMdUlRQ2NCVk9nd0Z1NTNOVkdVMzlVSXhJRFVhV1MzRzhrM283?=
 =?utf-8?B?MVM2cy9LWUhhSzFkdDBPSW1rc1F6N1JRTkVqbnNPRGhGUEh4d2NqZGJQeWRR?=
 =?utf-8?B?TGxDOEswNS9RbmdzZ0JQYUMzaHVkeWVBaTdwNUdIdWpYWjNPSUhndzk1Qklx?=
 =?utf-8?B?aFYyRDFMYmo4NGpSak15YWllY0JHeGY2RHowMW1Rd1ozRmdLcWEvUmE1NzEx?=
 =?utf-8?B?dk1hUlF0YTVnL1kxNVFOdzhwRVVpQWh1emJIb1ZpaVpMRlU5T2o3Smlvb3Nu?=
 =?utf-8?B?alNZWHVaRkd6Mm85dlFIUGVZTXhzb1ZqcXF6R2YybjVtRzY4SVlMQnhMYUcy?=
 =?utf-8?B?dlo4VVB2T3Y1NVhwMnh1QlRyRCtxcHRxaXNwVnBoVzRIc2NPc3lWdTJ2Q0NC?=
 =?utf-8?B?eHJuMjE2MC9BeWxVNkJRWXA4TzA0QmJvdFUxMXIvTEZTdXJyNEhsQTVIN0w0?=
 =?utf-8?B?QjVHUFYzKzhNSUo4ajl5OWtBaW00OVhFUW83YktGYmwwbXFSU21kbXU5L21i?=
 =?utf-8?B?ZDc1dEU3L3hIZnRrcXdZU0t5Z2RpMmdlWlJGM3Rqc0kzSEd5c0N4OGVqSEIr?=
 =?utf-8?B?NmF4ZUw1WnNueFY0SWN1TmhpQ25TRHg5NmhOR29vZTB3SHVBVmtBT0xKWmFH?=
 =?utf-8?B?ck5oZmRQY1dzRVpCYkZxQXdPd1U1RERHa2wvUlBYQ2xIZkVOallQVUtpQUI1?=
 =?utf-8?B?TGJFTmtDOGxaZ2hJQXJtdEw0d1pCUkxLUXl2aXpIVnppUGJTdW9zOER1RVVh?=
 =?utf-8?B?aXU3aVZteGtKRE9IN3ZjNUF4Nk11TCs2WlRCd2c0Q2dzV1dzVTkySTFqUTJM?=
 =?utf-8?B?M2lLdUp5TXVZbEVBbzJzUHZiQ2c5cnV1Unl6RFpmdzdOVzBHeklQVGU5VnI0?=
 =?utf-8?B?Zkk3ZWxkL3J5VjI0ZzZvQ0JrMkd0SStNUkh6eklRWFgweExQWHhaMXY4Qktj?=
 =?utf-8?B?SHliUStUaXg5L1g1bFNyb1Yyb3VJUk1XRVpJVUtWem5sQUQyNEw5V0lLTGtB?=
 =?utf-8?B?d2tIRDdJTXNLMWM0V1BialQrNDdjS2NZYk1MT1BTRWI5ZXR0aCsrUkdpUURi?=
 =?utf-8?B?V3M1TUQ0RXRnT0p1R3lMVjlVZUJGbFR4T2Q1dzZ1MmJibnp6Y3VpNzB1Y2ll?=
 =?utf-8?B?R1hOZXlNRTdPQzQyM3BmN1o0NDJWemZjQktDa0RIell5blRjclhjbDVyNGZL?=
 =?utf-8?B?SXRWRk9yNTVidE94NEF5d3Ayc05SbXIvT0ZEelVRemd2RlhKVkxCWXNlbThQ?=
 =?utf-8?B?YU9BZ1YycVQyUVJjalFqNnBiRnZXdnJ3U0tNZ1FTY1VxcHZIdjRRMi9CZzhY?=
 =?utf-8?B?NFhFa2FiZThSaE85TkdHR3hKa3o4dVkvUmRRNCs3WXpRdGM5ZHVoOS9hQlF2?=
 =?utf-8?B?K013c1J2VzM4SHZ1dUtoU25WbG1IWW9WSTNCbzdQRnRQTmJSaUVNc2lEekhI?=
 =?utf-8?Q?uObHq7/IVswXyzu6baCEMs4+8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LGdZ4IvkOJ6kxNB8OzqEPVwbXPipV3L7pwdrU+zZiGChl+JPAtCeN131yJXv3OT9yvi8GloHBIi83EACwBrWcoRGfz61fhgloQLSIhKcMYV9ojY9B/hZNFs2JsZO3yZWC+48tjXRupUHvppQFDE/rSzm9sid141qJ/t8QmMC75EzOo+C8pd+ZQLnJxSOCPdUO7aHvmKeTMu9FxSn7Z/hcIOR9SGookMFpdZM2CVHTIiBt5tQ1ZlMmYgo0gfnFTkQ7T2prm//pyzpzMU7W+AxC28k0sxigEh2rLzXlEF4cc9Q/eJxy2tODixEgB4FO/DzdLLeujUt0EnJ6L0JPxJIYxGdIepgdnfUrlVuMrq72k1ySIjlkTHUsJPYDoliCxKK7D5rItlTK60/Ov/q15mDZcJdBZELaFTNlzX2cyBA9Yf+KUI8C5b9kZmcdyhWooEdXQgcs9Bs6RHdautoUTHewTUUdczmotHVYgJKlXHc9nO/+uDK+QQ+3GHguTmb3epU+6yEnmHhwm3gWecJkhC9SjM2wFD8YEdRbWjBXmihdjETb9knSUXFqbsgGO+dOm2/YJg5NY5yZH0Xky6SW5Rz/8AR59pZydYnau+ibJr/9678KnSPN8amexbbQWaCbpWD+Iy5YIJ5bOoGbwtfL/nm/i5YoMTvBG5lRDZDhNZdexwQVWfx3Uu6XU7jywETmpMWQqHPpLvW+TPS65A1aUrU2W/jEGCSGOQAiXkgkvsOciOSDf9ZcCRYWSAs1x0lWgf6Y0fTAwqLUIuI333FhN0LCjQKT3EVvpWtik62FXHAgM0qvcOmAVLGtJUNP+adB/Ow
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b3c7fd-2b73-4bd3-d6a2-08db342c49d5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 10:15:02.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPpA3ijAkE+/tmy/NVyPp9dME6OBy74Hkicfn53oIZfiFZ/8JHj8qnIC4TAfNg2JLQbKbjHNxzPy7bRfqg93Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6534

Global p2m type recalculations (as triggered by logdirty) can create
so much contention on the p2m lock that simple guest operations like
VCPUOP_set_singleshot_timer on guests with a high amount of vCPUs (32)
will cease to work in a timely manner, up to the point that Linux
kernel versions that sill use the VCPU_SSHOTTMR_future flag with the
singleshot timer will cease to work:

[   82.779470] CE: xen increased min_delta_ns to 1000000 nsec
[   82.793075] CE: Reprogramming failure. Giving up
[   82.779470] CE: Reprogramming failure. Giving up
[   82.821864] CE: xen increased min_delta_ns to 506250 nsec
[   82.821864] CE: xen increased min_delta_ns to 759375 nsec
[   82.821864] CE: xen increased min_delta_ns to 1000000 nsec
[   82.821864] CE: Reprogramming failure. Giving up
[   82.856256] CE: Reprogramming failure. Giving up
[   84.566279] CE: Reprogramming failure. Giving up
[   84.649493] Freezing user space processes ...
[  130.604032] INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
[  130.604032] Task dump for CPU 14:
[  130.604032] swapper/14      R  running task        0     0      1 0x00000000
[  130.604032] Call Trace:
[  130.604032]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
[  130.604032]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
[  130.604032]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
[  130.604032]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
[  130.604032]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
[  130.604032]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
[  549.654536] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
[  549.655463] Task dump for CPU 26:
[  549.655463] swapper/26      R  running task        0     0      1 0x00000000
[  549.655463] Call Trace:
[  549.655463]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
[  549.655463]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
[  549.655463]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
[  549.655463]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
[  549.655463]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
[  549.655463]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
[  821.888478] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
[  821.888596] Task dump for CPU 26:
[  821.888622] swapper/26      R  running task        0     0      1 0x00000000
[  821.888677] Call Trace:
[  821.888712]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
[  821.888771]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
[  821.888818]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
[  821.888865]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
[  821.888917]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
[  821.888966]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14

This is obviously undesirable.  One way to bodge the issue would be to
ignore VCPU_SSHOTTMR_future, but that's a deliberate breakage of the
hypercall ABI.

Instead lower the contention in the lock by doing the recalculation
with the lock in read mode.  This is safe because only the flags/type
are changed, there's no PTE mfn change in the AMD recalculation logic.
The Intel (EPT) case is likely more complicated, as superpage
splitting for diverging EMT values must be done with the p2m lock in
taken in write mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm unsure whether such modification is fully safe:  I think changing
the flags/type should be fine: the PTE write is performed using
safwrite_p2m_entry() which must be atomic (as the guest is still
running and accessing the page tables).  I'm slightly worried about
all PTE readers not using atomic accesses to do so (ie: pointer
returned by p2m_find_entry() should be read atomicallly), and code
assuming that a gfn type cannot change while holding the p2m lock in
read mode.

Wanted to post early in case someone knows any showstoppers with this
approach that make it a no-go, before I try to further evaluate
users.
---
 xen/arch/x86/mm/p2m-pt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index cd1af33b67..f145647f01 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -486,9 +486,6 @@ static int cf_check do_recalc(struct p2m_domain *p2m, unsigned long gfn)
         p2m_type_t ot, nt;
         unsigned long mask = ~0UL << (level * PAGETABLE_ORDER);
 
-        if ( !valid_recalc(l1, e) )
-            P2M_DEBUG("bogus recalc leaf at d%d:%lx:%u\n",
-                      p2m->domain->domain_id, gfn, level);
         ot = p2m_flags_to_type(l1e_get_flags(e));
         nt = p2m_recalc_type_range(true, ot, p2m, gfn & mask, gfn | ~mask);
         if ( nt != ot )
@@ -538,9 +535,9 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
      */
     ASSERT(!altp2m_active(current->domain));
 
-    p2m_lock(p2m);
+    p2m_read_lock(p2m);
     rc = do_recalc(p2m, PFN_DOWN(gpa));
-    p2m_unlock(p2m);
+    p2m_read_unlock(p2m);
 
     return rc;
 }
-- 
2.40.0


