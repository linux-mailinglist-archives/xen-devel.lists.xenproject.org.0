Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B206E4BB512
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 10:10:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275246.471025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKzGm-0002tV-BV; Fri, 18 Feb 2022 09:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275246.471025; Fri, 18 Feb 2022 09:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKzGm-0002rc-79; Fri, 18 Feb 2022 09:09:40 +0000
Received: by outflank-mailman (input) for mailman id 275246;
 Fri, 18 Feb 2022 09:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKzGk-0002rO-CS
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 09:09:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d232fe9-909a-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 10:09:36 +0100 (CET)
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
X-Inumbo-ID: 7d232fe9-909a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645175375;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zX4SjgHBWf4OPXb2hEhKFyKfg2Z3b/qAoSUtpOME14k=;
  b=Ru4ybEiZYpaHv1G3Hi5YvO8vYvAM3RBep9pbohGQScH9c1+MuN3KiNp/
   3NYlB2Emtu58vQS7u5hPuhfV1HeLlAT7M+ATTaX4OYQhHIT+KmD1jJdIY
   OkuFxUaUnOjJKvEhinY8aBuovXIKfpBbLNefDvMiNTZxb/1UkOuUoAdsg
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64501450
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MhIrnKliLzNJXsynzHodhgXo5gyWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdC2mGPP7ZajehfdpyaoWw9xtVvsLVmoNhT1RqrCk1EiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2UILd9IR2NYy24DjWlPV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYb18CY4fNvu8hDDJmEBt1P6NEwa74GC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6qDP
 5NFNGIHgBLoODhwJHIUA6oHg+aPujquXCNRrwqUjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJ2S8ZnwgCrwZaLyDiaPGMGQDx4eeMf4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D5gbQ4xawZRGp8crVnl
 CFV8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBowaJpcKGO3O
 RW7VeZtCHl7ZSrCgUhfOd/ZNijX5fK4SYSNug78NbKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHePqtdLdQhQRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:biqm1azzXrkYgj28/9BSKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64501450"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgkvOQ1C2ckD1h23ZEccbW2i6AJm0TgFKYrk7ioBpIqbGDTojLk81qWITBu0et+eIH9Ldib0nslooJzZuRtYpzmkFX8Zk23UAjrF6ioeUr9CsX21AdNLtz+oGY5gPCdtC/K/NJJe67rJhzFmGZ1fkNBqw/5fKQDx9261fW6PGpZTuSTvpZT1EH0YfKVFbukgtzFsfyWzm+CzRR+1ZM+AAi2e7Iw5W9MIxGoZuAPkJ8C8eUs9wiR9y+i6RiG6RBkKTjN1lQS0eJhQOO1VGRSgDj5wr02ifTDWbpy2OiTLEYiBntHWCN/g0ByJkcEx+nCMYfT98DeQBCvCQeR1YvwwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ett+XDu2hDr6Veiai8PvSlhBtqqKmzxcxfDfOHu3C8=;
 b=XJbDtseifBFHoAIh7JMdI+dgT5U1mvmmQI26/e/Udi+h+LHRwkHmxoi5ZwIqlfn/i3yueOe6jGAVtONJQZV0YTPSjL1hZaSRJPG0yWOUO9Xsc5zSclJXGs6IrBGJhhKEEqG6R8Y8LLlDwICvBqxuOPP2cRPCmUyW0fdvVgFaLaIbIjCsNH0u9VjgsCGMNjZsGtM+Th4+m38cDay2wYu76t/VBnaU3ZrjmELQxOdIi6XdU6RQmqBF5j9JQwBpV3Y/J+fbA6AZmWwlVGJWjZQzoOd8Vdw8A29Pdp97Oq5qKsjKwd15WgNT6YfTnVt53gW4Fxo6tRivHuyncXTg7K4POw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ett+XDu2hDr6Veiai8PvSlhBtqqKmzxcxfDfOHu3C8=;
 b=XoRYvMbLDlUHiiJXC4/UurLGApGMUEsyTOXJoHhYWnuuNsRNWHHvLlTZs9eaHTk84v9RKlQrz2+jMkbYt6rvYHGRH9WcdW0RFMK9MKsP9OOnCx0ogNZgUR/Ip2FOGoqoQxF4we/xnp9LQtt6r/7BUz6SUm4UYgOMBHvoczLIvxA=
