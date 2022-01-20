Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48057495219
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 17:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259137.447058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAa3r-0006Le-Hx; Thu, 20 Jan 2022 16:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259137.447058; Thu, 20 Jan 2022 16:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAa3r-0006Jl-EO; Thu, 20 Jan 2022 16:13:19 +0000
Received: by outflank-mailman (input) for mailman id 259137;
 Thu, 20 Jan 2022 16:13:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAa3q-0006Jc-KV
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 16:13:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfa6d66a-7a0b-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 17:13:17 +0100 (CET)
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
X-Inumbo-ID: dfa6d66a-7a0b-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642695197;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=YFiDqJohY+v3QAsYF56ic/vzY1WH48jxUZLpJW7iSW8=;
  b=QeH/GjPzPjin6SBlc6m9ehTjv6EKlWEuhIwbl1wcAZIkhMb5YXsEroFa
   Hy01QiBC/sJaUKl1VEZtevEvrY+/Kybcaj+xR1bwDWrlmrdx+w+kbZdbJ
   Oqq6AXxWrm+osJGBUXCcjY0xIUmvVq1ZBi4ny4dSyuVDr4HclPBNKsaU8
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZKi6jp4rgwNp3MDwAbXg6HzzUKNDZlJ7xAa84XgvQh9NqPjp9aAurw97/+nB9Syfo+UQXaWtDT
 /+/cANUprf0lWS3kAm2dmn3+kkWX7/Bts+n3ruDhjVdzbQPivm1DEspbonIU33Wqrwdrbsk6bh
 Nn/YX0GaFLcOu1+0xT90JnoHl+i0xljjzxlbq2tHzlKbEBdMRH0l2T+qVMk4E58zFG5rCTauJM
 TyZ7RWmyTzK1iy0L+TeqgILV/uvrqYu+r3u8kgQfypCXMkjK4j6dgbX1VFs3eBojudEteEeqGt
 I8PcksZ+hsELwplJsgC9tqLY
X-SBRS: 5.2
X-MesageID: 62419384
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LfPTiaseUlR1gqrnv/MYfYWRsefnVLdZMUV32f8akzHdYApBsoF/q
 tZmKTqCOvaJYWD3LopwPdm+8UkOv8XWzNJmG1dkripnEHga+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24DhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl8syMEFkTDvz3kuU5byRzFQF7Pp9J5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JoSRKeFN
 5ZxhTxHYw3LOy9kJWksUJsgt8i1p3ulaQBjgQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE9WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZbC+YJTdcKuTqHy47o3i2fJm0HfDFePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5NuRECnCBtJ6sybp1qHHb4
 BDofODEvYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0keh42YppaJWa5C
 KM2he+3zMUPVJdNRfQvC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTfSFkXsin8pIOHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:nhLt+K1UKv2l7A9tY2/NmwqjBEIkLtp133Aq2lEZdPU0SKGlfq
 GV7ZMmPHrP4gr5N0tOpTntAse9qDbnhP1ICOoqTNOftWvd2FdARbsKheffKn/bak/DH4Zmvp
 uIGJIObeEYY2IasS77ijPIb+rJwrO8gd+VbTG19QYSceloAZsQnjuQEmygYytLrJEtP+tCKH
 KbjPA33gaISDAsQemQIGIKZOTHr82jruOaXfZXbyRXkDVnlFmTmcXHLyQ=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62419384"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bE8nATy/ocp0BloJNj5HaKDoDVrauwBB7C8IrJP1GJ9wdnKq7C6+r0uJihcqqIjN6DHoP54n8HueXgAZmodEPw/6M9/iaYkF50tY7xrrpvMkiTAZmff7o9Tmjnw7dkauhgCDWR0OrMK9+/9oclJjL6WMf06D+n7k8VIOnCiWknIv8D1yFmXcITDZEaRYbfJvi7u7iIHtPlxLkcBJ+WJ4zzUZlsn/XmmZYm4Ih3VBwZsAZDY5WKpxK22NNdGWrJuFFNbKZVkFJZ5i4jCsblFqX+DJmy7izgOR5FCsdhbZ1edSH0E7Knr1eL6nMrXrxqFg9aiJriwlBDjAZroQDqKitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDiLfegh1LN0Ovmkbt1PyxYFwjVYi1Vv6NSlbHV9b98=;
 b=Dt+SBESrOYcBcgmoXZ10455ZAEuZ4bjT9XPp3H2SJtiqKc9viywassdp4LsPNmc5mdRmOWdBN7khtm36MC/lKB8OuOn7iA/OKVRkbuI8/nJHQSKhX2SxdEo8ShvStKJ6Qu+cCjAm21ovDtqSm7WdC+itbDZrINlQqc0IzEG1ydwfnIhsyNjcHDc/Cgc9yCPiwGN2R151JL5M18Kf5B5Ga6yXyHRFPXc/5w/7oGzEJNSoa7qt516+ghhfBHMG/V6zPD5EDoLVFVFqVxyEfmw1AP4FaRB/ZjUtaOppWb60rPy+EKcDi396WIPt7htx4zFw1mY1nv4hPSPwQC/MAw4qVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDiLfegh1LN0Ovmkbt1PyxYFwjVYi1Vv6NSlbHV9b98=;
 b=WegcmQrIJR801uUm1rPCAVAO91zsKutjdROB1/7TlW6BDNRT6owNBvDBHTkmLdsQaw8IiP15WUJTDew9KamdhuzvxhvxEAIRasFYoIZsBpCHFEBz8EWU731aEBY1CXXRHVVKdiKSAd7VcGqBAshpjtUIXbDIhzAN4O85rLXsazQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/x86: import intel-family.h from Linux
