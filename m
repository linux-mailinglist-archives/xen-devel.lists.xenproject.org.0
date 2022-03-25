Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F504E745F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 14:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294715.501262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkCx-00084j-Rs; Fri, 25 Mar 2022 13:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294715.501262; Fri, 25 Mar 2022 13:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkCx-00082u-Ol; Fri, 25 Mar 2022 13:42:27 +0000
Received: by outflank-mailman (input) for mailman id 294715;
 Fri, 25 Mar 2022 13:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r7I=UE=citrix.com=prvs=076f4df05=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXkCv-00082j-Uu
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 13:42:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65ee6050-ac41-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 14:42:24 +0100 (CET)
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
X-Inumbo-ID: 65ee6050-ac41-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648215744;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=su/ycCrs0uKJPmfspd1i9M0U9Noym9WwbRAESc+9LXM=;
  b=AHPgOBmtlWT1m8wUMKLbt2oq6o2RNNWrjbUwH+c6IUAjXcZmyE9njXeC
   okuO8hBTd79qZyuZ9cZEaHkQkBQ2n42ATg+l+QSkA96ZhoqsTri2Et5f4
   7NI3gFZ9oVUqjjU5AvJxNK8dam9+z77NrmU+oV2XJQCiENpboE+Bpo9/+
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67576095
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rW8PcqlPXT1IR3RDs0WkQ3To5gwqJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNCmGHP67YN2byKNl1b9iz9BsCsZaEy4cxTAZqqyE9FCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYTCQMMvDupuonAhRjCw15YJ9i2fz1Li3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6mDO
 JRBOGcHgBLoOD1oNnISLIgFsL2RnHT6T3pApw3JjP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqum+vOkCXTSI8UUrqi+ZZCnFSWz3c7FB4SWF20sPS9zEW5Xrp3M
 1QV4CEnqaE46WShT8XxUhO1pnKJpFgXXN84O+Q78wiMzqP86QeFCmUKQzhNZcZgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZRcM5tD45oU+iB3eQ9JLEaipg9mzEjb1q
 xiVqAAuirNVitQEv425913ahzOnprDSUxU4oA7QWwqN7AxjY5W+T5e18lWd5vFFRLt1VXHY4
 iJCwZLHqrlTU9fdz0RhXdnhApmsxNOJbR/ij2Q+EqI52zPwyVqCPrJftWQWyFhSDu4IfjrgY
 Un2sAxX5YNOMHbCUZKbc75dGOxxk/G+SI2NuuT8K4MXP8MvLFPvEDRGPxb44oz7rKQ7fUjT0
 7+/eN3kM3sVAL8PINGeF7ZEiu9DKszTKAruqXHHI/aPjOL2iJ29E+5t3L6yggYRtfLsTOL9q
 Yo3Cidy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT99W6aMnO5/Ktc/xMy5c9skG
 FnkCye0L3Kl2BX6xfiiMCg/ONsDo74hxZ7EAcDcFQnxgCVyCWpexKwea4E2bdEaGB9LlpZJo
 w0+U5zYWJxnE22fkxxENMWVhNEyJXyD2FPVVwL4MWdXQnKVb1GQkjMSVlC0r3dm4+venZZWn
 oBMISuHHstZG1UzVpq+hTDG5wrZgEXxUdlaBiPgCtJSZF/t4M5tLSnwheUwOMYCNVPIwT7y6
 upcKU5GzQURi+fZKOX0uJ0=
