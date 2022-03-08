Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F44D1D5A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287213.487096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcpQ-0002qc-GA; Tue, 08 Mar 2022 16:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287213.487096; Tue, 08 Mar 2022 16:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcpQ-0002oO-BE; Tue, 08 Mar 2022 16:36:52 +0000
Received: by outflank-mailman (input) for mailman id 287213;
 Tue, 08 Mar 2022 16:36:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRcpO-0002oF-Ky
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:36:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2c9cbfb-9efd-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 17:36:49 +0100 (CET)
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
X-Inumbo-ID: f2c9cbfb-9efd-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646757409;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hMkY17anhtiIP0RMlRHoc+BIVCHFpx5t6rE3b327IYI=;
  b=esLVVS8HTbXnVLeKwWM7KxrB1pUVVIfPC2jcgWYgLpKElphSXaNanEOX
   PfczLmIoZvN1TwgHjbzqhwR32/c9LrK8934U+CMbRf6hD0fvCd6TABrM0
   3As6gm0ml/ED93NzePDmuJR9DF91i05DDUKbYjZXIDrBjCTLvCWlQsbSF
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65731604
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pJogk6hmO/45N0T3wn/kkTKdX161lBAKZh0ujC45NGQN5FlHY01je
 htvXT2COfeJMDD8ft93bY21/EtSsZeGyIc2TAVkqCA3RH4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQVwNa6SqLgjaEZZHi96YP1F6Z/jeUHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDO
 JFAN2IzBPjGSyVfIU44NZtkoKDyjFnGUCdep2uHh7VitgA/yyQuieOwYbI5YOeie8JRmUqJo
 3PcyE7wCBoaKd+3xCKM9zSngeqntTz/cJIfEvu/7PECqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDRNTnQwexpnLCuxcGQsdRCMUz8gTLwa3Riy6bDGUZSj9KaPQ9qdQ7Azct0
 zehhMj1DDZitLmUT3O19bqOqz62fy8PIgcqZzIATAYDy8nupsc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/6fi9lOZs26SncfIQwAxu1XUT0KBtjosMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxb4M4fFyhRErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+TBNCPOEOdYazNii9zVCove+205F
 P4Fa6O3J+h3CrWiMkE7D6ZJRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYoF
 6lVIZvRWK8TItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nky
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:8weupqq6S7FDLNJCX98E2RYaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65731604"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it5xyaM7s4yPDITE+mVH+PpsgpbSNSe1cMl07qBem0EvDubJwA7eWfOuUYuCp8NKN9hTDURHkWctpnTwoP5jtgcsQHSHWD81QbA4oKOJBzhr03XPq5mItgNoVX3sSKN05FnIqwBJPBpjvmaZuAXssVBa0W9o8IdWmcSgVYGnQw9TgKBgSoAP2gjTby0rsKo9+ulsgPHCkxK36DFNlWp5zIZ1wZQgUhSAMj3XbnSG4O53Jdb/zyiYotQ//1ptTC47DQ+KbTyhQ2gmcMVG1UoBrHduDj85aRY9S21lr65rjwyDB0usC8ikQTpol9EeKtCgtG6g7AnaRUaIK/SdIiFxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2epvDYDmvwwx2rWMia+8CgjnbWJoTuQTzI7d4mYO1g=;
 b=gKBkz7KXovjwaZi+8JU+gQPrlzNNf7gt5hNqTi2Je2QlSc18QeGe0zPqn/TDkVPms628Tihw9eaKf8qUvi6s6I7c4500OcCe23bKyi8Lu1oc+bznX5DIIEerW/icpaJL9hTG96kJ9elYOWSVTFWOhg6ZRq4q7bnqmGIE7iiUSiPpBd8UkCL/GB18J9TgNNBaMvtJOk3O3B9PKklqzcf2oGuvdhZYznb2yF9RF/QD6bDC1gxXq6ZfmCzAhg0t8yCJ5529x95n+Nmuw+IZ4FPae9lpNw5KMpfg27TrQ8HoQI+2rlt9ujIkNnI1c2zzB47V4f+RhSq3d33gionHU/L0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2epvDYDmvwwx2rWMia+8CgjnbWJoTuQTzI7d4mYO1g=;
 b=xex6OVkQU1O5VFP+wIKfRaG9wBChda1bYdWI5nABBMsVbP/FaO2jiIKDGF0FEtY2xL3KuQiWHJDtITmbYkf8fQ9afUY1UMAZ2I8ZXuA3w/6zO3tBOsPKThjESWF60WnNEgIcJSMorxV1teEZ0vs/c4I4q9efgzjDfxXXgGeMYFU=