Date: Thu, 20 Jan 2022 17:13:00 +0100
Message-ID: <20220120161300.8477-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e3fc83a-2c1a-407b-7b6c-08d9dc2fc17c
X-MS-TrafficTypeDiagnostic: MN2PR03MB4909:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB49095F25EBFB4B6B16D2A1698F5A9@MN2PR03MB4909.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:215;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3mRUG5NOVII1vVWbjXPzuEs5pl/J2Kmxt6YpYYHXdf3yeufXwuHXpF10V8+y29gpJlcRZDpN/LlGInj5dhSJ2/33eGCAT7ZZshDAZ0L4KvrHTqShDQij69illdXow++y5dchuo5EDE/ww75XvwGAcUfIb6TZUjovTk9I4kUCOveNOJe9iehH+dmJhyFWtDaJhZ7b0391xqOcZKQ191+QetJEE/BFQNpLDijkasToz+IqJVDQbGyPJg+t0hV1RzDfG5+185/eZDWA7grpvvkTRkV9mN2TgPFtE75aL/maL6m9EyVVG+s8r+CKRex0cRekqNjf09AgK2VtNS7cqE++VZWE0Zy7Cn+tw7eaS+8+MlkygnJnNGOil1bBfY1nSvHxjZz+0RvVODz3k0L09FYuiyaIgNm8FLKPsb8kQ53jIorh0uqpFQeOyiuqCuKhJTNxGFSJA+GpfaAC/DJ9DnQLiKitPhR4CSHrODE6gOuIqQ47noEsqmkwmEBGpgmBiqZMnjpEOoGLJFL6djOr2cLQO+Pn2cl7R0t+wakXoeUy/rUBh3caLe9+VO7qu8W+Hq7K+9S2whHFXdyYrLyzixWMB8BtTGDrOLrC6WF0v+1kO5tr80gdDQYnT4wyo2rMy7DKromIYoHl1IFk12QEjAM3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(508600001)(36756003)(316002)(186003)(2616005)(54906003)(66476007)(4326008)(5660300002)(6666004)(66556008)(38100700002)(6506007)(6486002)(66946007)(86362001)(8676002)(83380400001)(8936002)(82960400001)(6512007)(2906002)(26005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVkxM3kzb3JUd24rL2Z2dkJhNEU0aysxUVNSR3JCd1loTVAyVmNHWVpqWnAy?=
 =?utf-8?B?bWJRQlQvN2xTejh1elF1bWFvMENRbzVISHZ2bmt1ZTBud3lhSnNDYlgzU1hm?=
 =?utf-8?B?SEwwb2VtZFlMYlB4c3VwSDFrdGFZdnlJZ0pVMnVpbDluVS9KdXZGZDU1anNH?=
 =?utf-8?B?QnJPUGhidjdsMDR2TmhwMldKckwrQWV3L2RZcFpJb2pyNy96QTFVRm9ka3Rz?=
 =?utf-8?B?UVpJNUdDWCt4R0hSYmFHMCt2Y3crSTZITE4vT2QwRW5SRkZDWXZtM3JaRFpT?=
 =?utf-8?B?V21TT0pOcDRydHc1bS9Cak5BUVhQbDV1eFdvdVl2aGtDNG1HRVVtR3orS0N1?=
 =?utf-8?B?Nm1VSk1Fd3RiQWd6RlZuWnNKd2loVjNqK0N3bEI3R2dDN1pNa2c2THFQTWZC?=
 =?utf-8?B?K3FwTWFmemZoNWc0emJzZFEveHkwck55clVOaHoyVEJxQVJBMEtNMFB6RE5p?=
 =?utf-8?B?bmRybzR1d25hbEYreUNVd3FJNVJXVDVTL2VoUUJBMHhIdnBMbkpKeGNZOXVa?=
 =?utf-8?B?Q1hXallTcDdzR2t4NmQ5YU41aW1aeHhuUkFQL2txdmllaWxXdWY3L05ITlB4?=
 =?utf-8?B?bjdvZUtyeVEvWjhKSzNaNFJyM0VWRHlkZS9BOVF2RG84ZnNYVWVpSFUyUHZ5?=
 =?utf-8?B?cHlKQUNUOWpCVnVvNm8yVHZOZGJ1M202aGJrWkJZL1JQUmx1R2tQNncvbkxl?=
 =?utf-8?B?N0hjc1VRWjVkOVVMM2w1MGhvMitFa1FlWmFxYk9renA4VTFrL2V4VW04OHgy?=
 =?utf-8?B?UUh6YlRBTWNob0ZUdlZNaXdpMjhCcjdRZFZYL3FnMEd3WmJSN2hvd2M4TW5k?=
 =?utf-8?B?ZjhWTnhveTYwVkxCQ0xvdzdmUHRKcU5oR2IwNWNVMFEwaHVEWDZhWHZDSTU1?=
 =?utf-8?B?Y1FpOVVMQ1BYbC9uY1pGVk1ycld5MzNqREVxNEdreUNFUld6VFNlK2JYajlC?=
 =?utf-8?B?ZEdmM0p1cGUyYmtYYWFjNE5HZFgrVFpFTUxMaHhieW9SU01iUjNqYUthMHNn?=
 =?utf-8?B?TlVjeGxZbElSTXVVUUtTUEZIYlRDaytnYk9KOWFLUFdrWFBDRnNadlg5VEJ0?=
 =?utf-8?B?clgzSXpuU2hWTHhqMVQ4bGdkaE4wdW84cUZtcEN0dHVaeU9nVUdGSjBIRHhQ?=
 =?utf-8?B?YVNpdW5lTHh0MDZXOWp3OHpvcW1BYm81RWliYVVBb0hiVUhyRVI3SUQ2L0JP?=
 =?utf-8?B?UWlpMy9acTRZcUU3TCs3VE16OEZEcTZtdndXVFh5UGlBUHptU01BbHhtN0RC?=
 =?utf-8?B?VDBJYkNiTnJOSEFYV3B5TGhzNjI2QVBhaysrLzM1MlFtTDVXbkJHZFlWMmky?=
 =?utf-8?B?aFRFY2Y0OUhWNEF2QzhGSERyeE1vcHo3MU5iRXNoRGpDMVhmRmt1MjFpQWMz?=
 =?utf-8?B?Q1lHMmQ0M2pUYkJtSGg0TW1DOW9jV1RzSnZ1NzFIeFdhbnBPcXJoTUluYWFC?=
 =?utf-8?B?UlprdG9mZE4wNWhqWDVmU3hxRERsc0loZnpyVDZTc1krQXV2U1JQTy9kTDlK?=
 =?utf-8?B?SkJNZU1jRE5yNGlDM29xcnUrK0NWMXBXMDVRaDV1TCt5R3hkVlVNNmRnMWFm?=
 =?utf-8?B?bjh1Wis2Qmh2OUJYcTUwR3QvUWMvaWRZU1ZIajdiSG9YeXR6elpsaldyby9G?=
 =?utf-8?B?WHdhYVBNL2RvUFhaVzFXUFNkQ1AzVUh2M3A0M3RZQ0tTRDUrNExack1PME5z?=
 =?utf-8?B?cjR6MUFQcURMaG0zaFVBaGhvcVNBeXBMV0NXUW9FVU5YTENGbVFZUU5vandY?=
 =?utf-8?B?ZldYUUVpcVB4bW5IWXhNYmt2dW1ZL05TTGYySmp1VnFDYWVISUVOQ1Ara1BL?=
 =?utf-8?B?U2F4RWU3dmtoKzNVTEhTcTFxWDMreDNiVStUYVhzalh2endaZXhyVjh6REx0?=
 =?utf-8?B?RHMwZDFjYUpFNGxqajBoYXZ0bzhXTlhBbUREVHlOL21pN1V2dlJWdUs3b28v?=
 =?utf-8?B?Sm95TmFyd3JzWlo5MkFIdlU4TG4yN1lxMmt2SmpJSEp6SC96Nlp6UWtxQW1x?=
 =?utf-8?B?a1JpS0tsbnUwY1RVVTlqWGRpU25IM3JaaW14WWR3QUZEN2tjQlpHSXZKOEw5?=
 =?utf-8?B?QTdPMG5ib2Y2RDhlQSt5bFkyWEVhVlpjaTNrdGZ0QVNYdUMzMUIxOU9IeWFl?=
 =?utf-8?B?ZEdjamYxYVJ2TU0zYTByeWxscGtUTGw2SWg1cG1FVVM4aGc2VU9FRmpSRkds?=
 =?utf-8?Q?eTAZxoy5QOnafq5R9CxWSjY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3fc83a-2c1a-407b-7b6c-08d9dc2fc17c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 16:13:11.8307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltOFjZW5qlnapZxH/Q9SumPZFK4ucS3edJCKSfMeSYuekV+5VsNqG6Xj+UXUZDvkiPDzEDVQpKpojJHAy4FucQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4909
X-OriginatorOrg: citrix.com

Last commit to the file is:

7d697f0d5737 x86/cpu: Drop spurious underscore from RAPTOR_LAKE #define

This should help the readability of code that's currently open-coding
Intel model numbers.

No change introduced to existing code, it's expected that new code
could start using the defines. Changing existing users could cause
quite a lot of code churn.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/intel-family.h | 145 ++++++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 xen/arch/x86/include/asm/intel-family.h

diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
new file mode 100644
index 0000000000..ffc49151be
--- /dev/null
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_INTEL_FAMILY_H
+#define _ASM_X86_INTEL_FAMILY_H
+
+/*
+ * "Big Core" Processors (Branded as Core, Xeon, etc...)
+ *
+ * While adding a new CPUID for a new microarchitecture, add a new
+ * group to keep logically sorted out in chronological order. Within
+ * that group keep the CPUID for the variants sorted by model number.
+ *
+ * The defined symbol names have the following form:
+ *	INTEL_FAM6{OPTFAMILY}_{MICROARCH}{OPTDIFF}
+ * where:
+ * OPTFAMILY	Describes the family of CPUs that this belongs to. Default
+ *		is assumed to be "_CORE" (and should be omitted). Other values
+ *		currently in use are _ATOM and _XEON_PHI
+ * MICROARCH	Is the code name for the micro-architecture for this core.
+ *		N.B. Not the platform name.
+ * OPTDIFF	If needed, a short string to differentiate by market segment.
+ *
+ *		Common OPTDIFFs:
+ *
+ *			- regular client parts
+ *		_L	- regular mobile parts
+ *		_G	- parts with extra graphics on
+ *		_X	- regular server parts
+ *		_D	- micro server parts
+ *
+ *		Historical OPTDIFFs:
+ *
+ *		_EP	- 2 socket server parts
+ *		_EX	- 4+ socket server parts
+ *
+ * The #define line may optionally include a comment including platform or core
+ * names. An exception is made for skylake/kabylake where steppings seem to have gotten
+ * their own names :-(
+ */
+
+#define INTEL_FAM6_CORE_YONAH		0x0E
+
+#define INTEL_FAM6_CORE2_MEROM		0x0F
+#define INTEL_FAM6_CORE2_MEROM_L	0x16
+#define INTEL_FAM6_CORE2_PENRYN		0x17
+#define INTEL_FAM6_CORE2_DUNNINGTON	0x1D
+
+#define INTEL_FAM6_NEHALEM		0x1E
+#define INTEL_FAM6_NEHALEM_G		0x1F /* Auburndale / Havendale */
+#define INTEL_FAM6_NEHALEM_EP		0x1A
+#define INTEL_FAM6_NEHALEM_EX		0x2E
+
+#define INTEL_FAM6_WESTMERE		0x25
+#define INTEL_FAM6_WESTMERE_EP		0x2C
+#define INTEL_FAM6_WESTMERE_EX		0x2F
+
+#define INTEL_FAM6_SANDYBRIDGE		0x2A
+#define INTEL_FAM6_SANDYBRIDGE_X	0x2D
+#define INTEL_FAM6_IVYBRIDGE		0x3A
+#define INTEL_FAM6_IVYBRIDGE_X		0x3E
+
+#define INTEL_FAM6_HASWELL		0x3C
+#define INTEL_FAM6_HASWELL_X		0x3F
+#define INTEL_FAM6_HASWELL_L		0x45
+#define INTEL_FAM6_HASWELL_G		0x46
+
+#define INTEL_FAM6_BROADWELL		0x3D
+#define INTEL_FAM6_BROADWELL_G		0x47
+#define INTEL_FAM6_BROADWELL_X		0x4F
+#define INTEL_FAM6_BROADWELL_D		0x56
+
+#define INTEL_FAM6_SKYLAKE_L		0x4E	/* Sky Lake             */
+#define INTEL_FAM6_SKYLAKE		0x5E	/* Sky Lake             */
+#define INTEL_FAM6_SKYLAKE_X		0x55	/* Sky Lake             */
+/*                 CASCADELAKE_X	0x55	   Sky Lake -- s: 7     */
+/*                 COOPERLAKE_X		0x55	   Sky Lake -- s: 11    */
+
+#define INTEL_FAM6_KABYLAKE_L		0x8E	/* Sky Lake             */
+/*                 AMBERLAKE_L		0x8E	   Sky Lake -- s: 9     */
+/*                 COFFEELAKE_L		0x8E	   Sky Lake -- s: 10    */
+/*                 WHISKEYLAKE_L	0x8E       Sky Lake -- s: 11,12 */
+
+#define INTEL_FAM6_KABYLAKE		0x9E	/* Sky Lake             */
+/*                 COFFEELAKE		0x9E	   Sky Lake -- s: 10-13 */
+
+#define INTEL_FAM6_COMETLAKE		0xA5	/* Sky Lake             */
+#define INTEL_FAM6_COMETLAKE_L		0xA6	/* Sky Lake             */
+
+#define INTEL_FAM6_CANNONLAKE_L		0x66	/* Palm Cove */
+
+#define INTEL_FAM6_ICELAKE_X		0x6A	/* Sunny Cove */
+#define INTEL_FAM6_ICELAKE_D		0x6C	/* Sunny Cove */
+#define INTEL_FAM6_ICELAKE		0x7D	/* Sunny Cove */
+#define INTEL_FAM6_ICELAKE_L		0x7E	/* Sunny Cove */
+#define INTEL_FAM6_ICELAKE_NNPI		0x9D	/* Sunny Cove */
+
+#define INTEL_FAM6_LAKEFIELD		0x8A	/* Sunny Cove / Tremont */
+
+#define INTEL_FAM6_ROCKETLAKE		0xA7	/* Cypress Cove */
+
+#define INTEL_FAM6_TIGERLAKE_L		0x8C	/* Willow Cove */
+#define INTEL_FAM6_TIGERLAKE		0x8D	/* Willow Cove */
+
+#define INTEL_FAM6_SAPPHIRERAPIDS_X	0x8F	/* Golden Cove */
+
+#define INTEL_FAM6_ALDERLAKE		0x97	/* Golden Cove / Gracemont */
+#define INTEL_FAM6_ALDERLAKE_L		0x9A	/* Golden Cove / Gracemont */
+
+#define INTEL_FAM6_RAPTORLAKE		0xB7
+
+/* "Small Core" Processors (Atom) */
+
+#define INTEL_FAM6_ATOM_BONNELL		0x1C /* Diamondville, Pineview */
+#define INTEL_FAM6_ATOM_BONNELL_MID	0x26 /* Silverthorne, Lincroft */
+
+#define INTEL_FAM6_ATOM_SALTWELL	0x36 /* Cedarview */
+#define INTEL_FAM6_ATOM_SALTWELL_MID	0x27 /* Penwell */
+#define INTEL_FAM6_ATOM_SALTWELL_TABLET	0x35 /* Cloverview */
+
+#define INTEL_FAM6_ATOM_SILVERMONT	0x37 /* Bay Trail, Valleyview */
+#define INTEL_FAM6_ATOM_SILVERMONT_D	0x4D /* Avaton, Rangely */
+#define INTEL_FAM6_ATOM_SILVERMONT_MID	0x4A /* Merriefield */
+
+#define INTEL_FAM6_ATOM_AIRMONT		0x4C /* Cherry Trail, Braswell */
+#define INTEL_FAM6_ATOM_AIRMONT_MID	0x5A /* Moorefield */
+#define INTEL_FAM6_ATOM_AIRMONT_NP	0x75 /* Lightning Mountain */
+
+#define INTEL_FAM6_ATOM_GOLDMONT	0x5C /* Apollo Lake */
+#define INTEL_FAM6_ATOM_GOLDMONT_D	0x5F /* Denverton */
+
+/* Note: the micro-architecture is "Goldmont Plus" */
+#define INTEL_FAM6_ATOM_GOLDMONT_PLUS	0x7A /* Gemini Lake */
+
+#define INTEL_FAM6_ATOM_TREMONT_D	0x86 /* Jacobsville */
+#define INTEL_FAM6_ATOM_TREMONT		0x96 /* Elkhart Lake */
+#define INTEL_FAM6_ATOM_TREMONT_L	0x9C /* Jasper Lake */
+
+/* Xeon Phi */
+
+#define INTEL_FAM6_XEON_PHI_KNL		0x57 /* Knights Landing */
+#define INTEL_FAM6_XEON_PHI_KNM		0x85 /* Knights Mill */
+
+/* Family 5 */
+#define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
+
+#endif /* _ASM_X86_INTEL_FAMILY_H */
-- 
2.34.1