IronPort-HdrOrdr: A9a23:UiGucKpbHOxHQ8NDfzHCDv8aV5vFL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QD5SWa+eAfGSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnlE422gYzRLrWd9dP0E/M
 323Ls5m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUaqFh/dL5nUUtDPpZyfSKWMB26ffueChPaHbzYfJt3Tk4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.90,209,1643691600"; 
   d="scan'208";a="67576095"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4HuBDlutmymnYgqu1xs2KQNULNDPHNJ5LoZVYISpPlFkemL/bJftq3J67A+RZ4Kr5O2M8ahIN9Sj6NhM3D4JJdM/L3YjxWDI73dPdmVG4/KlmP5E1KzuS5wcnHhTIafDoMhTjjXx8Gbg4ZqLQzNXhPHABT2LJrYZ8A2FvHGZAsZHlWDmn6bh/fKl/jYEttfwfrktwZGboUBRgMhtwOcFRZAebSz45+wdGkd2/9ASu3yr3na3PNnVCVvaBfa+wI71hAb1+pEwmnlyQZglJvlJ/1ZnidbZpEGZrjaj022R7Zy7px9BnW2GspXlSJ0Y4qK23GzHlNoi8bC48MlDwYpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRkde5jMIYytM5oUiiWJYbIYwbQRB29/5B7Ecqs0WTI=;
 b=AFXE2TzSjOTRaLoo8NbLlOf7KKXIpdv6Xw09VmFltUEsyhq5dUjMtH6F3/QbjmvYMiNgKWi3ywP16Xiki29lJKuALnmvb1Bl/ZmXoIc0DH2mwMKDQk2BCjTc0+p//vNO33exuou9RNJQoK9+jCppm5KP3K9Z3OCsslaZfpfWq5Uzf2drKxHd3ul/DEiJqub+J3qdu5CPqCknHOzjBVFzalJ1Hjrl/ASYjt2CQ8sNoUfRuDi70SmOxfEE3vN8EbEitds9l8T8LpEqYht6+F+dCVgP8hRvO1mmi/0HPpffv8a07H1kRCFK9GhP7A1pecWZHcRA1k3v3SCc0b9uxe0R2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRkde5jMIYytM5oUiiWJYbIYwbQRB29/5B7Ecqs0WTI=;
 b=B+qKZXYpGpX+p5Bacd/EYiyvSUPxNTQbi51cX/voUdDAzZH8Wn1Bwc9VobxQXN7F7C7s+eoT5HCTE78/jhPw4zuepim2TvzaktX3e84ublrkf2f+g7hiNtn5jHGrV8fjqKYZKpPhLMEGJweAEKaYA0BtC3LIAXJnHrIK8IxzlwM=
