Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA27412EE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 15:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556488.869070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVVo-0003wI-G7; Wed, 28 Jun 2023 13:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556488.869070; Wed, 28 Jun 2023 13:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVVo-0003tV-DG; Wed, 28 Jun 2023 13:47:12 +0000
Received: by outflank-mailman (input) for mailman id 556488;
 Wed, 28 Jun 2023 13:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKaW=CQ=citrix.com=prvs=53677329f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qEVVm-0003tP-Sw
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 13:47:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 445db39b-15ba-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 15:47:06 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2023 09:47:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5052.namprd03.prod.outlook.com (2603:10b6:5:1f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 13:46:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 13:46:57 +0000
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
X-Inumbo-ID: 445db39b-15ba-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687960027;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aNfJrvNrpuFW/ZssGos9i515PIxNEG10/+JpgklfQjk=;
  b=IhF2QMQol7gexyr/1jIIdJH+rhdNEwJzTpknYp+TpNWGEt+XKSoj3/Hz
   8fCFs5GncVBk8+t9hyBY2iXDMpCcqCiQ+RjUcxcLROGptOvUrOuOXkaiN
   rC21KBQ1uaf8G/TTcDXHW413Y2R0EUdz2Fbu535tyE6F77xaIe8pX6fL9
   4=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 114884583
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fJzga640ILLyEnvduduZIAxRtBnHchMFZxGqfqrLsTDasY5as4F+v
 jAeUWvTbveIYzbzeY8kb4WyoE4O65eEn9M1QVc6pSw0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa4R7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 fERdCJUXgq6mf+a+Im8CeRz3pUnI5y+VG8fkikIITDxK98DGMqGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Nkkoti9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtORO3kq64x6LGV7jUeMjgTTleAmvWem3SwXtl2d
 GY+5wN7+MDe82TuFLERRSaQonGeuQUHc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCX+6qQrDiyETMINmJEbigBJSMa5/HzrYd1iQjAJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv4254FTGjjSEtpXPCAkv6W3/YGWh6Q9oYZ+/UKah41Pb8PVoIZ6QSx+Ku
 31ss8KZ5uofAIqNkCGISeMlE7Sg5vLDOzrZ6XZmG5g66z2s4TitZ4lW6zBlDFhlOYAPfjqBS
 ETUvwVW5pNaInqxRaByaoO1Tc8tyMDIEtDoVevVb5xNf4J2fw+E+wlhYEeR2ybml01Eubo2P
 56Abc+3DHEyE61/0D2sSuES0Lkmyzo/w2yVTpf+pzy7ybeXfmWST58fOUOSafo06qyFpgjY6
 ddZOI2BzBA3bQHlSize8IpWKE9QK3E+XMrys5YPKrXFJRd6EmY8DfOX2akmZ4Fug6VSkKHP4
 225XUhbjlH4gBUrNDm3V5yqU5u3Nb4XkJ7xFXZE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:tBZ+natiFwx/fTvc2nrfQtLJ7skDrtV00zEX/kB9WHVpm6uj+f
 xG/c576faQsl0ssR4b6LK90cW7MBbhHP1OgbX5Q43SOjUO0VHARO5fBODZslrd8kPFh4pgPN
 9bAstDIey1N35crey/zSuZN5Ib4PehmZrDuc7ui01qSgFhL4FMhj0UNi+rVndxQwlNQb4Xfa
 Dw2vZ6
X-Talos-CUID: 9a23:sqaViGGKfBRlCnKbqmJr+UdICJkVaETD0VvoGEj7BHkxGbmaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AwhmkOA1P3I6iIPCyUQ5Oy9OOjzUjuqmULUUWna4?=
 =?us-ascii?q?9t+6VDyJ1MB7Cph6qa9py?=
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="114884583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPGd/zr8ecwywcW4nQ6XFkQ2DvCqtuD3jWtV50/FgsleDWTw+kGIClA3s11enHs3ZDPpmEvAbRlTYYgteclyJxLJwXC6E4S9f/LWXZ9KVo9IIDLOHIHUAlJDv4lubCUCuqUyicQFHhcVVf0iFXgC3ERX7xn6HP2dvmXactLeFt6UVDKHN6OA6xqj43OFa6cIybq6UxRYiW9/QurP6MCsK9oxwma2Ef/0g4SyTnYHAKJVgkJ9Dx7o4Gctz/t/rcQFnwFifXIiI9Qf+yLOuQ4u8a7xEal6LSHXjzROXEWfOgs15a+KuZq7ZGeTXEgWOphmMDHq4HNPjFxxoDzUHp7jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNfJrvNrpuFW/ZssGos9i515PIxNEG10/+JpgklfQjk=;
 b=PI4GNdl6oFIIf4/JuvxMfWu/+9Myc70IdeUeWXL9AKRo3883HHFL8ctQXhqEXwTTdVm8626WgaKGXiC3uQlt3+k4/ZTVX1O/gM4dwcfuURF50NFkCzW9nES4uAbzW9I1q0cm0xs+OHMUUwM1bgfgeotqT0pGDOnUXzjH3onavSFi6gxYx/T5GaisGkoDfJg1u8H21ox0t4cEwhBgrcAxRHbY9Nk/qWHuCJvSZX5jaWoqTeEPm1x2+NuiNUQon0d+OsdGiwPN0TZ9WPWnouLkNeGk91bkFhOvrNUAPB8/98P+hJZ+1VqudTvriU+TlTFdv+sC+lnN3Q2Cgi1OOzRceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNfJrvNrpuFW/ZssGos9i515PIxNEG10/+JpgklfQjk=;
 b=Vt4F/uMXTC210CBFuOIf5iUT7JtHCYNpb6FCRdWH2VRwjyfo9oBF7zSVjPB9pZvBjtz//haiWlsEr57JwsU+33MdZMe7LuasJPY9nFO8vs/xCBV86YBxkKpYGpQq+2z9znCadfMaJq+US007i9LaugMJp0GVq/fYTNOC2vVpXCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2a195157-fe59-3bfd-f5cb-c377d883cef4@citrix.com>
Date: Wed, 28 Jun 2023 14:46:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: XenSummit: Empty per-arch files
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
 <58622fcf-0939-95c5-7318-60c93307f991@suse.com>
In-Reply-To: <58622fcf-0939-95c5-7318-60c93307f991@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 54aa276f-4cf7-4585-1a54-08db77de23dd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xmaHpn0JCuzHthK/Ix+9+2yyMA1iUKu5Fi8ZTIpRftdC0+abnsxUmXzXDLuuPbX2EK1xrkZep2LMw+gU8OrL0TwIuLF5l+hVmdoRdXZfKDsdcvyYshtHfJsWz6N72Wi0PJ8YS93RQBHDSaQHFxH7x6n4r5+wTUd8iEvw3HwaNOlwZWehe0QduXQsElpJP/xSQ1qs4IMXCLdpneeeSslT3YDj9SMpX037RZm9RJr/vJNaY1ir/pM/IfUPxN0DJ5JdpykPW02rdg4utZvF4/YoUMeSpCtHwy7FaGt1uOcmIsj0RqGXMBRTMsZrXGd+oOdVo1i/f84MPoKeNcl2pMwCpIVosDCu8nNRsM4jaaJOOVfyM6vZmvStSrxr1/NwI9NAdOrt+kZZo0KrcVg+Rx63RPrlSGuD+xlXbtco24xemsKQfRVKXowxiRqiAbEqhQqsJik1ih53Bun4iLV1PxXV2H6ezVEgSOyLnfIVl9OOq1K5792aT5iF6TwqVsvZBSF9xAnzFPgrogMShs4qLTL/Bt7XKcPCRAkvmA90TP2BRcUBQLnv8uT4efE70aMp1qOIfEdCmeDCdRVJNAZt/g1+8O1+IwG7bpZvAafw9FIdaVwLgaNV7dXjnLtP2lcVQxVR/2SDMapUA1Z2ypBKHDulgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(31686004)(66899021)(36756003)(53546011)(6506007)(66476007)(5660300002)(86362001)(7416002)(316002)(4326008)(66556008)(41300700001)(8936002)(38100700002)(31696002)(66946007)(82960400001)(8676002)(6486002)(6512007)(2906002)(186003)(26005)(478600001)(110136005)(54906003)(6666004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUlFMWkzMFMrRUZydGhRMjJlMlVERVFGdHBuRnNWOEFqb2U3eUEyQjFSamI5?=
 =?utf-8?B?empPMGMzOUE4RDlHckg5U2IvNXRtdG5LQjVXSXhKd0N3Y1BJeWRmQVpreWtu?=
 =?utf-8?B?enlrcStWdnpETEV0UytCaGltN2tOSit2NTBLN1VaSWMwNkpvb0t5YS9nS29Z?=
 =?utf-8?B?cjlESHRwMFpzelpqWElqMVJQY3JYNFZMOTNXSmZYR0ZxcG83Vkg2UStsdFV0?=
 =?utf-8?B?aEUyZU55ZjE0a0x6aHhEM0xOczJvTmgzME1sRHU2eUdkbGJuS01FZjBtZ2p1?=
 =?utf-8?B?S09sbC9NaGU1RG5jNVE4Snp1STdHLytjSW0vakxYeWxiaGwvcDM2dDJLazRX?=
 =?utf-8?B?RlJoZXRCM0s1aU1lVGpaTk91TjF1YXBtRm5tcFczdEtWWWI2aTVCN0tCMkM5?=
 =?utf-8?B?UWhpWS8yYVVnQmFKYmQwc1BnbTh1Ymx1Rml3OVh4QjBCSWs1L29OcWZ2S0NG?=
 =?utf-8?B?Z1hJV0lXSE9TcHp6Unp2L0xFc21ocUdtRjd3akgwSG5UVFNWb0hxdFNCOXpt?=
 =?utf-8?B?ZGhJY2hDbTU2enR6S2hVa1hOVmZwYlJOVHFBQlBKRjR3OWwwaTVmRWczVFV5?=
 =?utf-8?B?YTEzNnFwSXJORDdtK3dqeUJMcWVUNmRmSUVpOERKMld5d2NjbVBYZDBMRXVP?=
 =?utf-8?B?cHNnWFJMUDhOYklBWmt6UjZWTHNsTnBLbVRhanA4a1J3MjNUNjZhdkdVcm5u?=
 =?utf-8?B?clo3S2VCMjgyQ3JkS0wwODl6Ry9NeUhjWWFLRG5SQjI1emg4SnM4eWRvRG1Y?=
 =?utf-8?B?UWczZTMvRWxNaHN4YWZGU3M2TWJnZXM2ZTZrclc4QjNDMEp4OGVpN3VoY3FM?=
 =?utf-8?B?TkVOMW81cWNaN2JnamlidU1oalh4N3NoVWhyakdRZ0M2b3NGWStNM1piS3BL?=
 =?utf-8?B?TkJuK2NIVzN3Qzd3U0Z3UkJKUXdiY0NGc3dad3BRdVY2c3p0RWJVcXRiTlA5?=
 =?utf-8?B?OHRnamNFbkIvWFVIUkJxS0F3WXFhWEN1UWFoMldPVVNLOXlUdS9MUFBuTzMy?=
 =?utf-8?B?QndKSmVEV2NuTE1lZ3dLVG1iSWJVa1VNUnpuRDlHNzcxNXRDU3F5blBySTZX?=
 =?utf-8?B?MzNPd25Ya0VYdUp3N01IZ2tuZlpFeWFxckdaWkF3cnMzMWt0b0RMYlROTnor?=
 =?utf-8?B?SEY1N1VDSlFHS2FBZFk5VFhjZmhMdWVjUDJmMFUwWWFQK1Axb1FJRlZwRGJt?=
 =?utf-8?B?VWRnRnJqNVNheFJudjJaeGJQeVFwU3VRNE1KRHhIMUhyTzZPd3dZa0tiOTNL?=
 =?utf-8?B?NG9OYmRPN3BFZytxSllWMUVib01DTGVuL3ZLcUtPMHNkVlRYYUl4dGRUSWdF?=
 =?utf-8?B?VFc2bWQvcHcrWFNWcElDSkMvVGZOZVdJUU1OM3R0akVxbFI1S0JSMitCSEs2?=
 =?utf-8?B?aitVWGxiTUJxUEEwVjU4U3EvVnN3MkFzU2lGWDVyVDdwbGIzeTQrTS9xdHUx?=
 =?utf-8?B?QWhzaTF2V3NkZUZYdVJ6RCtiL3laNHRRakExTGxOeEdOVDJPYTdZYlFFN0Ny?=
 =?utf-8?B?c2hnaHBzT3BLZ2xWdXZjWlRta2xVZS8wUm9QUWpRaDF1cHk2MjFpSjF2bG5Y?=
 =?utf-8?B?eCt0U1habmFGRGgxU0tqR1EyeFpTM05HbHBROWYwMXNHNGkwcDJ0VWROT0Ji?=
 =?utf-8?B?aEVkRU1SNi95ektHQkg1OEpqNExPYVlYb3Jvc3k1SlBqZ1BhcXZqWENScjVp?=
 =?utf-8?B?TzFsRlgrc054QU9UMmFkYUNUN3ZseStEdzlqQmRHenVjRERhRmVJWkRqcGc1?=
 =?utf-8?B?VFArTzQwQWZxcGZGcnEzeUJ6M2EvQWxxeEEyY1BFbFV4RjZQSXc3WDhpZnZ4?=
 =?utf-8?B?U1hNRk53TnRMbWovZmpwb2F3a3I1cFRXZS9TK0ZWaUpWWFNTSTlPOHlKRjFS?=
 =?utf-8?B?MkZ1VE83M3hjb0VRY2FIVjMxTkJMSnZyd0d0b1RsS0syenNsWStrRjFuNTdI?=
 =?utf-8?B?TXpvU0dpKzg3RDBvVWl4dG5oRU52MCtyUUY5OXoxbVMwWklwaG42U2hBUzls?=
 =?utf-8?B?eFpEbFVHUHRyZ3YwbXRSekErTXN5aExTeDdPRGtyelZLRzRwWEU0K2pmZnBt?=
 =?utf-8?B?TG1TL3k0NDVuazl0b0lGMWpZRHNKUHVXV2JKRDhxbjlROTJvQTI4bTVHWFRW?=
 =?utf-8?B?ZENpM3V3ODQ1eENuU2V3a2ZIaEVEbnhOdWN0bm1jb0cyUGFSUXYrMEdWclJo?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?OTU4aGpGMGRGSTZBUmJrbzFIMlZDWU9FMDRZRFYxVURoMi9uSXBhQ2dFYVhW?=
 =?utf-8?B?ck80dHM5eVBCRzVidks2MjliSGt2NHFXaUtnNnR2blVlUHcwTDl3QVVJZzdD?=
 =?utf-8?B?bTNUTEpZY1NKRXB5QU1XTWMzRVNGNVlOKzJ1YTdlNkdMYUNyRXJRSnRRRmRX?=
 =?utf-8?B?R1hrRXpjelR4SzgxcXlEMk5pVVJPT08vN04zbXZWTDZNRklMTTdnU2pFN2pE?=
 =?utf-8?B?WFBYQjhINW5kb3A2U1ZTOVNwWDR0QkZFMEg2SjEreXZuTWloVEF3akdBTE9O?=
 =?utf-8?B?allrNldveThHcHFuY0dELzFrMnZrTFUwc2pERlF6UXBLSWt5emxwTWxqNGVh?=
 =?utf-8?B?V3JUK3pydHREcHc0czZoTWptQnVacTBDRmJUSmxVM29aM3hCU2dtSml5WkNr?=
 =?utf-8?B?bDZuZ2lrNFRvZ282M2VOditrSzhJQzZnNG9DdDBKUThVUDZRRkZveERTWU1m?=
 =?utf-8?B?d2d1Q05BVTdodG5SM2dMc003dFFTOUFFUXZJMS9IcU5xMmRGY042Z1RDdUtn?=
 =?utf-8?B?dDZYZjJkTVZIK29tVk9JQUZkaVlxMm1wUW9zeExCbkJYUzJRbjk1VGRhQktQ?=
 =?utf-8?B?ZExXcjVoOXJrQWZpdDc3TG54eWFMbHB4blRnRGxEN25vVE9ERkF3QUFiREJw?=
 =?utf-8?B?MXFrSGZpdlg0YVVDUW1kNVd2TWxkMEVMUzMxS2dLMTVhRVliY3pFcVVGRnFm?=
 =?utf-8?B?b0ljR3NsZFVwSEhDcW4yYUhMN2l3S0VaSmIyWVp0eEE5aWNGbmFmTTRQTisx?=
 =?utf-8?B?WVBUR1lsOElxNlpWNlBZbXhJQVhIRUtpSlM2N3dvT2JMaXg0WHEzVFJKbW5Q?=
 =?utf-8?B?Y3JBVnNvRkpZb2drWTFFUE1JR3NEM2VqSzhyem1PWlhsZE41eisza2F5OWNX?=
 =?utf-8?B?SS9SUmhlalBlV0dsRUpyNW5YM3BEc3FSZStSeHVaRGkxS1BIZWMzMC9aWGJw?=
 =?utf-8?B?cmQ5OVhVM3JrREQvVVpwREdjM1pMSEVBRVo4THF5WjlmY0tXQXd0NUNBcStF?=
 =?utf-8?B?YnhSbC9XWGJRbjJrMld5bjVrcktMT2VEdWtkcjdSalpBeEsxTEdsOHJ4eXNN?=
 =?utf-8?B?bzNmY012YWZUTEhTWUxJeWcyazVGVEJhTUJYRzFCYnNUY3A4RGhScTdFUW5x?=
 =?utf-8?B?SDJrN2VsL0pTQ3Rkc1lTNUJHQldxdlhJdGhCS2tZSWx3ZWk0bHh2UWtZajdE?=
 =?utf-8?B?N3E4S3l3Y1Zka1RyM2UwS0VoQTROa3JTQ09CQ3hSUUpEbTJpRkdJRllnU2ZR?=
 =?utf-8?B?ckdzbjRnZVJIQ0FHRHJJZUFydDNudFNrck8xdXVVK0NhM3B6UG9pZDgxdFZ4?=
 =?utf-8?Q?g7WT5o7yujj7k=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54aa276f-4cf7-4585-1a54-08db77de23dd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 13:46:57.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db6zSdWfCLPWWtkkJk5AGulJrsuvgZTQPlJB1k3ZZsuA/vo6nQ36CQUZ8j1DwWGn2T0VxkijRLUiIQ2kx106ZRY2rH9hUgg+wuaosUlzdFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5052

On 28/06/2023 2:26 pm, Juergen Gross wrote:
> On 28.06.23 13:32, Andrew Cooper wrote:
>> Hello,
>>
>> This wasn't a formal discussion point at XenSummit, but Oleksii pointed
>> out that it was still a problem, hence this thread.
>>
>> As we take on more architectures, it becomes more and more important for
>> things to be handled in a mostly-common way.  With that comes quite a
>> lot of <xen/foo.h> including <asm/foo.h>, and the arch one being a stub
>> in simple cases.
>>
>> It would be nice to get rid of the stub files; they're irritating to
>> deal with, both when refactoring and simply for the file bloat they
>> create.
>>
>> There are two options which come to mind.
>>
>> 1) Use __has_include().  This would be ideal, but would require us
>> bumping the minimum GCC version to 4.9.2 as a prerequisite.  I'm not
>> aware of any way to emulate the necessary behaviour on older toolchains.
>>
>> 2) Have a stub "architecture" which is always last on the include path.
>> This would reduce the number of stub files from one set per arch, to
>> only one set.
>>
>> Anything else that I've missed?
>
> What about a make rule creating an empty include file if it is missing?

Wouldn't that cause a typo'd header file name to spring into existence ?

And it would cause a build to leave the working tree dirty.

~Andrew

