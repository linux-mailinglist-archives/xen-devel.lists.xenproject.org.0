Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA08753CFE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 16:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563661.881019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJbJ-0003GD-35; Fri, 14 Jul 2023 14:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563661.881019; Fri, 14 Jul 2023 14:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJbI-0003E8-WB; Fri, 14 Jul 2023 14:16:52 +0000
Received: by outflank-mailman (input) for mailman id 563661;
 Fri, 14 Jul 2023 14:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIDz=DA=citrix.com=prvs=552896509=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qKJbH-0003E2-Pe
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 14:16:52 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0efeed81-2251-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 16:16:48 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2023 10:16:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6983.namprd03.prod.outlook.com (2603:10b6:303:1aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:16:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::f3c4:948d:a70a:de2a]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::f3c4:948d:a70a:de2a%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:16:34 +0000
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
X-Inumbo-ID: 0efeed81-2251-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689344208;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z/UviPzAr2Jb6nh5ZiFajggBrwubaESZiky78CfUFL0=;
  b=EBYUle/bQ1kdYwHMdA667sRT+ZHQdvLylo7RZmzZJukj7P/u7K4U58Ek
   HMv+DAiOtLXbhKqTXzLC3ukO1wfIGtOOviJLyWriwZb1MDxem3KkdHDp9
   0Xeq4Q1NViWNIegblGVVVxrrKzc5vLqmc1Kfu/qK0yolHx8dz0o67JLQl
   U=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 116260139
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TzGXuqyZ/hL0CNx/pnx6t+e7xyrEfRIJ4+MujC+fZmUNrF6WrkUBz
 jEbXDuPb62INzD8f9snYYW3o0kPuMXQyYA2Tgo9pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKwT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWIX8
 PInAzZdUjmKicGWwfW6UfdCl/12eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMtuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdxISuXhra8CbFu74DU6Vi1HfHKHj+SYml+6XPRxA
 A8M0397xUQ13AnxJjXnZDW+oXWDuhdaRddMCew86SmH16XP7gCWQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQA3B2IfYS4PTSMe/sLu5oo0i3rnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYjyKGT7V3BxTW2qfDhTBMx5wjRdnKo6EV+foHNT5av41XB8fEGJo+WSFCbt
 VAOhseF4eYBS5qKkUSwrP4lGbio47OJNWPaiFs2RZ05rW3ypzikYJxa5yx4KAFxKMEYdDT1Y
 UjV/wRM+JtUO3jsZqhyC26sN/kXIWHbPYyNfpjpghBmPvCdqCfvEPlSWHOt
IronPort-HdrOrdr: A9a23:3eusHq6YCAIktQ+JtgPXwOrXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwX5VoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eB3OBjKadZ/DBbytHPuQ4D9QYXcei1UdAc0+8XYjzra3FLeA==
X-Talos-CUID: 9a23:Yp41sW6wdhUkSbNVQ9ss9xcRFP8OdC3h5X7eAG+5TmdyVpOEcArF
X-Talos-MUID: 9a23:dsYxmwowAEHUmZuf0/8ezxc7HZlYso2HNG4QsIUXv86iGwczIx7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="116260139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKt90J/R28tEpJMUHcwXkZt4jPH4u/eXzjPX000lK2/0tKckzEH4+RLQJHn2CHH5fjhFsWfQLXx3XfROpcTb9Rp+aabspJyL6zcj9hk+opY9aNr1ZII1E8J5CLQe3pxMVciyZf4th2zbPGgQnpa1J/D5KUxjV9+LcmOzh18v5LSU+M51RTpyHUPcIqj5Ot7BzyYy7jSuRVAK/aus10yIQVxlGfBuM3x7djP9FUcHfrsQRwo/eALWld+eiEyKwLPyzwH+HF2ExtMWNS/znef/z3Qu0SJf9JdLlkl3SlR9TCWtuym9mnimesCkgzSpmNGxRsrWUTZjylj3vvcLswWf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/UviPzAr2Jb6nh5ZiFajggBrwubaESZiky78CfUFL0=;
 b=mW/ZUp091rcbBnHd9c5T4CbAldLv1ntZ5xDoTcORHIzvKnEzPB9cPuUL5WvC46wK7T/Jv5jjkzRHW8Bie0Fxp7kUx3ObuYCdfAhWbOQGsoSXigZFDJQO+ku06+kz1KUjOrwzM70xbPT4NwC8dkaOBmzhhY4QZZ3IA75T9UCYJcVcSabUO2pqy5aSTjqrB1srIZZJXHxIhEEvMJDWwcCn2vt7b1BxMLa9AJGX2/BTqam3JTLZMI3Cx3NZmYvVY9IS9HE1XDEDDKGvmRIqFDURBQUBX4SBfOEbz0gUEkkJOAKNY2qyEGT+quNUUHD17CH0onqrLgt0frOqvmvmDP9GIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/UviPzAr2Jb6nh5ZiFajggBrwubaESZiky78CfUFL0=;
 b=OeyHCae1J5PcrRCf39BnJBY6k/PaND57N8tzsrmIKsuDR49bL7AIYpcWgL2XsGG3CwQYxFSq8qTXC6wsECbP6uXdpj5D9w9pIPkOjilE0fYbBSVHXS3vbs67SQ1SACmwGi8m2ZyPRmjpKGlDX7ZGU5lfHEhlq1u5UgZAHYXyohI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9fbf85e3-f07d-db50-ed62-7e10b33c34a2@citrix.com>