Date: Fri, 25 Mar 2022 14:42:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
Message-ID: <Yj3Grwx3IZLnfEdt@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: LO4P123CA0353.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 506eb492-799e-4bbd-1078-08da0e654492
X-MS-TrafficTypeDiagnostic: DM5PR03MB3401:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB3401CAB4ED98F033BEF3E9A08F1A9@DM5PR03MB3401.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFCEIVsBzt5dcL+Enyhb4UcNIBp7jFL4gNBVP+vB4GuoENlp3FgddgUQQK+yFFJywmHFUXi9RDdcB6FNJezBHF2kUlSJ2ZEKyd8ddtB3iEWoBLnZf0QCsbpTDMWyHLYc+dt/92WLhKV7Sgd87BRozD0itlg9I3ZSOEyW0uL8U22DQgMcjol6gREAeYFznXWOEwpTqi6H/l3sjWyS6mNXqPJbaozVNxzR6ykcL8+cpflRtxIGObTo3UQTegGDGgtdatMHPvA6WeYSVL22AvYAGTHpLd8woXYJ40kHVbQCZHKCrT7R2MziCojLW7SlS4gTPZWbqzZowLlJKyeZtV061up45+1nMoSu/BxFGlkW2ok0va3yddffxq+I8vhRe1wrATVQN3n2WjSaZPqpMIM8FyYYfDd3OY0BYHZNNhIIWZFBeeOdl14fkW4ye8CH/Wik2D9AdOAQWN0rdc0fJZCAiDYfiqNRKlkO9eQQ9BGWoRbprvqxN4/scMsEV6U9MqHWXJu9K9ra6BlzhoUay22ouVOApve3RL1tB/Z202RQtE5e7hRZMQVS0mZMYuvhxEomCZYJzJClboK//F5McvWAweLQE90CwUYZQcA9JxT6Bg6b9Ml6zcL6aSEsavSwhkQlzrIovkyjFoQmHu+aNTA82w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(38100700002)(186003)(5660300002)(8936002)(7416002)(86362001)(66946007)(6916009)(66556008)(54906003)(508600001)(66476007)(6512007)(6506007)(6666004)(4326008)(316002)(33716001)(82960400001)(9686003)(8676002)(2906002)(6486002)(85182001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFiMW9kd2h3b29CRTA5TUpNaEFGcFpaTUtMbzFpOUlTWEdSTzNwWGowSk41?=
 =?utf-8?B?UnhLMUJvTEpYamxQcWJ4MTZmaUNiTkl3RjQxdkJ0TmZZMEJSdkUzZ1drRDE0?=
 =?utf-8?B?Z3RzekQ1K1p6N3Rsend1WnpvMVM2UXVKbEt3Umw4Q3FHK1RjWEt5Y0NTZVgz?=
 =?utf-8?B?Wk0xZEJxV0JUdE1NRm94bTUzT2JOMENvV0F2ZDc3bjBRVVJQQ2RRb09Ec0Jt?=
 =?utf-8?B?VTNQZ0s1SFNNMStSdnJlMHRjVVYrLzJNdmtRK1l1WnFjUVZTUDZVcTNteEdH?=
 =?utf-8?B?U3RNcTBrVkZGUktYVGQxbXZ0SjJ4RzViWDhXTStEdUd6UFlqbHFySDgwWGJT?=
 =?utf-8?B?TWpjMHZhOGhueitsbTVpeFgrZ2tOTm84Q2cwaGdzS2NDU3NPSUZuaFRzaDNm?=
 =?utf-8?B?VC9UN0xreGhYSU5Xb0JEN3cyY24zU2NoQ1dzZGlWVnQvbmtpRGpMZEI5ZEdx?=
 =?utf-8?B?UlRsTEN5aXNOZ2RXbVdsOEFNcmdrbXhWNGtZMTQxblNLcCtyQXBLYllrc1Mv?=
 =?utf-8?B?YWJWeHVCZjRrRkUvd0RWdkpHS0haSy9nRzFPdjRLZzYra3FTQzNhcnBmbWVK?=
 =?utf-8?B?S2F3N1YweC9wQ0FnbTF2UUs1S1E2eUtUN0pmM0RzbzZOSm44NXFxMzZDT2p6?=
 =?utf-8?B?YVJ1RUV5c3NIa3JjLzJhRVJEbW1pMXdCaW9qY1pKUkVrazU0ZURIajdFUVVy?=
 =?utf-8?B?VEMrTWlSaUpyWlVCSitZWEROdk1sQ25qUC9udG83SU9IY2Y5YTY1d1pPbU1O?=
 =?utf-8?B?RG0zdFlTczdPZ1ZIcHEvNTNOR3VkNTdUWERJS2hYYXIzb2NKWHRTbTh3Y1FT?=
 =?utf-8?B?dm1KbkFrY2VHWmhmUkRyQ0dBVkdPQU55QTJ2UnNuOWpkdmxvcUVHM0h2ZC9L?=
 =?utf-8?B?a1pYMFhHNU5HalJTK3pKeVp3bHNuUmt4N0o5a3N4N3F0VFhqNGRLeHNBR3Mz?=
 =?utf-8?B?U3JzK0NiU1J5NjQvVDBFMzhYMkdGMHg1YlJuays1Sjcxd2RaZXFuRDJVOTdh?=
 =?utf-8?B?ZGpUcHZEMVJIQkRsSjJ3ZXRtQ0o0QTA0OHdFK3dLa2FrTnlGdU1nYlFzQ2JN?=
 =?utf-8?B?TithdTM0RytsRXdyNWI4TllsWjEyU2lYbThXLzBHZ3EycUtjeXpBVVFZdTIw?=
 =?utf-8?B?c3J4OTN2ck9ZTWNWcVExUHJIc093N1VoTlhENWZSV0lTTkpSZTdMdG15cEh4?=
 =?utf-8?B?SGxSOUJVbnZuZTNBeVVCYjdhSFdIamhnN2JBL0pJR3oxK2swUjc2YUdlVUtm?=
 =?utf-8?B?UDhCS2JWSWR0K1YyU2lJRmI3NXZqa3ZGRlNtc3BSeW5keHlqRy9iK1hjNURX?=
 =?utf-8?B?ME9PRCs1OEZZZDM5MFV2SE1leTgxQjJmT1RRa1JKMjdCTUNXYVkySXB1akl3?=
 =?utf-8?B?MitCbnViUVRiL3M5S1hHTDRsTklNZzJ3MXJMRlhyR3lsZG4xaWo0Um9iVVBC?=
 =?utf-8?B?dXRBaGlFWFFHcGhLODNDT2tORUJWTDFkbkdDNXVQdE8wcWdSNjlXMVVEbHJa?=
 =?utf-8?B?NEl6ZmxPaHFWbVQzOVY5dm1hNnlqTGxxSlJkOFVCME0xaVpJNWdRT3UzeG05?=
 =?utf-8?B?dlJtdjdZQjlMVDJXbitUWjBOUjM3SVVnVk1zdEZwemxuRUx2SGR6Y2RXODFY?=
 =?utf-8?B?TkhBUmZaR3JlYUlnQnFVaFYxMzZVUHMwZk5GNk0veVg1S0pCNHBvOExYRm1h?=
 =?utf-8?B?ZnpjYzFQQWQ0N0x5TUdycy9JWm9uWlZEYUMva2lGRmROTTlxN1pkRERycDdt?=
 =?utf-8?B?M1Y0VXFMamx6d0JHMmRCZ3RDL2FVZVcwUDltT2FFaTBwNTZjUlM1Wkptdjg5?=
 =?utf-8?B?NWxlUXBETG8vSVpod3J5ZisrbWhET204alVDdHFjUWsrSm9wVU12UVA4WHRK?=
 =?utf-8?B?T20vSnVTanVTcCtiRlRKYjZrblVBaGxmcTJTcGpMUDgrajQ4dmFTdEp4QXBx?=
 =?utf-8?B?NUx6UkZkaU5OckRaa3hyNzJqa2xIazNBSlhwVWk4V3NseWhkYTUvWVlvWm9B?=
 =?utf-8?B?WlNyVnRSRmFjNnUxVzNEOFVQQWhNSThEdWdXWVlBd2R4SFZMOENpSnF2NE9n?=
 =?utf-8?B?NzB6OGNwVXg4Ri84ZDVyeVRWcS9PNXk4VFVPZHVWZ1hRUjNSei81Nm14Q3BO?=
 =?utf-8?B?TWdYN1A2dEk5dHdMOFNLekpkbzk1VEtzNmQxbmxNOFVidkV6UXFyQnFpZTRy?=
 =?utf-8?B?b1QvUjUxc3h2djRqa1JYVjM0T2xBY21SYjcrZWF4VW5yYy9VQkVZQW16RCs2?=
 =?utf-8?B?dzZGM1J4Y3FCSlVITDZUcUc2T2N0eGt4clZuOUFwdStsL2RNczBRbjBxdGNE?=
 =?utf-8?B?N0pHZkV5Z0hSbThUN3RRNnl2TmpHbmlGSWxhcnA1aFB0TGlBRTM0by9yanpo?=
 =?utf-8?Q?MP3d8JHWRPAAE8MQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 506eb492-799e-4bbd-1078-08da0e654492
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 13:42:13.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UNna9sCYVFh3j7w5PH4ppm/F3PVNVKEZPFlsPjLSHdCic0u6w61ZzT8UidfStb9ZpoBg/YpxQTw3k/68gD/VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3401
X-OriginatorOrg: citrix.com