Date: Fri, 18 Feb 2022 10:09:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RESEND v2] x86: introduce ioremap_wc()
Message-ID: <Yg9iQq7AEnDirafd@Air-de-Roger>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <c56aadc8-e568-4625-5d6f-bd2b8981f3ae@suse.com>
 <Yg5gGenFpAwZqtSW@Air-de-Roger>
 <34dac738-0631-f80c-a3db-7367e37ec0b9@suse.com>
 <Yg5urE+rpOQGWiH9@Air-de-Roger>
 <6f343b71-80f7-1aca-3be1-58239ba81dff@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f343b71-80f7-1aca-3be1-58239ba81dff@suse.com>
X-ClientProxiedBy: MR2P264CA0124.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d7e1a47-259f-490e-2b8b-08d9f2be5e2d
X-MS-TrafficTypeDiagnostic: BL1PR03MB6183:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB6183B0A24672DB106D38866F8F379@BL1PR03MB6183.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67SYd7OsW6IuBqN6CUQt99zoXTXR1Y6pNKVhblVabca4DVT0VGkOfe01mvavqOqtRl8jb/L3WPshT/yAgLVw0piQK9Poh0ttvUAZdnlWsIts1eI6S/qk6gQPCo7C35ZOdfYuIo2tE+drcJnqTeq7JENG9Z/d1WxCDBwcXFiNFXYFmjJb8pa0xIxDvuCMzyKE8dtngWDQuE/EHQz19sOu0RT7gnmt/g4P4+WgYZ/eUXuXWk7UnL9IcLUlq/c4yYq3j3OT4ixZFrlbqXDNqSDysdV2Nnpc+OI8U3xzafHGKEviP7DKt0akNtst9eoA4A9Q0AuHafjIGeW2Ug07EYT8bhq6Z+Mq3jga0f+JSRf97o7hBEJvzjvGMc/d8axXXv4Vg1QgL+h03vSEWUmGkxmGFguZor71Kfjcoz8MFRTb1DTZL8nDQy5BCWmpO4ow6u+OCqw17aCd15yEH6QQRRtJnUHxnfluFWv5xMPofXQfPXIqE9FIHj18cHLUsOjvpKULXMr8QcEKD+EJgVktym35ScdbyDfu+1U7ZshTWobz35kCtJ7QKJfJkt3Zd9OlNOgXRzUkA+UbTKfbwW/WurMkL81S4oYiC/sNngud/nS4n89hQRYlW96B+pgFv9xHX1PXnwYEcqgOCkufm+xq7PRhzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(508600001)(316002)(85182001)(9686003)(5660300002)(26005)(53546011)(8936002)(6506007)(33716001)(186003)(6666004)(6916009)(66556008)(66476007)(38100700002)(6486002)(86362001)(54906003)(6512007)(82960400001)(8676002)(2906002)(4326008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVp1b1ZxNlpFVjF2R2NNcjRURnVSaWRwNTJCTndmOXJINFZmU3FFLzcveXBn?=
 =?utf-8?B?TEQ2RFByVEl5OXZkbExXcjVKU0lINXB1VWJKWWNEMFd5SGZYQ1paaldkZ0RD?=
 =?utf-8?B?Zms3c2VRWFpFRE10cHVZMkxGZ29hK2Z1cWtkek52L1VqakoySnZiQWVSbG1V?=
 =?utf-8?B?dkxTR3Q5akxXa0I5U1hLSzY2OTduMlc1RHgycEhES3RqN0JpZDZjU05ROWxx?=
 =?utf-8?B?TFpUWHN3V2ZFK2I5dmNMS3hISWg1akNvaEZuUm1yejAyb1M2aHRKTGNqYkxS?=
 =?utf-8?B?T0R3MHQxalFac3huM2hhSVBGK043aTRsaGpWL3lNbVZUWEVuNkFHNnRsNWRx?=
 =?utf-8?B?YzdZV2pTbGRuOHJLZnpTVXUrTWo4NndTSmhKZjNDNm9pRDg2N0xEc2Ftek5w?=
 =?utf-8?B?d0pzOG9HKzNNcFFTR3VsM2dxQmtabE0vL1NLdlROeVZBRVZWcnNzS0ZuYzNq?=
 =?utf-8?B?alhFRUtnRWp6N1dpUlovSXZ3bG1vbi93VUpHekNra3B5Q2FBaTNjVklKRCty?=
 =?utf-8?B?QjIvT3d2MXpja1BlYzJ3WERCK2VpaTdkS2UrYzZOWWttZnVtbS9TaGZ4WkN3?=
 =?utf-8?B?N1FLbXFNeXFlQkJUUm1QMEZvcURsNGxBU2JlTXdxRnhjMG5TK3pucDQyNk5y?=
 =?utf-8?B?WDlmVnJQYU0xTS85VmNkdlBiYWZnaTNocVRaSmF3MEo0V25DaXNoaFFTcmFv?=
 =?utf-8?B?ZjZYaW13c3A5QlhadXJNR2dxckpiMG82K3NKS2RpdTR0RUNPYVRaL3dKMHFh?=
 =?utf-8?B?Q2JZeXUrQy90c1RBeXJlUjcrREsrTmxRbENBM2h5d3BVek5iYlNvbG05alpS?=
 =?utf-8?B?bFIwdGtVQ1VJc3N5YWZyZDU1MXRMT0VlOGZ3T0tGblRWRWdRZjA0am80VFlC?=
 =?utf-8?B?SjMvaFVKTzlUTWttc00rN0xRTW9QdytCL0IvMHMzZllvSDB5QU82UUQzVEU3?=
 =?utf-8?B?NFM0bXNxSWl5UklCK0RtdnRTbERNMWttV1YvaDRWS3NvSXNRaVpaQ2xIWFEr?=
 =?utf-8?B?VE5vZ1lrbFEvQmRSWFZBeFFRLzMyc0dFekRYSFNBKzhvNVFJbFY2RnVQQ21E?=
 =?utf-8?B?TkZwLzNHYkZsQWpIWkJORk8vL2xmWG9GU0dPbzRVcDd6S2plbU1ZY1FOeDRK?=
 =?utf-8?B?a3NrbG5Zc25wOWg0aUdGWmIwY09jQ2lOMXU2UXJEREpnQ3FQSnpDMjNFMk1O?=
 =?utf-8?B?cVRFR3lJSXJhNi9TN3lrbkJGc2NxMU9JbXozWk5zTFJ5T21vckhpYThYbWJS?=
 =?utf-8?B?cWJTVnowKzltOW1ZTEJrZnEyQzFWMlNHUW9wb0d0MkM3b0FWeTN1YUk5Q2k5?=
 =?utf-8?B?VHpkNm1ZcmRBd0dxeUtjSnNQTHA3OVdnNDB4LzhRVHBWUGFaeTg4VVozZGcw?=
 =?utf-8?B?Y1doOFBIM1pWeGVZL0M2MXFmZmRBa3FJL2dBSHhqU2kyWGc5amVmL3Bra1VE?=
 =?utf-8?B?V1k4RWt2TTNpckN2VEVTZElQSGZxMFVGL0pwUEdYQ2hXYit3N0xPN0JPZmlq?=
 =?utf-8?B?VjdDZ0d5RmVWTDlQVUR2dUo4NkpScnJWcVZ2S2RwWVpWZ09hVi92eUN3KzFL?=
 =?utf-8?B?c3FBRW94NjJuNGN0bUdWMHkxK0ljKzVwYXY3NTdZRk9BT0kyaUZ0V05jRnp0?=
 =?utf-8?B?SFNMcHMwWmZrcjk0UmxKcEF0akZGT3FJbEtqSTBodEZ2cTRMdzNURjNSUnMz?=
 =?utf-8?B?bHhFdU05V1pOREl3ZldPMmg2WnZTVWE5RllQWnRJYWRoTFdFYm1MQnNEY1B6?=
 =?utf-8?B?aDJtdDFOK2FSZk5FbS9QNHF1RFp4QlA2UlJyTUhjVnRaN1F6RlpUc0t1bTZW?=
 =?utf-8?B?dHFxb3hGbURnZ1J1WUZrd0NCK2hMdGxxUjc4bE81dmpEa2Q2QmdvdXlTMEda?=
 =?utf-8?B?OG1SSklYWkQwRWFKQWJhLzhsNzZqNStzcHpuYzhHQXlQK0Y5TWF5R21ZdmVo?=
 =?utf-8?B?bGV1anJPNjRCaEJoQmpUWVFjZkRvVGRkZXFjTWIrcTRNUDVvSUU2bEptVWZF?=
 =?utf-8?B?TllUcW15MXFXbjhiRmFCSW9jempjZUUvbk0yWURBT0tXTUZiR0hSWFlTbFRi?=
 =?utf-8?B?YWYzWnhNRW1ndEdKWEhIYkl4TDZqektZUEQvSldvNGFpYkVHUzNLclRwRUY0?=
 =?utf-8?B?VmlmaW5ZK1lBS3FzVnF2cmt4MnhVYURwWFJNelRKK2NhMkgrLzF2eUUxNzZD?=
 =?utf-8?Q?cbSJhsQ7agxqOzsGed0FAgE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7e1a47-259f-490e-2b8b-08d9f2be5e2d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 09:09:28.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4ZMJXMxrYQE6EHq4HmEhpDIv/e2BOE7fd2HfQ1mT9uIIWA+Rq80DzpF9QfwMmSQvntKdaLNEqMixd3z669jPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6183
X-OriginatorOrg: citrix.com

On Thu, Feb 17, 2022 at 04:57:41PM +0100, Jan Beulich wrote:
> On 17.02.2022 16:50, Roger Pau Monné wrote:
> > On Thu, Feb 17, 2022 at 04:02:39PM +0100, Jan Beulich wrote:
> >> On 17.02.2022 15:47, Roger Pau Monné wrote:
> >>> On Thu, Feb 17, 2022 at 12:01:08PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/drivers/video/vga.c
> >>>> +++ b/xen/drivers/video/vga.c
> >>>> @@ -79,7 +79,7 @@ void __init video_init(void)
> >>>>      {
> >>>>      case XEN_VGATYPE_TEXT_MODE_3:
> >>>>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
> >>>> -             ((video = ioremap(0xB8000, 0x8000)) == NULL) )
> >>>> +             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
> >>>>              return;
> >>>>          outw(0x200a, 0x3d4); /* disable cursor */
> >>>>          columns = vga_console_info.u.text_mode_3.columns;
> >>>> @@ -164,7 +164,11 @@ void __init video_endboot(void)
> >>>>      {
> >>>>      case XEN_VGATYPE_TEXT_MODE_3:
> >>>>          if ( !vgacon_keep )
> >>>> +        {
> >>>>              memset(video, 0, columns * lines * 2);
> >>>> +            iounmap(video);
> >>>> +            video = ZERO_BLOCK_PTR;
> >>>> +        }
> >>>>          break;
> >>>>      case XEN_VGATYPE_VESA_LFB:
> >>>>      case XEN_VGATYPE_EFI_LFB:
> >>>
> >>> I think in vesa_endboot you also need to iounmap the framebuffer
> >>> iomem?
> >>
> >> Again part of the full series. I guess I was a little inconsistent
> >> with leaving the VGA unmap in here, but breaking out the VESA part.
> >> It's been a long time, but I guess I did so because the VESA part
> >> needs to touch two files.
> > 
> > I think you are hesitant to include the chunks for the above items? (or
> > maybe I'm not properly accounting for their complexity).
> 
> There's no complexity, it's really just that the zapping of the pointer
> needs to be done in a different place from where the unmap is. See below.
> 
> Jan
> 
> video/vesa: unmap frame buffer when relinquishing console
> 
> There's no point in keeping the VA space occupied when no further output
> will occur.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

For both patches, the one inline here and "x86: introduce
ioremap_wc()".

While at it, I think you should also push "video/vesa: drop
"vesa-mtrr" command line option".

Thanks, Roger.

