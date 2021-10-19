Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B54333B5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 12:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212947.371008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmX3-0007D4-OO; Tue, 19 Oct 2021 10:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212947.371008; Tue, 19 Oct 2021 10:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmX3-00079f-Kd; Tue, 19 Oct 2021 10:39:45 +0000
Received: by outflank-mailman (input) for mailman id 212947;
 Tue, 19 Oct 2021 10:39:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcmX1-00079Z-Ts
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 10:39:43 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00c609ca-cc6a-4d8f-87f0-e73cae0f4d9d;
 Tue, 19 Oct 2021 10:39:42 +0000 (UTC)
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
X-Inumbo-ID: 00c609ca-cc6a-4d8f-87f0-e73cae0f4d9d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634639982;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=R6f87ZB9r5oCuJ6Dyq8GQuBUeCnRInzRdcauC3tGWiY=;
  b=ZWXp0+vkmNArtQ47AxiRgi26VNCu07vD4pEyKnVOtYfL747FdbpO6awU
   Xouvu+OPMwOQemyvLpfwl+RHVGr1O6VG11k5Aw51+L0wfvJmfFQV7bovh
   bYVhJG+O13N9FV5pvprLrEUmWFYrxf72zCCn4Q4rmCgQLvJXYj0XhCnx7
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3EBZJGLoi4qLlV6fXcwGF4edLmLbk6gznL00ZqNUTTUNFp4n7c+hv95NZifF2fmiFZMOK+omVQ
 3YGWsRLGTaikmg3FIdtZz6BsH34vy1SLlkUSrHuO7UELqg7W9yMbW291VJlTkC5la9OZbPip8h
 HTrE9/SOHm7rmYIA4Hjy/sZFrzjGre9EXo4xKNmsVMx4WFMNfqsbCojO4XWL+265opm6DjtVMh
 EKqvwh6fNuoihcZXHIgwqEGylp4cZTQcZiWfHWTkFGs+DuWb7dPd6VBxbFReis5P6BXm4ipRlY
 vD3AYcUPDwuYgJdA14W6oZK5
