Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46374F290F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 10:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298592.508683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeUo-0007zI-IJ; Tue, 05 Apr 2022 08:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298592.508683; Tue, 05 Apr 2022 08:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeUo-0007xH-Ew; Tue, 05 Apr 2022 08:25:02 +0000
Received: by outflank-mailman (input) for mailman id 298592;
 Tue, 05 Apr 2022 08:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbeUn-0007xB-8A
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 08:25:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e06a7468-b4b9-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 10:24:58 +0200 (CEST)
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
X-Inumbo-ID: e06a7468-b4b9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649147099;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=N/h3seUITsDLiOjX37aALlKnBwlXbSQIyPope24QLmk=;
  b=OCctpRAcLpR2qCA5Coqc5KbNcmBg9CkApAdNMJUu48MUOh+LPLvkxHG3
   93E62mv1fZ6SUanKxi5J2Cn7nqTYfMDNg9kj+y1+s0PPG/qrNjEakMzem
   cHPcPJFqQpODDtvKknzDl0OC5HfOWOYrGxb06GnCR+YpE85cAfdhxLBlL
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68020584
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bSYuYKoL8+sOz7zjd7UTdoMM/aFeBmIPZRIvgKrLsJaIsI4StFCzt
 garIBnXaavZMzbwKosjb9i09R8CvcWGxt9lGgtsrC0wEC0X8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y6q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBL4z33+JFdxNkVBpTNrR/5bD2CiDlmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZpBM2IyPEiojxtnPGsWVJZlsd+UlFrASCZTr3K4iPdt/D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUryTrKzPLw6TrePUUPVwdcZ+0N7JUfEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAOzARVodt/xory9U
 J4swZX2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1Y55eIWO0P
 BSP5Wu9AaO/2lPwMMebhKrrVawXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGMqNRJcA9TcSZgbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:0T7lXakknsgvvqp8Lrh9jcdhMFnpDfJP3DAbv31ZSRFFG/Fw9v
 rPoB1/73TJYVkqNU3I9errBEDiexLhHOBOjrX5VI3KNDUO01HFEGgN1+Xf/wE=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68020584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM+/vituZEfmKatiNkPCbygLjIiYT+tgeHHpNHzsrOYIxdfciYe7zVf1a2SlcqFBD5ahIUoMALhVvGQi+41TcIOp6kWfn2AOQMz4Xl8b2n82qCKLoYfLqRa2tl+OVuDTc0EB/mAR4uoPsc2FkLx+57LHrDXDyOxlkAIoZSH7tltmVCVGAFeAfY166QNBTa4jNbYK+fv/mjXJv9vtTK6zBbXphCebp1eYTQZCeF1y6EUMJGjBghzLX9CUVNchMbad45wcJgEKc2lmFJ5jc4DOByNVH38i0jeTjYcXTWQX0JumQz9tKBIypAEZzu2Y8vOu2NCBdNyoLjL8Odr27AV8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMZQmSJH2ZVsEMbRbL5QK2unD0ejft3PjP6FCyAko0c=;
 b=AVsLvPrLLPtIgC5o894bOvuiN8ZvzqcZjp4gU1wXISC0/4JSVMCphvQrpq9iH2py6LYAPh7V/Rk69ZAWUe7XMOX1McYfZh0u4vBuufwF/dx0vMmlz5gBMyL1+oPlSTYb8y0oLq8IiflFwGgShRO/fdJkrL6loZjS8Oq302p1eXw1hvi6M+u0A+Zrd2c3Fce+7SHeUM8FcfjInj6DC6v0XdclYUlHfeR+PZUIfx7qJsJx64YMyNXXmGuY6a+GkrKvQHvSiRowOVSXHHxXiHybWwiwat1tv/5F49FiadeCaaQpKKOhtDOgwHdnOpCweN5w7T9d8FkTIJNX66SzszSWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMZQmSJH2ZVsEMbRbL5QK2unD0ejft3PjP6FCyAko0c=;
 b=VSrSwSC7cywjL6TWpuaGUWF+dohTFHe4husjpycm2/U3q2om1PwCy1EymJlyAnQN4pXQKuBX0KFJ2lCeHWhe3w3O2bQarZYqY7Tkng7lJkOXcBUp/EFg/beDPDgnc/lkHEpqhzTXaPeHjtq4e8qP3vkkxo95WkpbjVbzYNvFyIc=