Date: Tue, 8 Mar 2022 17:36:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen/build: put image header into a separate
 section
Message-ID: <YieGEMpcSl+qdZ1e@Air-de-Roger>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-2-roger.pau@citrix.com>
 <c2e15d35-91b3-ba29-eed0-92fa19a692e8@suse.com>
 <YidlvWBauhcrAQa1@Air-de-Roger>
 <8f37e018-ab41-3e4d-14c7-1a25aa35e958@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f37e018-ab41-3e4d-14c7-1a25aa35e958@suse.com>
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 515b77a8-4570-49a3-fde5-08da0121d080
X-MS-TrafficTypeDiagnostic: BN8PR03MB4868:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB4868DD054500531E71A475A88F099@BN8PR03MB4868.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDxN3FDKCFrmlVnrUTvc4j07FjAUMRCSah3F/zg/9OLPrDxRTre+pxCqjfIWn3N1cDRihWXndQ+s0WdjyCNYvau7gdQDGTcubDd3iD4UKM0wKK16/z/JLf6ZUwHBuNErMooVAZQcGyBZ/zw5W2xTnX7vIrynOhvvmTZ+06MXrkUhwvagfxYOZ9EDr3kxfiF67KbFDMWQKumWM83Yz64b+DQej7ZJZCpr23kgGf1s9qe03Skg7/e4p5g3VPXfrKk9NvSSufsLzk5hFC3SMA1m6A8JrUiauGhM1NSLTZ+Wsq/raZshSfVuT0n9oVNTRkKvOrFc3oHD7gXWKvDO7R24w9paX+wsjTrCQ8a4MdhMmBBzJ5ve8xtIkfzrBAUtQ/8e5yGkHADvlHMS9SGp2Nf/3SdKJQOZ1nhefEWqZcNiQAuHSDWvO84TG4nxl3gXxyVevJWOJw1wp0d6WrB0YLgQfpHdE2ZjkO66ZGkxjtbYIg57ubm/3uG5LgYIfZaUWRmcWgVr74RqUMypTTnBxOvqzJYsMpSX9h+LWrZkDHo/QCGvmkObQK5+fUeSV4juHjNi8x6wfnO/xAr8TM6UZjFWmlXuXLA+RbykMsgUzpEyT6uVjnslqCdVbrJofdmQNxh6G/2NhNCHzRWTAkoGVaQPQLMT3dvkN0OEtIjv/tz/nyKE+9jVX4/15pVpiqIa3ww2X+58eJgpFHM3Vn8D3BBbGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66556008)(4326008)(8676002)(26005)(186003)(86362001)(66946007)(66476007)(6512007)(9686003)(8936002)(6666004)(6506007)(53546011)(5660300002)(83380400001)(508600001)(38100700002)(85182001)(316002)(54906003)(6916009)(2906002)(33716001)(82960400001)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnhMYTJMbUs0VmxXbkVGZ0M4WGMwVDAyUlBvN2RQbGYvV0xIV2pFaGFtdXo0?=
 =?utf-8?B?TGtndFQ0V0traUI0L3JIdmN3Z08vZHpBTjdsOXlIMndNZXNqRVVCN0VoUDM1?=
 =?utf-8?B?UzhWalZQWHFrL2lnMzZMajZ2T1A2K0dTdEhsTFhjbmNZTTRycHBCT1p2bEdK?=
 =?utf-8?B?eWtzeEM2NFZ4ejhFbFdKVUJMN05tYzJ0cmhoUGpMYk9EenFCcjdBVEgxcVF6?=
 =?utf-8?B?Y1J4MmlYbWJzaUlPNjgva1RCOVY4TFJqYlZUeTNpN1hkOFZITGFNYVBNdjFt?=
 =?utf-8?B?RjhRd0VNWUU3cm51czB4TjNuY256R2xlVklpSFNJTHpFMU5KVHFKTGorZDVF?=
 =?utf-8?B?ZWF1TDZ3U3lKNVpPY3ArSHd2T2xQTytxdE9ZVjZnVlFWNkVlVWFtZjdSbnQx?=
 =?utf-8?B?N0RlOFR6K0dTWVZJS002eHk0R1E4VkU4ZHB1aFRXWWhrT3JzWUdFSzd2K284?=
 =?utf-8?B?TCt5cEhrblA3Z05LRDB5YjRZM2dIU216S014RTBUMWhOYmdZQ0YrYkM1bGMr?=
 =?utf-8?B?QTBjRlhUTk50UTZJYlJjN3hiSi95NTF3RWRNVVNBTWZqRzMzNkhxRGIvZmJ2?=
 =?utf-8?B?S29iT09KaGpBRUdKZ2NYY3gzajNLOHJnbXpkMkF3NkhOU1dOR3Z2M08xM3Fn?=
 =?utf-8?B?UkFRYTVwUUZmVG5zNDJOellHNTBrak1ZTXlYTlMzTWVpYlVPRFFjN0hGeGZw?=
 =?utf-8?B?SzZvMU14emc5TmRSUlJ3VFMvazV2b2dxdUlIUXRFSEJTaFpBalFaMTZXQlNw?=
 =?utf-8?B?WUZBbnRadXI5RXl6VUFZcGtuSGVqSnNQYysvUTVNdHZXbklZazlqd2c2cDBC?=
 =?utf-8?B?WWtLVEMxUGFFZkIyZGduVXp0TExESGNRZld4b0w5RS9hd0ZCNC9tdHpib1RK?=
 =?utf-8?B?aUoyNko3OGpESXZSVmkrU0ROeEd2TGFpdC9FUE12Y2N4MFc4RGdzb2pWTG1T?=
 =?utf-8?B?S0ZXTU9KVDFCdmhFeERjSnBUSktwMEJWRE1wdm1ZeW1IdUgvWFloQld3S0dT?=
 =?utf-8?B?LzlRS0hiSWRsTE5nYmx0UWVuS1hKSEF0Ykc5MFNkL1RCOFpVaGVBRXNkdlo5?=
 =?utf-8?B?YVR3UnIzV2U5Qkx5bWQ0U1paT3RMSVA2WHZidkVsWWYycXlEVUhvWE43WUIv?=
 =?utf-8?B?QWJuTnV1MXRYQVFyenJBaWhoZUx5dHQ3Y0NaOWJZbTBOQmVIQ3cxT1ByTW9t?=
 =?utf-8?B?RGM2ZERuaFJjRTNIeVJLMDY4OVgxclBkYW1leitrR09xMXhoTm0vdVhOQUpo?=
 =?utf-8?B?NDQyVkprNEhyNERScXdmQ3lpdHNRVlQrK0lCNjF2YXdobWNROXBXdTBPNnVu?=
 =?utf-8?B?aExYVzNOS0dnNWhwYVJPQ3dTZUVZQWRNWmxrRmEyQzFrRERTaHJQRjc1NEgx?=
 =?utf-8?B?amRzM0xBRTRHZ1hkbVFDQTVyL3NMeUM3dW1KbUU4STg2UDhDakFWNmtGblE4?=
 =?utf-8?B?OVFDcEptbDZ4cmNMMSswejZwZDRSU1NsbVgyQW5tK0NyRVoxNEFIUkQrT2w3?=
 =?utf-8?B?SWZocHdTSGdHUHcrSnkycnhoSGE4dmlCR3NveTZRY0RWQzhVdGFZTmJHbm00?=
 =?utf-8?B?cVIyb2xmczdYbmpqa3ZvTmI5aXFQRWhFRUlQaDQzMmNMMkJoUlluWlRLd2lU?=
 =?utf-8?B?NzdRTmxsUDVKRW1VaDh1YTJQVUpyQWhCcDlBbENOMWhDZCt0a3BCT3hHc1FP?=
 =?utf-8?B?MnhXT01neVo1aVJPQ2tTQm8zQmszQnZMTGF2SC92TklyWmZScC9IbjBCMXVG?=
 =?utf-8?B?a0IwcjI5bHpDL0JXSWs4b0YyeTl1bE9sYTNXUFhPcVUrVWxYK1NZUlEyRFN1?=
 =?utf-8?B?c2V1ZVBTRXBzMW5CbDJwOUt4dWVVWWJwRUFSLy9JaWxUWG9HaUwxUTVOeEsy?=
 =?utf-8?B?azF1Y3Z6V203eTFTM2p0TFg1T3M5QUdkUXpYZ1pwWENLcFh2SlJSc20vSGw5?=
 =?utf-8?B?Tm5LVHRCT0FvbUxxSmpMa2E2UEZadzlTTWVHRzd0YTE4Y3dnSTZvUGlBNXI4?=
 =?utf-8?B?bE0zUHk2RFZHOEF5Ny9zY016cDVNdVdleXdTOStabkd4a0JWYjEvYkdQTngw?=
 =?utf-8?B?VXhuZFc5RXdUMmtpTGNuY0k0MXZMaWZiampvMlN0ODFVYk91Y1lhUk1TZ2pX?=
 =?utf-8?B?VElobE1iNmdSc1RpKzlxY0lQOU80MzIxd0hUTUNkalEraU9tcS9NczJnUHZy?=
 =?utf-8?Q?hfsw3lN7CX5o38mDBHOS4E0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 515b77a8-4570-49a3-fde5-08da0121d080
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:36:37.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61lFfKptwnHtvaafVzHUP7cthOCDG4JtMVeh2SFfHCL2drGJAGYQHZstpVu0x+F7597ou6PQNyNZG893BSfRKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4868
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 04:08:53PM +0100, Jan Beulich wrote:
> On 08.03.2022 15:18, Roger Pau Monné wrote:
> > On Tue, Mar 08, 2022 at 02:57:23PM +0100, Jan Beulich wrote:
> >> On 08.03.2022 14:49, Roger Pau Monne wrote:
> >>> So it can be explicitly placed ahead of the rest of the .text content
> >>> in the linker script (and thus the resulting image). This is a
> >>> prerequisite for further work that will add a catch-all to the text
> >>> section (.text.*).
> >>>
> >>> Note that placement of the sections inside of .text is also slightly
> >>> adjusted to be more similar to the position found in the default GNU
> >>> ld linker script.
> >>>
> >>> The special handling of the object file containing the header data as
> >>> the first object file passed to the linker command line can also be
> >>> removed.
> >>>
> >>> While there also remove the special handling of efi/ on x86. There's
> >>> no need for the resulting object file to be passed in any special
> >>> order to the linker.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Looks good to me, but I have one question before feeling ready to
> >> offer R-b:
> >>
> >>> @@ -86,8 +84,13 @@ SECTIONS
> >>>         *(.text.kexec)          /* Page aligned in the object file. */
> >>>         kexec_reloc_end = .;
> >>>  
> >>> -       *(.text.cold)
> >>> -       *(.text.unlikely)
> >>> +       *(.text.cold .text.cold.*)
> >>> +       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> >>
> >> What generates .text.*_unlikely? And if anything really does, why
> >> would .text.cold not have a similar equivalent?
> > 
> > That matches what I saw in the default linker script from my version
> > of GNU ld:
> > 
> >     *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> > 
> > I really don't know what could generate .text.*_unlikely, but since
> > it's part of the default linker script I assumed it was better to just
> > add it.
> 
> I've checked - gcc up to 4.5.x would generate .text.*_unlikely; from
> 4.6.x. onwards it would be .text.unlikely.*.
> 
> As to the dissimilarity with .text.cold: I wonder why we have that in
> the first place. It matches our __cold attribute, just that we don't
> use that anywhere afaics.
> 
> In any event:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit preferably with .text.cold.* dropped again.

Would you mind dropping the .text.cold.* at commit? Otherwise I can
resend.

Thanks, Roger.