X-SBRS: 5.1
X-MesageID: 57416952
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ww52Z6OHVGJ4NHjvrR1xkMFynXyQoLVcMsEvi/4bfWQNrUp002cGy
 TRJWT/QP6nYZDSheIoibIm/pE8Hv5GDz9FrTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Usyw7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2XXjo96x
 oUVj7PucwMYBqrjut8+FAYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iVuYYGjWpq7ixINcTUf
 ZIkW2Q0VSrBOT5XHH41VMoMl+j90xETdBUH8QnI9MLb+VP73AF3lbTgLtfRUtiLXtlO2FaVo
 Hrc+Gb0CQ1cM8aQoRKH+H+xgu7EnQvgRZkfUra/85ZXbEa7nzJJTkdMDB3i/Kf/2hXWt89jx
 1I8qnQ/8qM8pBSRYYfHWyyAp1GmhT1bRI8FewEl0z2lxq3R6gefI2ELSD9dddAr3PMLqSwWO
 kyhxIyxW2Q+2FGBYTfErO3M9GLtUcQABTZaPXdscOcT3zX0TGjfZDr0RdF/DLX9sNTxHTzhq
 9xhhHlj3+tN5SLnOqPSwLwmv95OjsSWJuLWzl+ONo5A0u+fTNT1D2BPwQODhcus1K7DEjG8U
 IEswqByFtwmA5CXjzCqS+4QBryv7PvtGGSC2gIyT8N/r27zoi7LkWVsDNdWfhcB3iEsImeBX
 aMukVkJuM870IWCPMebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRvPrV/lSFr
 YwBXyZIoj0GONDDjuDs2dd7BXgBLGQhBICwrMpSd+WZJRFhFn1nAPjUqY7NsaQ890iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:reyqYqx7GLW3zNJM/+S9KrPxv+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WB3B8bfYOCGghrTEGgG1+rfKlLbakjDH4JmpM
 Ndmu1FeaLN5DtB/LbHCWuDYq4dKbC8mcjC74qurAYOPHJXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAoqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocXTbqjVQGdgoBT+q3pYpxqdS32BXTq+/blkgS+pUoJjXfxn6ck7zE9HJFUcegN2w
 2LCNUwqFniJvVmGp6VP91xNPdfPFa9CC4kAFjiU2gPK5t3T04li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.85,384,1624334400"; 
   d="scan'208";a="57416952"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHyzbpIRaQ2G7OED3Q1ye5vJTdqYjDIwjQwQ1HG/QP+am/vclBvS56i0fiz3tQNG7JvsqmDhAtdxNfxg2DN+CDsMc9r7jbkbqeyAMjXR3haB8sZg/LZEabMtm2iNU3+8PpQLE7ghtSTGlF1qzfSNIZJxy74a8ZW75JPGn+2984kvWQUqgND7eHwE2l9IgqXigv6dIjCpNn8VrEtjqly4V8EVGZsCusgbyaCHf2Mhj5Qv69zSPjvHZZNSfCYobWGgzS60X8YIthXUEJsAAColLNmUHeesdsMQwFWT7N0nBsJWzUY8bM6FY8TSn7YKPnoUmffQQzRQ+8JNnZPIoJ4/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFL4823SNII+1gV4BV56gIJj/Nh4nt3/c1MGH8Press=;
 b=HMzB4jOJZKb/oJ7ER7nzwgfee+YM4vKhk8+IuS372/GazgvGvT+lwBwAkj2Cff3fEXVevTlXiiZ/CeS8EMu36Jtbn1oUAnTdbg8SJutkZjzlTr5NaWumgkQSsblwst8Ux3wHaEEsfOaDEN2n0gVMy450skzecXa2F4XsJz2dtV1gGshT+WU/gtbO1dZINm6/0wFHlbV4KEsCV2Y+n4GIY1YWydb4PSNZ93+vgkdj6kQk5JFmJFNuSDR6c3XmcE01tLIKfw2/vFcdECUt7bIzoe9i9vjH7WCqfAIOL6SE9s0hob7se6h5h+YVUlNqqXZ3yzbWPMcYcQubDFH+vttg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFL4823SNII+1gV4BV56gIJj/Nh4nt3/c1MGH8Press=;
 b=F3rYooIKBCSm4blU07GztDSMOOqvJcZlad3kcdtlgn6T8d9wSQInaWliknI/tTAjO5UUjs/FVwpCOy/TDMEc2k043ep42s5S6Wna7nWvWWH/QrMqKeO4jSlXl+ge8ZxSfllUTEG/HQ059tzcPcrCGsxwEBW4wVtFSNQ35C2i1zA=
Date: Tue, 19 Oct 2021 12:39:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
Message-ID: <YW6gR6L0UkCm97aM@MacBook-Air-de-Roger.local>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
 <YW59OUi9tpnGccl7@MacBook-Air-de-Roger.local>
 <fc543483-bc67-1323-6db1-b335bbdc4238@suse.com>
 <65a88325-909a-7995-4ded-c9d77b386129@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65a88325-909a-7995-4ded-c9d77b386129@suse.com>