Date: Fri, 14 Jul 2023 15:16:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/ACPI: Remove the acpi_string type
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <20230714130411.3055187-1-andrew.cooper3@citrix.com>
 <77b82911-a6c1-d23f-e42b-132d928e6603@bugseng.com>
In-Reply-To: <77b82911-a6c1-d23f-e42b-132d928e6603@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2c2890-2b30-4884-9491-08db8474edd3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MaoLdiz8O1R450oCkFO5syhe2x+wfIQ7yeJRVlRxa/qoqZLmuK0PdcegEkLFTSfVPUQ0GQJN6tiL0XChQj6HL2+mJEEiXn6xxRrqd5puW5rG51hnK6vkyFqCJj8n9f5RGLwCUBk925O/R7njhuDSMJwHkEHRxOrhEmMJQ6tc+YW/axrCpzHS+irpU5WF4cZM6qy2Vw5slh8MvI2Ft/7GDkuUUxo+fBrRzvpFkbS/Otl9jIC1XxxwSbzA85bwVy6OhNFT09NwyWzAHiFw3FhJ0iBMelCi5YOLkmjfVIuesin/7F+MR+WG5aj6/RM/aeuXIMtHKuX7eKj+gFQsKrQwjSBRnXXU/7qTP+xHLuyB8aa6v8TlqyskZiuDbhkQEgBSLenR3y2xJyyvcuFxksJd6FHQaJHL1jW01Bfsw/cdKIu7h07YptxEVAGDrNeJbZo7tzGpAVSLkyLW9ocIk6kSMzUGeBJVmntnLoYt4KCMqYTbITNdYEJfSZoA9je95DHYx95Jq1rZTP9ez5C71pFG9iwyo711l1Vslr8DPy5PIGz8zkgW6t80kmxAOrxiGMoThCiCCQX6CI6JLYnrsnG4IbTccbkpstNLxHCTS46vcoPK2dD3qwj7EtuChGsYgsNwBg8PsoYi7czOkQJxEDyYJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(6512007)(83380400001)(2616005)(66476007)(6486002)(478600001)(66556008)(316002)(4326008)(66946007)(2906002)(54906003)(110136005)(6666004)(6506007)(53546011)(186003)(41300700001)(26005)(5660300002)(8676002)(8936002)(38100700002)(86362001)(31696002)(36756003)(82960400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTd6aGtBR0loVzllNFVkZmtBaWZKY2xWZzJmVTJqYmhVa3dhK2t2a3laZTk0?=
 =?utf-8?B?b2hWdjhPeFBtMUlTNDhUVmxaSnB3QVdaSU5VcVpyZGlHc1huY0l6V2xEL2lD?=
 =?utf-8?B?OFh6c25yd1pOeU5nOHBGZ09kVGdneWdLYmVCNkE2UUE3UFU2RExoUWVDRHZJ?=
 =?utf-8?B?b1YyWnpjaFQ3MHhOVFRsNjZoczRsMWY1QUZwU2tiaFU1MkJlamFuMlNqNXZ4?=
 =?utf-8?B?bkY1dXhKampJR0VIMXM5RWlicDFTUGJIaHpLc3ViSEFGSkluejJPcXZQUFpK?=
 =?utf-8?B?TVhFbmx4Ykkrdy9EQlRMNDV1SC9wcGZ5YjNoN2dXV1Y5UlprMHpqL1VFZVRi?=
 =?utf-8?B?MGxySGZrc2RkcDA0ejlTc1ROY05kMk81NWlISE9LNUd0aFhiZHhRZE1LL3Fu?=
 =?utf-8?B?WnJZdDZRSVpNQkJEbFZaT3RTQm5YRjQxcWZLSEhNdHpTK24vREhYdzdvY1lY?=
 =?utf-8?B?RjA3emhIZnM2Mi82SURTRno4a1pRbkFTNjQxNDB3RGZkeWp3Qjg2NGJKZzEx?=
 =?utf-8?B?elhVYjVQbHM2S0ZNWWhEQWtka0tPOHNvZGZvbThXVTUxNkF1QTl6eXhCVkdM?=
 =?utf-8?B?Z2hIdndhZFBYclM3eUFnMWpERDkwWU13bUpnWjI2WjkzSzJ1QzRyYXlXOXdL?=
 =?utf-8?B?TFdVM3B5UHA5L2xjLyt3eElienBMb0JMOC9xaVVaVnBOWGhlU2QzUWtlaVpU?=
 =?utf-8?B?YmFiRXl4Ymt5N0RKVGdIaERMejNXb1EzUDc4R1ZkeWFyb051QWtvK0lGY2ly?=
 =?utf-8?B?eHFyYmNhcWtXSXFLRGk4VExhc3duU0NaZzNuY3FBcnVlK01xaDVUTk5seWFB?=
 =?utf-8?B?TmNvRDZ1RWpmaGVHMzR6S2pFOFdqSWc1cFVuMUNDdW1TRDZDQWRRZVFjS1Fl?=
 =?utf-8?B?WFM4Mk5hWE1VeGFCOGJTMXpXQnlTdmhjOVlIZlpyc3NhSVIya0ZVeEpBOXFG?=
 =?utf-8?B?TlpNQy84MFdnMzQxQUQvbzYzb3hLMzhPU0NHZlM0eDAzNHdSQkhwSEozSU56?=
 =?utf-8?B?UkI2RHFwWXJWc25sd0JWUWZObEJzM2JVNlk1bTE2KzcrdGR1bGhxM1VhRlZz?=
 =?utf-8?B?U1ZFSUtsTG5EclhURTdXM0NJazhtd2tIWUVDU0o1WHBMdXdSb2R3SCtIVWd5?=
 =?utf-8?B?NU9OUGt4bjNTQmU4YVBKTytYbGZoT28zS3ZtZTAzZVQreUtQb0hvbDFpSjdF?=
 =?utf-8?B?WFFzY2pZNEZYRWo3TTJVaG5xWHpBdzNTeG83Z0JuTTA3ODZPRG01UCtQK3Ro?=
 =?utf-8?B?YUJWR2dUOTNWUkZNdlFzZ0x5SlQrOGFRVzdhY1hVTTVrSDZITEt5Qy9kNm9F?=
 =?utf-8?B?Q3FENUd3RmMvN1RoNGdlRk0xS2VvaVNwenA1UW5ZZXIyMXcwcHZ1V1NIZnZz?=
 =?utf-8?B?dWljN2ZETVd6bDg1c1Z4SDhoTU5PaG9mK2VUQlNjaTQ0OWxSUTU0ejNMSXI1?=
 =?utf-8?B?NStkUWxFOFlGdWtnTkY3K0toWGp5cmptdDBhQ2owT2pJemwxcklNV2hCRGZh?=
 =?utf-8?B?OXBYVzI1OVdBUjRuMnZMSURHN0ZoUWlDZkVoWERwZjVmMWdDYTF3TXNzVnFR?=
 =?utf-8?B?NkpFenZjK3VoaHpES1VwRWFSZnNwbmx4SE1WSStiUE1ETjQxcFp2VnpxM3dt?=
 =?utf-8?B?NTN5bU1ONDBHS0c4aFI2eXJCNEhHV0p0a3NXNzRsWkxDaGp2b0VqbU9yZDBv?=
 =?utf-8?B?SGFITW55dmhBTnpQcHorS1NFd3JVQmROYjJmQUdDaWFvL1YrdHlSb29VNDc5?=
 =?utf-8?B?M0JCZTJNMytsTE1SQ29NNzZLeURpeW42RlJpYUdmaWdWL3g4ZDBpZlhkZlU4?=
 =?utf-8?B?Z2MrcXFtSHpCOSt3SmdOWHR6SDM0cmpyZ2k2citSenlSQzRXWUR6Qyt3WXBF?=
 =?utf-8?B?am5QeUlTRUFnWlJ2dmFIZkxxUnhJNVo5ZXMrSVlEKzd0SnI4QTNTME9rT2N2?=
 =?utf-8?B?Y1lVd2dIbzZxK0ZWMldzV2tOUVMxMkc5VlgzSGgyRENWYlVMNDg4WkZIeU1a?=
 =?utf-8?B?YlcyS1FDam5sR2JOaVlNUWplK1QwVGNzVzRBdlRMbStueE9iS3dTMUZlelNP?=
 =?utf-8?B?S25oRVAvdkd6cTkxMGIrNjZqdWswRmV1UldKeVVuZFc3cHFuSnUzZ2ZOenlG?=
 =?utf-8?B?dnpucmFVWCtHL00rU3N0UUQvd3RWUFlwQVNlTTlDMkRvQWhaaDU0a1AwRFd4?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yEZO/Ss+O9zHanBZuVcfA61hli2gel5W3Hb5nXlcfoPBgHRLRhDmM53W/aFEt/m6sZP5UvmJQ6ASmBS4h2Eh0kypAnfzJ/Ru5np8o/f6vRZQk9zr57t3hTykgzwiipWoLFpz+XNgkEK7/RhbiUPkq/PaHlt7KsX06WnWGp+L3t682EejZI/YblB2nqPj87XwPazs7DTVriZysHO0mdr5h8IbnMasQ/e/j/Ha2GsHHVm3/LamzIY2py2zLIAfq1/rK1/2tfm78x8EOKPMOqKhEQFPGbUqvYAI7nffEpJaeePiJvHa8QTtxsdPILHJAd1nyHLWoNJBwhZ0ZmuA2kP8sqUSStWGcRap3/VGW+GY6nQDBTbUvhE01KaVa7MuYPR8zDLb64U4zDtHcWOf41c4YIc10ivjyxItStQye8LMPlLBkIHDrnf6NNbqY+j9xiBjP5RAqTdOJ4U+1uWI0PdWMhpsPFlS5SPB1k2mkcwUyIGhecaqmwk32oYd/WHAJBj3tborG5l7JMML6WG+3FURSMCddeixBbfAb+6oiE86djkf1YodAHZi7OBSIK2jdfEDgANrNnZJqnwwEZfh3gDVEdHrD/09pVN0J3cNFIzVju85xorfrUew0IuBokQzbrRRZ5uU/26EQ3NOs5R91HVgSPSSVLilWNgY1Lh17SnZHO+Ne/yzhGyd9dn5JYddRSx4dxtGYjWWbWv5S5iEaH9AQn1cu1chToBMNjaZe8nmwyXkncDUwoHkg4deBhh8RIp6gqQhWXEZ0VYZ9ztpgScPgc1yyq6mckqfskt39N3wb2QNQqLiCbSlLNnpi9XDumO2L6sNgOGAboY1mYdD+w2NQMuAWAoMIYNMydb1LuoA3jOWBAzNVODaiMjoXCO4rppQ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2c2890-2b30-4884-9491-08db8474edd3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:16:34.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zxhG7Rr+8x6Xk/F1SAeU8bYq38gdRIzo9scxMCetGobPN7M68fKlO6jHJKLvo365G9EpBMQy76o/5nPtcnOpFm5+WoDhm0NjcMbcJGvfXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6983

On 14/07/2023 2:44 pm, Nicola Vetrini wrote:
>
> On 14/07/23 15:04, Andrew Cooper wrote:
>> Typedef-ing a naked pointer like this an anti-pattern which is best
>> avoided.
>
> s/this an/this is an/
>
>> Furthermore, it's bad to pass a string literate in a mutable type. 
>> Delete the
>
> s/literate/literal/

Fixed, thanks.  And the 3rd typo below.

>
>> type entirely, and replace it with a plain 'const char *'.
>>
>> This highlights two futher bugs.  acpi_get_table() already had a
>> mismatch in
>> types between it's declaration and definition, and we have
>> declarations for
>> acpi_get_handle() and acpi_get_table_header() but no definition at
>> all (nor
>> any callers).
>>
>> This fixes violations of MISRA Rule 7.4:
>>
>>    A string literal shall not be assigned to an object unless the
>> object's type
>>    is "pointer to const-qualified char".
>>
>> and of Rule 8.3:
>>
>>    All declarations of an object or function shall use the same names
>> and type
>>    qualifiers.
>>
>> and of Rule 8.6:
>>
>>    An identifier with external linkage shall have exactly one external
>>    definition.
>
> The choice of rules looks good to me, but perhaps Roberto has some
> additional insight on this.

Thanks.

~Andrew