On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index a21c781452..bfa6082f13 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1892,15 +1892,19 @@ static int fork(struct domain *cd, struct domain *d, uint16_t flags)
>   * footprints the hypercall continuation should be implemented (or if this
>   * feature needs to be become "stable").
>   */
> -static int mem_sharing_fork_reset(struct domain *d)
> +int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> +                           bool reset_memory)
>  {
> -    int rc;
> +    int rc = 0;
>      struct domain *pd = d->parent;
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
>      struct page_info *page, *tmp;
>  
>      domain_pause(d);

I would assert that at least one of reset_sate or reset_memory is set
here, as callers already do the checks.

>  
> +    if ( !reset_memory )
> +        goto state;

I don't like using labels and goto like this as I think it makes the
code harder to follow, and so more likely to introduce bugs. I would
rather place the memory reset parts inside of an if ( reset_memory ) {
... }, but that's my taste.

> +
>      /* need recursive lock because we will free pages */
>      spin_lock_recursive(&d->page_alloc_lock);
>      page_list_for_each_safe(page, tmp, &d->page_list)
> @@ -1933,7 +1937,9 @@ static int mem_sharing_fork_reset(struct domain *d)
>      }
>      spin_unlock_recursive(&d->page_alloc_lock);
>  
> -    rc = copy_settings(d, pd, d->arch.hvm.mem_sharing.skip_special_pages);
> + state:
> +    if ( reset_state )
> +        rc = copy_settings(d, pd, d->arch.hvm.mem_sharing.skip_special_pages);
>  
>      domain_unpause(d);
>  
> @@ -2239,15 +2245,21 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>  
>      case XENMEM_sharing_op_fork_reset:
>      {
> +        bool reset_state = mso.u.fork.flags & XENMEM_FORK_RESET_STATE;
> +        bool reset_memory = mso.u.fork.flags & XENMEM_FORK_RESET_MEMORY;
> +
>          rc = -EINVAL;
> -        if ( mso.u.fork.pad || mso.u.fork.flags )
> +        if ( mso.u.fork.pad || (!reset_state && !reset_memory) )
> +            goto out;
> +        if ( mso.u.fork.flags &
> +             ~(XENMEM_FORK_RESET_STATE | XENMEM_FORK_RESET_MEMORY) )
>              goto out;
>  
>          rc = -ENOSYS;
>          if ( !d->parent )
>              goto out;
>  
> -        rc = mem_sharing_fork_reset(d);
> +        rc = mem_sharing_fork_reset(d, reset_state, reset_memory);
>          break;
>      }
>  
> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> index 84cf52636b..a7b192be0d 100644
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -28,6 +28,11 @@
>  #include <asm/p2m.h>
>  #include <asm/monitor.h>
>  #include <asm/vm_event.h>
> +
> +#ifdef CONFIG_MEM_SHARING
> +#include <asm/mem_sharing.h>
> +#endif
> +
>  #include <xsm/xsm.h>
>  #include <public/hvm/params.h>
>  
> @@ -394,6 +399,15 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
>              if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
>                  p2m_mem_paging_resume(d, &rsp);
>  #endif
> +#ifdef CONFIG_MEM_SHARING
> +            do {
> +                bool reset_state = rsp.flags & VM_EVENT_FLAG_RESET_FORK_STATE;
> +                bool reset_mem = rsp.flags & VM_EVENT_FLAG_RESET_FORK_MEMORY;
> +
> +                if ( reset_state || reset_mem )
> +                    mem_sharing_fork_reset(d, reset_state, reset_mem);

You seem to drop the error code returned by mem_sharing_fork_reset.

> +            } while(0);
> +#endif

I think you can avoid the do {} while(0); just using the braces will
allow you to define local variables in the inner block.

>              /*
>               * Check emulation flags in the arch-specific handler only, as it
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index 208d8dcbd9..30ce23c5a7 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
>                  uint32_t gref;     /* IN: gref to debug         */
>              } u;
>          } debug;
> -        struct mem_sharing_op_fork {      /* OP_FORK */
> +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
>              domid_t parent_domain;        /* IN: parent's domain id */
>  /* These flags only makes sense for short-lived forks */
>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
>  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
>  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)

For backward compatibility purposes should the flags be added
backwards, ie:

#define XENMEM_FORK_KEEP_STATE        (1u << 3)
#define XENMEM_FORK_KEEP_MEMORY       (1u << 4)

So that existing callers of XENMEM_sharing_op_fork_reset will continue
working as expected?

Or we don't care about that as the interface is protected with
__XEN_TOOLS__?

Thanks, Roger.