Date: Tue, 5 Apr 2022 10:24:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/8] x86/boot: make "vga=current" work with graphics
 modes
Message-ID: <Ykv80Hgqp2oxwZ4S@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
 <YksFeCB3bcXBGfDe@Air-de-Roger>
 <aca0954d-e235-4b25-458b-1183a7471b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aca0954d-e235-4b25-458b-1183a7471b12@suse.com>
X-ClientProxiedBy: PAZP264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1ef::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f4c2b45-5a37-4b0b-3820-08da16ddc294
X-MS-TrafficTypeDiagnostic: CH2PR03MB5237:EE_
X-Microsoft-Antispam-PRVS: <CH2PR03MB52373B71E5C328F2CEBBADA68FE49@CH2PR03MB5237.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQEE1Lqt5KKubup6z8f0OdeTOfyWmUEUw/Bt4U5dBdKQMvnfbDokxBv37TP5xhDH6frFrmU/Jkl77grct8O20xQIQL2tU1Y7D8tseLdVr9E7VHSQ56PdiTn9LluC18YFzPE00Q86Z3xkEoxGYdvtBVL23favXnr0w4GMyhXfvkQASZqCFzuDmWUDgrwovFcp8WCK3U6BjxVJpdSAAZ1DwPqy5TxSXh1iczMcaHO077YYSHx+NPE3kja22cG2ZmRCfITw3SQ7FE5VwgshsMDlQx4TZvrCX0WNwFbmCRrx5yShIognplTz+2tQHOs+UbX8z9dG+2qcDP4m68PI9cfpArYxuWZnec9Gg3FPBdoXBR/VRrSKCeX/YiJkvBLLbmJcCJ1OyIVNNm/Slaa3wn7dhqSf1jFcEdYR0FMtWgxYxnTMiQiSok2wg7Zh4cpJXmerTKF5jSU2TLKzyo5EglWVSvkZM9Mgw8LjR/f0dMz0W8EKgmQaTVfqoc0cgB2AWszGIlCI+8RRtrGL+rdp9w8Cwmf6c9uHZzarVMjJ6hdtrPrrlaPRiw7MPxiT+UA60cgkDTme5sEVHYSi9iT6UIJaI7vsNdW2iQN8aLRQNo1KKIDg5DnlqBZSQGlZoVC98mQUvc3kGGrGAg6e3yzPUaGsgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(186003)(38100700002)(5660300002)(8936002)(82960400001)(2906002)(85182001)(66556008)(6486002)(6512007)(6506007)(6666004)(8676002)(66946007)(33716001)(508600001)(66476007)(4326008)(9686003)(83380400001)(86362001)(316002)(53546011)(54906003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VyL1NVYTFXc2NYdXVpc3lQTG9ZYmE4Q1hIQlhrMEdZbGpuYWZvYWY5Ukkz?=
 =?utf-8?B?Tjc0STBoVGFpeExzUG9Zem5zVmxFUTJQSmJVRCt0UE5jd2NYRHJjZ2RPRTZO?=
 =?utf-8?B?aFNQcHhoZkl6VVN6QkJDV1U3VVMzKzZSVm1nWHNiSjArSUcyVmtvMXJwL2dx?=
 =?utf-8?B?UUoyK0tYYVZJdTNtOFg5dzhPd0k3S0ZyUkJoUDZzcnp4UE9FRHpaVHd3UXRV?=
 =?utf-8?B?aWFFODJCVkw2WC9kZTRGck5DdFZSbG5qV1Qrdyt2dFordmRoYmxzdmJ3bC9h?=
 =?utf-8?B?UVJkOGQ0anlyQXpLaTRnZE1UQVFLVGxFU0NtaGM3STRqTnFCNnM4cnFCb2Nh?=
 =?utf-8?B?d25IMXVlT1R3dm11YmMyWlNrT281NC9NVUo4TTBvbVFQSU5GeXFuUE44OU52?=
 =?utf-8?B?SStuMDhReWVxVnpFaEJZTWdQUmpTRnZLaGt4dEtSaDhiODgrYTF5UkV3Z2N5?=
 =?utf-8?B?ZE1FMFJxMDRndTEyRGY2ME9OcGRaSmZlWXFlNEVKWkJ1R2U2eWpmMy9LS3lU?=
 =?utf-8?B?RmhidVlmeE1lR2xkMitPZmJPWmxQYWpQZmZCVnN5dllOYitIK0pQNHhaNG5u?=
 =?utf-8?B?UnZPYms5eVF5b2JEV2VNWk1SeVlvK0VIMlBzUnphd0N3SGlqSlBGN2UzeERU?=
 =?utf-8?B?cEVmVlgwTWhFdGJYNU4vWHpnNUdYekphT0pPbnBUZXMzdUZROGVpTTJNdnQ5?=
 =?utf-8?B?akRFZjNNVU0xN2hiQldWOHY4MndteTVWdXJYSlhXbnlYTk8rZ0VDSDVXa0dI?=
 =?utf-8?B?TWpwZUp1SDl3cFdVTzVsMG1lb1h4cWRYUDJDNHNseG9vZ01NM2VHZkRNWHFZ?=
 =?utf-8?B?YzF4bHBVMFdvZHFFdGNEektSVnNUUjh2bXJ5bU1NcjcwSUF6Yk5EZWU1TlY4?=
 =?utf-8?B?WnF2Z1MvVmdtVkVvQTJjRDhiM05TVUMwbDkvaEVWZTM4ekRURjNUV1Joa25B?=
 =?utf-8?B?bVU2dkN5ejFrc2tSRWxKRFgrTHp0ajlYSkdqZjNpbjhudksxUmZjcklYVDBE?=
 =?utf-8?B?WExkblFPc0JqVUdtc2ZTcHNVNi9OejJoSzdBVGpDa2ZsdStvaElCMlZlUmN5?=
 =?utf-8?B?c1dCZ2lZajJNRXNENkQ1SGk3R1MxRmJHV0drL0toRkl4MzdBdld2Q09adUxC?=
 =?utf-8?B?NjFGSnFDcDdXR2hFMjM4NnRPUDlqRGJ0cXdVU3V5dWJyZmE3b2lPaGtESjly?=
 =?utf-8?B?TGNqcVpjTEUzSFV4OFpZNEVobGtiTWovbzk5U09TSGlXaWpsQVEweWgvQzJv?=
 =?utf-8?B?dU9iQXFET0JtREhMdmlHQXFnS0JlWldWQW9vUnJGUFlHTHFCWTQ5bFdOM0Iv?=
 =?utf-8?B?TUhhanNpMVdyN1ppeHF4MWVQQ3VDaUtyelhmZm1YOXRkWnhHQ1RrUGNtUEpW?=
 =?utf-8?B?U1k1M1EwZmQ1TXV3R093NW5rbG1wSGlnUGRUZmdBMnFpM0dMZnYzem41cTdp?=
 =?utf-8?B?SkMvRzhyT3NQV1JxdlVOdGVPRG1aTjJJRnJmNURyN1NRYndlTUQvSG1BWG9F?=
 =?utf-8?B?Si93Z0RiUDhFaG5hVkFvU0c2SHI3ajVhaU9oMmh2THlJV2JDN0daWnV5aUtE?=
 =?utf-8?B?MEhyRHBRV1oxUjRHOVBGTk9qMzZlYmRaeTBCbkVUeTV3WGFmeUNzcnE2NS85?=
 =?utf-8?B?eVZzQTg0blJVOGVOOC9ocEhWeEt3TzN0MERiM3RYcTVsWVoxdW0xRk11UE14?=
 =?utf-8?B?LzBBL1hDRzRxTklEM3paOU52QURYZWUzVVFoVXZCQTJwS3RtUXoxL0tMbVZI?=
 =?utf-8?B?M2pycnUrdyszQXg4THpNRkgrd3RZOHBNZ1pJM0syM0xVKzk3S0NUMDNQeXRQ?=
 =?utf-8?B?Z1lhZi9oUndLb3lyWmVmNmJRcGQxaVh1YWNSVTV1Z2JNbllGSkJsR3RCK3ZQ?=
 =?utf-8?B?UnNVWFNlOE1TclpFb3g5RmdEQk8zMWg5L1VhcUdtaTdNRGtILzdWOFV2aitL?=
 =?utf-8?B?VmZUK1JOalVnQVBpZXFHQmxQT25WeDVTVHJUdFhPREhwamk2VmZpQTZ3OEs2?=
 =?utf-8?B?TlI0ZGRTUFBOMlpkTitiSVNoNXdtbzhwRHpFNWJIMFJPcTVlYW41SnY2Vlk2?=
 =?utf-8?B?TDJvKzZSUUJNSktBMmsrb21ZRkhCcGZDcVNOQnBpN1F2TU4wT0lNc28yTXdW?=
 =?utf-8?B?UWd3ZXQ1aG94T2wyaklEZXI0N1dHWTJRd3lIUFBQUnV5K01mdlpIUmxrelpV?=
 =?utf-8?B?QkV0eXNqVU5acHNDMTJPWm1QbGRBb0I5UkhFdUVubU11aHcySWxIa1JlODhr?=
 =?utf-8?B?dmdDRHJVaVRyWDJwaURZbzY2eVZwckVTOGFaalBJZW1JcTJGbXg1cUlPTmNG?=
 =?utf-8?B?dnROMHNTRzJKajlZU3I5RkNLQTJ0bXFGTTdwQzkvQnFlbWxoOEVMUlJDNnBT?=
 =?utf-8?Q?5/EONjHokjY0hYjU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4c2b45-5a37-4b0b-3820-08da16ddc294
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 08:24:53.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzu/XybQ+nkplx09Fn9ukuYzUCrgboR4U5EnCj5upFXIeDng5KMEZqeT4Dw+ttPW216MgadsifC7J9JXHJUi8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5237
X-OriginatorOrg: citrix.com

On Mon, Apr 04, 2022 at 05:50:57PM +0200, Jan Beulich wrote:
> (reducing Cc list some)
> 
> On 04.04.2022 16:49, Roger Pau Monné wrote:
> > On Thu, Mar 31, 2022 at 11:44:10AM +0200, Jan Beulich wrote:
> >> GrUB2 can be told to leave the screen in the graphics mode it has been
> >> using (or any other one), via "set gfxpayload=keep" (or suitable
> >> variants thereof). In this case we can avoid doing another mode switch
> >> ourselves. This in particular avoids possibly setting the screen to a
> >> less desirable mode: On one of my test systems the set of modes
> >> reported available by the VESA BIOS depends on whether the interposed
> >> KVM switch has that machine set as the active one. If it's not active,
> >> only modes up to 1024x768 get reported, while when active 1280x1024
> >> modes are also included. For things to always work with an explicitly
> >> specified mode (via the "vga=" option), that mode therefore needs be a
> >> 1024x768 one.

So this patch helps you by not having to set a mode and just relying
on the mode set by GrUB?

> >>
> >> For some reason this only works for me with "multiboot2" (and
> >> "module2"); "multiboot" (and "module") still forces the screen into text
> >> mode, despite my reading of the sources suggesting otherwise.
> >>
> >> For starters I'm limiting this to graphics modes; I do think this ought
> >> to also work for text modes, but
> >> - I can't tell whether GrUB2 can set any text mode other than 80x25
> >>   (I've only found plain "text" to be valid as a "gfxpayload" setting),
> >> - I'm uncertain whether supporting that is worth it, since I'm uncertain
> >>   how many people would be running their systems/screens in text mode,
> >> - I'd like to limit the amount of code added to the realmode trampoline.
> >>
> >> For starters I'm also limiting mode information retrieval to raw BIOS
> >> accesses. This will allow things to work (in principle) also with other
> >> boot environments where a graphics mode can be left in place. The
> >> downside is that this then still is dependent upon switching back to
> >> real mode, so retrieving the needed information from multiboot info is
> >> likely going to be desirable down the road.
> > 
> > I'm unsure, what's the benefit from retrieving this information from
> > the VESA blob rather than from multiboot(2) structures?
> 
> As said - it allows things to work even when that data isn't provided.
> Note also how I say "for starters" - patch 2 adds logic to retrieve
> the information from MB.
> 
> > Is it because we require a VESA mode to be set before we parse the
> > multiboot information?
> 
> No, I don't think so.
> 
> >> --- a/xen/arch/x86/boot/video.S
> >> +++ b/xen/arch/x86/boot/video.S
> >> @@ -575,7 +575,6 @@ set14:  movw    $0x1111, %ax
> >>          movb    $0x01, %ah              # Define cursor scan lines 11-12
> >>          movw    $0x0b0c, %cx
> >>          int     $0x10
> >> -set_current:
> >>          stc
> >>          ret
> >>  
> >> @@ -693,6 +692,39 @@ vga_modes:
> >>          .word   VIDEO_80x60, 0x50,0x3c,0        # 80x60
> >>  vga_modes_end:
> >>  
> >> +# If the current mode is a VESA graphics one, obtain its parameters.
> >> +set_current:
> >> +        leaw    vesa_glob_info, %di
> >> +        movw    $0x4f00, %ax
> >> +        int     $0x10
> >> +        cmpw    $0x004f, %ax
> >> +        jne     .Lsetc_done
> > 
> > You don't seem to make use of the information fetched here? I guess
> > this is somehow required to access the other functions?
> 
> See the similar logic at check_vesa. The information is used later, by
> mode_params (half way into mopar_gr). Quite likely this could be done
> just in a single place, but that would require some restructuring of
> the code, which I'd like to avoid doing here.

I didn't realize check_vesa and set_current where mutually
exclusive.

> >> +        movw    $0x4f03, %ax
> > 
> > It would help readability to have defines for those values, ie:
> > VESA_GET_CURRENT_MODE or some such (not that you need to do it here,
> > just a comment).
> 
> Right - this applies to all of our BIOS interfacing code, I guess.
> 
> >> +        int     $0x10
> >> +        cmpw    $0x004f, %ax
> >> +        jne     .Lsetc_done
> >> +
> >> +        leaw    vesa_mode_info, %di     # Get mode information structure
> >> +        movw    %bx, %cx
> >> +        movw    $0x4f01, %ax
> >> +        int     $0x10
> >> +        cmpw    $0x004f, %ax
> >> +        jne     .Lsetc_done
> >> +
> >> +        movb    (%di), %al              # Check mode attributes
> >> +        andb    $0x9b, %al
> >> +        cmpb    $0x9b, %al
> > 
> > So you also check that the reserved D1 bit is set to 1 as mandated by
> > the spec. This is slightly different than what's done in check_vesa,
> > would you mind adding a define for this an unifying with check_vesa?
> 
> Well, see the v2 changelog comment. I'm somewhat hesitant to do that
> here; I'd prefer to consolidate this in a separate patch.

Sorry, didn't notice that v2 comment before.

It's my understanding that the main difference this patch introduces
is that set_current now fetches the currently set mode, so that we
avoid further mode changes if the mode set already matches the
selected one, or if Xen is to use the already set mode?

Thanks, Roger.