X-ClientProxiedBy: LO4P123CA0149.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2418346-b5a0-42ac-fedc-08d992ecae93
X-MS-TrafficTypeDiagnostic: DM4PR03MB6062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB606279BA126E0BE45117F5528FBD9@DM4PR03MB6062.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: enoD+BBcRRok/yZuv0goankJd854O1O7MCXeEgES94YdsZRh6bTigXcw//Ktdy6QKlAKDQ+wUUPzb+4EsNg8HWKKArA7lb/+rXdrWuStNTTDmmpIAkuCpDDqD+7ozX2PJbeXa6vsNvGfN4YyvBNbtpA9gGBPobfhk6cEBmErJU0WxwcyPl7oDAY1MIvrTFi44Drk3IeSFJx49OCD3IOIn6hcxLLjsmoCsWkPTFZ/hEbgZdxqWl1srWDmQBLIYGAimAguLVP7w4Yd2ecuQGR3OUcugTDsGPehpWQV3x6+jge86ZQAs1pcn/T/tW2UqcFCIrjQxiczKN5GAIIPsxHHcqvLm3fW/5vK6ZlEq0hIKlt+iaafxe/94Fw6At2/a2z/eRn10043DSUR3TlvPXuJqPCrhyPkRtUz+WkYSZCJSy1Xdq2RbJeTSdYc2gPLGAWNPBvH/UWkgxqYHWdAa/GPojyMf1qVyy0NtLFExypSn8LqvxTmPnvnx8efXRMI/3s6NXYjOgtYzK6MK5CL2TnT8epF5NCn23YU/FLuzznpB27YAMvQqWoHyVWYWvsvmID9UrixpxHZRlpXgka5XpQ3CjfWZ7XPg35CfmFQYhora++Vd/IcuFqnpdZ7WCPIH/itF0fAmRShRbClsdxCCO6WFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(66556008)(85182001)(83380400001)(66946007)(316002)(86362001)(26005)(508600001)(38100700002)(956004)(8936002)(186003)(54906003)(6916009)(66476007)(6496006)(107886003)(4326008)(6666004)(5660300002)(53546011)(2906002)(9686003)(82960400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxvZ1E3YjB5U0Y4bzF2d0s2NVozNVlnVWxJb01vOU9jemVQZ2tTMzVweFBX?=
 =?utf-8?B?RTE1MnFhK0V5Nkl2eDdxNWJ6RE1TbG1xNkhFMnNBMlJLdFcwV2s5b05QSGZP?=
 =?utf-8?B?MDEvZGhYVlVVQ1BWelRoOHFOZ003Ry9wa1praXFxRUFOcU8vNGJ5V25PK3RJ?=
 =?utf-8?B?WTZ6RG14cXR2M1g3RHdJdzBpSGJuaGhkSHMyY2FJeGtrc0JvU2ZSUmZGNFp6?=
 =?utf-8?B?bzk2MVUzejZvcTJiald0SUJzYk1LQVZQTE15ZGpPcDlkeXpGRVE2NWJJOVpY?=
 =?utf-8?B?Qk1mdUNlVTFaemtkcURCMFMyRHN0K1JuUm54ZVRzcVVnUHBodFlWU2xCeUxH?=
 =?utf-8?B?YWovUFAzeXFlSUNlSldxMlRmTEtlWkhMVGNqdHZjbGJoWWMvMzArT09rU3hD?=
 =?utf-8?B?ZklRMzNBcllNOEFLeWRvYnNVQXd2aEd2cmxWelNuSFJBdzRmM1JibTlwZ0xN?=
 =?utf-8?B?SHorZHRDTHRkaVUrNmZVOEh2aS9MVWs1cHJ1VTV0ZGxnbzVlYVFXdFdWZEpU?=
 =?utf-8?B?SUJCQWNKN2dKcWRYbUxzYlVaRWNzeEZzNG1PSTllcFBOY3RzTlQ3ZFBLazVQ?=
 =?utf-8?B?L0cxbzhVQVFsUTNzbUZ4QXVmRkxJdE85VmhkekRHVUNSeVhydzB4S2dRWG1m?=
 =?utf-8?B?VE05SDZMWjFPUkpMRG0xR3ZkZlp6Qm5RbGFYKzdsZGYwbXZ5KzhaV1hUb0g2?=
 =?utf-8?B?ZE5NSmJtNGlRUHhBYVZHK3N6S01XQVNNRGVvSUhwYTd6V2pucWo4eTY0azRJ?=
 =?utf-8?B?Z0lXazNUOTZDSTAxMTdTOEFyU3ZOTGNIZ3NiWm8xTnZGTnR5VHpRd05uY20w?=
 =?utf-8?B?eXpmdjQrVitSakNYMXVmYVdpcjVQRmZhZndrRHlCbGpVaDEzbUYxQW5pUi9J?=
 =?utf-8?B?QVc3djBxN0s5dUtVMXpKQkpuTTVrL2EyaU5aMEJSRTlSSE5QWTdRTHVzYkR6?=
 =?utf-8?B?M1N2eGYwMjJ1NFoyYkFHejFRTFp3NjJuQWRzazJFSmN1L3FCemozaVdkMFRG?=
 =?utf-8?B?dFp4d3pqcDd4V3FxQXA5UWV3QzdCMUQxWnVZZTJXRXlqcnp6MVN0SVlubmxM?=
 =?utf-8?B?TlRWa29CMnNJWGNzbVZxQi9LM09zNW84N2lGNmFpMWo1TnFKbnhsSytlR1dw?=
 =?utf-8?B?ZWV0ejRHRWJnNytybkd4WjJLU25nKzdES25EN0EyME5jTm5GclZlMGpPL011?=
 =?utf-8?B?M2xPUFN5ZVYxckFTYU5KOTB3NDhNKzJQNHFFMVllLzZTb2VSY1BLYWpsVFhM?=
 =?utf-8?B?MEQrcVVGamRNM1h3R2JjYXQvRFNwYjhENVJYNDY2YzBsVmRaNDVObk5GTzRz?=
 =?utf-8?B?VWNzdHJEbjUxVDZySHRNZzVrcHF3QWh1R1VtYjNlYnh4cjhYYndxVUQxMEov?=
 =?utf-8?B?Vk1SbFBqYzM4UFFlUHp3RUNkZmhKZUVxMytSNFZPeW00NVIrSCtwMlN5MDht?=
 =?utf-8?B?MW81ek5NZ2RFYWRHV1hBZU5XZ2RXeHhBdk9Ibzg0S2xiZmg4ZDdUMU1LV3M0?=
 =?utf-8?B?Q3pZdnpXQ0tRRUdYSmJjS25Ia1Y2OFlId2tIRGh2TVlBcXFGeXFtejlsN3Zs?=
 =?utf-8?B?WGNYYWt0K3k2L1B0eFhOb2JyZUhJZlBuN2Vwa3dieGlEc01MYUlwMlZ1THVT?=
 =?utf-8?B?K0RDMDdmK0NabTRVcWtMRGgxNlpSWVlFajgwTXVRVnpRZ0w4VHVmbjJ4aDBE?=
 =?utf-8?B?TC9QaTkwYmtqNzVnYUd2d1lzV3NiZVRYT1ZMbG16S2E2cE1QMGxkaUJ2NWFY?=
 =?utf-8?Q?PLHxsYGGZatmdRx78pUqUW8FusajGJ0Ayef4/EV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2418346-b5a0-42ac-fedc-08d992ecae93
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 10:39:09.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RREVW91fJJQLVfo4huQbngAcAvvAcQd0bsVZGhD9ulvmPHS8ecm2QaciYfDqQ7R8IXqcdBXjmM7SVZC2UuVzpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 10:19:57AM +0200, Jan Beulich wrote:
> On 19.10.2021 10:17, Jan Beulich wrote:
> > On 19.10.2021 10:09, Roger Pau Monné wrote:
> >> On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
> >>> @@ -1229,8 +1242,9 @@ p2m_pod_demand_populate(struct p2m_domai
> >>>          __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
> >>>      }
> >>>  
> >>> -    pod_unlock(p2m);
> >>> +    pod_unlock_and_flush(p2m);
> >>>      return true;
> >>> +
> >>>  out_of_memory:
> >>>      pod_unlock(p2m);
> >>
> >> Don't you need to set defer_nested_flush = false in the out_of_memory
> >> label? (as you don't call pod_unlock_and_flush that would do it)
> > 
> > Yes of course - thanks for spotting. I had pod_unlock_and_flush() here
> > too initially, and when switching back I forgot to convert rather than
> > just delete that.
> 
> Oh, wait, that was on purpose: There's no point clearing the flag
> when the next thing we do is invoke domain_crash(). If it wasn't
> that way, I don't think I could avoid using pod_unlock_and_flush()
> here as well.

Oh, I see. We would need to be careful if that domain crash is ever
removed.

Thanks, Roger.

