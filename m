Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF84A6192
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 17:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263669.456483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwJa-0001n2-Md; Tue, 01 Feb 2022 16:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263669.456483; Tue, 01 Feb 2022 16:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwJa-0001jw-EA; Tue, 01 Feb 2022 16:47:34 +0000
Received: by outflank-mailman (input) for mailman id 263669;
 Tue, 01 Feb 2022 16:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEwJY-0001jg-O0
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 16:47:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3a158b4-837e-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 17:47:29 +0100 (CET)
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
X-Inumbo-ID: a3a158b4-837e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643734050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=tYlfStrLrbzHtKiANWWxe3HTgEbBnEM//TYWYX+uBeM=;
  b=E7x54TpG/e5gghhCF+80k7h3EckdXkzquxaftxku+wkZ58stjTlau+dx
   enKWTVwBvrIBoEqXSw1UlBIEIm1x6QoBFVrx6skLGTXVZXX4qzSzJtUe/
   8U3za/6a2eTetznYVA6zshWI6m4YrB24dHZ07IsxYxSUNZPbTvZabFWxW
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UgnSOZDn3Or0tPH+2jb8nlykhHitL4N2m/QjOlD7NnjZCAub/+H2KgUBpv6QmHTOp7eOSci8yv
 TOduuQeISxySBtBbuWs3kWzNBfmSpnx4mf5wHIaZLdPWWOIFofOM5/U+zKBKmRkKSlvOte/vVm
 2E2tAkpNrtMVwEaRvNaR92QOCadN3Llzevf6vX8Ow5Q1dY4g6f2l/82/UkHUeqmghMUBCfvNpd
 I2OkWyvutI+9J9KBUYGE5lPogvbYyHQWsJirI0It/sLEjLQmFIXETPImACaFMyfJar4d+EaugQ
 fb6gBCWRE/IrF3aPcxruPCUD
X-SBRS: 5.2
X-MesageID: 63238769
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4+waRKx7pgOuquK7jIt6t+e+wSrEfRIJ4+MujC+fZmUNrF6WrkUPz
 WIfDWjUO/yONmr2fNx0Otzi9xxU7cCByIUwHAI/+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZg2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4pOj
 +QcjbKccgkoHJTSg70AaRtoHC4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEDhmxg2Z4fdRrYT
 +4dWzEzMBjaWAZWIg9HB8MYmNiqqnaqJlW0r3rK/PFqsgA/1jdZy6PxOdDYftiLQ8R9nUuCo
 G/CuWPjDXkyK9i32TeDtHW2iYfnnz7/WY8UPK218LhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVXRe1vXqFtR40QMdLHqsx7wTl90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt4nWQg0+iJO5cnyc1I6KtmqvAyolImBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQevBCxWtamS0bbtT838JrW7FF5mLJtg43d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8Tom1CaiEMIsSM/CdkTNrGgk0PyZ8OEi2yCARfVwXY
 8/HIa5A815HYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bUl313DbOvCgGKod97BQ1bdhATWMGpw/G7g8beeGKK7kl7Va+IqV7gEqQ495loehDgp
 SDgAxIIlQak2BUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 aJtlxyoDqsdRzLZ1S4aaJWh/oVueA7y3VCFPja/YSh5dJllHlSb9tjhdwrp1S8PEivo6pdu/
 +z+jlvWEcgZWgBvLMfKc/bznVm/imcQxbBpVEzSL9gNJEi1qNp2Kzb8h+McKt0XLUmR3SOT0
 gubWE9KpeTEr4Iv3sPOgKSI89WgH+dkRxIIFGjH97emcyLd+zP7k4NHVe+JexHbVX/1p/r+N
 bkEkamkPaRezlhQsod6H7J69o4E5oPi9+1A0wBpPHTXdFD3WLluFWaLgJtUvapXy74H5QbvA
 hCT+sNXMKmiMd/+FAJDPxIsa+mO2K1GmjTW6vhpckz26DUuoeiCWERWeRKNlDZcPP1+N4Z8m
 bUtv8sf6gqejBs2M4nZ0nAIpjrUdnFQAb86spw6AZPwjlt5w15PVpXQFyvq7czdcN5LKEQrf
 meZiaeqa26wHaYen67fzUTw4Nc=
IronPort-HdrOrdr: A9a23:fdcKPKAAb/xcNavlHeg0sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MA/hHP9OkPQs1NKZMjUO11HYSr2KgbGSoQEIXheOjdK1tp
 0QApSWaueAdGSS5PySiGLTc6dC/DDEytHTuQ639QYScegAUdAG0+4WMHf/LqUgLzM2eqbRWa
 DsrfZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLokys2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REYGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUATwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+aZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUx4S0LpXUN
 WGMfusp8q/KTihHjLkVyhUsZCRt00Ib1a7qhNogL3R79BU9EoJuHfwivZv2kvoz6hNOKWs0d
 60RpiApIs+PvP+UpgNdtvpOfHHclAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,334,1635220800"; 
   d="scan'208";a="63238769"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtiXVl+vxoX0qx+ZjiP5TpwMAiLEYQcoD6FdyjkkTHZEwKgGuecCTKDwC2xpdNNreC3m6QAMuXH1uNmfYEi1ROgEiNWs7gKYAZiXlhPfUEfOiiJK/QR9COVHM4EkqDAcCF+rYu4/hU+fVDZoPSP7juSItgZ4WbahuFxmRPJ86rOyINda7Aa5MAkgXelhsorf3uq/rwJQEI9EGJDuBZDPvnFkqHJ+UwoF4ew5qdkc98RsmZeLa3nR8SregzccC2iHGOwbtR+oTY/LzRRp/tqQa8P7J7VzF7Tba1N0XYukvGafMHSPdABzak9dWSLXr4ykpdSb7HOBoj/S4TDReS18xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uw4nNchZqs0hUl6LILWnvwkTezS63JG+YIFkjLmR6us=;
 b=RfQBi+ice9mdQB+DKppitWjDImE4NEjHSRiFgzEdmS8S2wNXHFtPBSRDP2vGIRq1X12zT8FAolcMgKpJnhbT4AUbKF8P/Wpp0jTE4Q+qBXyL1aZOTOxlTDXoxU6qEcPvXBIjA3k7tNCi7SlqkWhUIro11mEEiOpqUp0fy4pveOSd0u5I1RnPmXJ2QHk+WPiGUxAGc4wDaysSZ/6mIUnDrBXrnyNbGS0c65J7Um+YUprpj8s7/15u6m+Acb5oOnLwo4zPqzYuKoFO6+rcJeoavvp2EAPB3B2h+X8+jyNzB1+0va4KX5xl+B/662NG13zqVePeuNtU6Sy/qGLSKd7SVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uw4nNchZqs0hUl6LILWnvwkTezS63JG+YIFkjLmR6us=;
 b=Pyq2crJbO1gyE7b8aUZCFeLELQDfTohqJGg87Fs5mveVMvrg3ov4hSB5t84VlBaS78WzgMkE1kUGPMBSt/88oIHWVG2uiXhKJeIK+WOhy6HH9yga+bVIIDbCRJkdzoHzYFwkY5V2HFbHlDuzFEJs0hwSmrbARU9ywpLT6LBBU0o=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
Date: Tue,  1 Feb 2022 17:46:49 +0100
Message-ID: <20220201164651.6369-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201164651.6369-1-roger.pau@citrix.com>
References: <20220201164651.6369-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f9f5769-2bdc-4f64-f8f7-08d9e5a283e9
X-MS-TrafficTypeDiagnostic: SN6PR03MB3565:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3565C8733C90867C761BEBB08F269@SN6PR03MB3565.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 49W7SwZ1Om81O+2HnO+IHf51Cm2Mr8umc5ZL3TRSz+cnCS0DTkIX0Ik8s40bGoL51H7QStq2yyBI/r5R2mxg8dYQ1cIcRBnuJ+BLLYkPhsMNYmHDWiTUzKxTsBXxS4oZ7PHxX6dTK24x17a4VGnCjJqAdLQaHr4IDxXR4idhNvyphaluARpfBO45F3lDURbttB/EFKtgb72ujvxk9BvW9wHQmR3+f7RZD211MeHS86h53T/KDtMXFJKOGMsuSqJl/SjbGyOQko79qFEjnOxDKWFVp+wWPuetSV3/TLvh2otVrFfmC829FWb/P9ieRfvQyIG1gqtpKXkJoqu/Gg5Svo9svySUyFyrUYTmFe1lMdqR9JeZVcYchur6YRcKOAm29IB/mQ6yCdIcUXVwcN12TKNMFilKRU0mVvIMeUsTWPRRRP2ONVgQE4P10DwX1MKmF+FEbNvHsli0lmWn2jr6IgiHmQZxEc7bZ/XEIy+eDDs5aB1rWtCh6KPQ0rsIgE+deyYBUIKv69NsPuSzo1C9OXu72HUh07RBPkygtfoOA8YFNaTj5xLBF4ksPqqdUKh3Yyu3FjLsM658Hgaw/FSu9tIDtT+xfDwAOPkez1MbQkMXMxXK1EOQWIRLi9GSmI6JgYi/L2U70wKS84Epkgw6jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(66476007)(66946007)(8936002)(4326008)(8676002)(508600001)(5660300002)(66556008)(6486002)(38100700002)(83380400001)(6506007)(36756003)(6916009)(82960400001)(6512007)(26005)(86362001)(1076003)(186003)(2616005)(2906002)(54906003)(316002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk9vKzRsRzJCWDNFeGpNTlZMUlF3NThzakN4ei9ocEY2Y0hicWxiRmtRdmpv?=
 =?utf-8?B?NnViakQ1VGdWTWplamFvRDVxS0FjQ3VkdVZ0aGR2eXllci9hc00zWlVFK1dh?=
 =?utf-8?B?Smg4dDc0OENWRFpZRmsreDE3VzdWcVBRNkdqQmRjYUtVNExBMEQyS2hpb1Mx?=
 =?utf-8?B?RzRSbEZIbkRRVU9mMnZIczRZK21oUGpmSlFORnUxNStyK0Mxa2QyYUhQY09M?=
 =?utf-8?B?clg5V21yTmdESllUc25kTEgvb0N1YWpPamxob3pSTzlsQTNNZXNRQ1A4R3Qx?=
 =?utf-8?B?bjBBM0h2WTV6czVISDVoWGR4WVYwOGRGWlZFcS80S0F0RzFBMTVzVUZGd0FN?=
 =?utf-8?B?SGRlZXlSQ21aTVdFMXlVOXVIalR0a25JZlhCc2NWWVV6T3VVb29EVnVJOU94?=
 =?utf-8?B?elVsYkVERkhhM0FFY3hhRit1ckxmT1pFNEM1UzRpSW44MVZ4bFZxUm00SFlN?=
 =?utf-8?B?RVFqTE9TNnd4bzhnL3hhZjZBMmJQNDlXazd0ZWNnU2dFZlFid1c5ZzJuTUtF?=
 =?utf-8?B?WXRJR282dTFrZDBkZEVQclF6Z2poc0IvRjkzbDZtOU9ZUmRrUzRzdTAraVN4?=
 =?utf-8?B?S1BTMGx5NVVkSm1xZS9oUi9xK2JvY1UvMy95VzM4aDB6MXlrNkQzRjQ5RGQr?=
 =?utf-8?B?dHZhYWxaSzArdjRaYW80V1lvN09LcFBjYjRqU2hwNmtXdmo1VjJzQ2JGbUxl?=
 =?utf-8?B?NnhJblpzQWxLV2Q1N1VXeDBLdkF0eGFLSlQ3aWRDdlg4QlZYUHd3WUszckcr?=
 =?utf-8?B?eURVMVVXNWJXRkpGVW93TzgwaFB0VzFFOXIyZFpkWVhDYW5KclkrU0w4NnJx?=
 =?utf-8?B?VVNRbnR1M0d4OGVqTGQ1aG1HN0RJaTVSUDhvai9MYmFFYU8rZGVYY041UjBa?=
 =?utf-8?B?ZnFTVEVtOEtnQ2ZJcjBhL05jQkh3NWtEREl2Z2FwdFZ6UFdnOWJXeTFRMDcv?=
 =?utf-8?B?anA3WkJtOWJuYnlPeTd5aEVzVkMreVBvSTM4NDUvMENJalRBeEVYQm5QdDlM?=
 =?utf-8?B?em9PaXRCSHNkTUtOWitVWm5rSHp6c3lCOFpadmxpQVpiaTJVV2Iwa0xFWUpn?=
 =?utf-8?B?RUE2NkQvb0hmSmZEYU51Z1ZKN1Z5SGdtTHpzRDM0TXlUeEMrRDVXdmQ5b05p?=
 =?utf-8?B?YXdjb2tkSy9JbEtHNUg4ZXBuNW5rZHJjMVRxNFRSUnV0Q29SZ0J2RnFqOXhi?=
 =?utf-8?B?WG4rdnpyQitod0FscmVKL2g1bDd0dlBFRnBqUHV0d0k0d1BVZGx6aVZDS1B5?=
 =?utf-8?B?MlBMWXFsYTMrdUpuU05FR2V0aWtVazJTWDhPWGlTdHlUSllheXE3bCtEaUt0?=
 =?utf-8?B?aUFWKy9LRHA1NWQ2Z1VSODJQN2NBb0F6Y24vR3BjTy9wN25PQjVSU3lmQXZs?=
 =?utf-8?B?OVFSUGhsempxS3BYRnR5VzNiOVNrNGFHZHNwWlRjTDBLTlFQdVd0enJ1K21r?=
 =?utf-8?B?Z3l1RkRtOVBLNnFaOHJBSm5Zc2pla1hia215a0pJdHhQNC9acWh0NlJVeFhJ?=
 =?utf-8?B?REc2T2FjZzZXNTZwaDhOVVBoVjhHRFZTWU1JSHJobnpINmd1Z3dOUTZ3cHdU?=
 =?utf-8?B?TWNkOFdKV2ExelFDaTROVWRNUTNxd1FXNXY5bjVYNGNBb2J0ZVRrZElqQndH?=
 =?utf-8?B?SFdNb3ZtVWpydmdRbFlhSVVQWGJKcWJIb0x2NVdGM0kvbVIwMW5oVUFsSGEw?=
 =?utf-8?B?T2xQaVVFdDNhc3JjdU92d0FPYVg1THVmZUJlSEkyWlkzT0d1QVdHcFdVSGhT?=
 =?utf-8?B?MTUwV3hOUWUvb1BpeDBSekk5T3BTRTNaem5WYVNCV0ZJSnpyNjdKN1hWOWZV?=
 =?utf-8?B?aDZEbkhrV0VONUZmNlZRQXBJZ05lL2crTGxMV3loMlI4aWcvZDV4WmM4SER2?=
 =?utf-8?B?TDlWeW1heE5vTExlcXJxVVhXWHJhTzJvWHRxcVJKNlhTR212SjFGekY1VHpN?=
 =?utf-8?B?UEl5M0ZKeGp2N2lHR2k3QkZlU2U0alFDQy9yUlZWeTFrcVlaUk54SE9lTEF5?=
 =?utf-8?B?cTZGNE5VTU0xYWNxaGNTYjM1ajUrNkdOTjhFekhrUFFwRENhSkxET3lsTE9H?=
 =?utf-8?B?V053aUdCRExPVWw4UFlTLzJzNXBjK244RTJnZk5JMzlJQkovZndiOEYzbmhP?=
 =?utf-8?B?bzFhdHcrRHZ3Q25KQk1XOHBqVHRnVjRDQzM4SjFmREpkZCtiRStYMy92aDcv?=
 =?utf-8?Q?uRvcOra/V2ijaG05XNRkbm0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9f5769-2bdc-4f64-f8f7-08d9e5a283e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:47:21.1184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLrJImdvFwdp/DERnpT8YRumsTXvj5u7Psmue6uFIHclhnyw/6tdtLfC8YHitURTuVhkuwd4y868rcN0QFdFRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3565
X-OriginatorOrg: citrix.com

Use the logic to set shadow SPEC_CTRL values in order to implement
support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
guests. This includes using the spec_ctrl vCPU MSR variable to store
the guest set value of VIRT_SPEC_CTRL.SSBD.

Note that VIRT_SSBD is only set in the HVM max CPUID policy, as the
default should be to expose SPEC_CTRL only and support VIRT_SPEC_CTRL
for migration compatibility.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc           |  5 +++--
 xen/arch/x86/cpuid.c                        |  7 +++++++
 xen/arch/x86/hvm/hvm.c                      |  1 +
 xen/arch/x86/include/asm/msr.h              |  6 +++++-
 xen/arch/x86/msr.c                          | 15 +++++++++++++++
 xen/arch/x86/spec_ctrl.c                    |  3 ++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 7 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6b3da6ddc1..081e10f80b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2273,8 +2273,9 @@ to use.
 * `pv=` and `hvm=` offer control over all suboptions for PV and HVM guests
   respectively.
 * `msr-sc=` offers control over Xen's support for manipulating `MSR_SPEC_CTRL`
-  on entry and exit.  These blocks are necessary to virtualise support for
-  guests and if disabled, guests will be unable to use IBRS/STIBP/SSBD/etc.
+  and/or `MSR_VIRT_SPEC_CTRL` on entry and exit.  These blocks are necessary to
+  virtualise support for guests and if disabled, guests will be unable to use
+  IBRS/STIBP/SSBD/etc.
 * `rsb=` offers control over whether to overwrite the Return Stack Buffer /
   Return Address Stack on entry to Xen.
 * `md-clear=` offers control over whether to use VERW to flush
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index e24dd283e7..29b4cfc9e6 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -543,6 +543,13 @@ static void __init calculate_hvm_max_policy(void)
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
         __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
     }
+    else
+        /*
+         * If SPEC_CTRL is available VIRT_SPEC_CTRL can also be implemented as
+         * it's a subset of the controls exposed in SPEC_CTRL (SSBD only).
+         * Expose in the max policy for compatibility migration.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * With VT-x, some features are only supported by Xen if dedicated
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c4ddb8607d..3400c9299c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1332,6 +1332,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
+    MSR_VIRT_SPEC_CTRL,
     MSR_AMD64_DR0_ADDRESS_MASK,
     MSR_AMD64_DR1_ADDRESS_MASK,
     MSR_AMD64_DR2_ADDRESS_MASK,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ce4fe51afe..98f6b79e09 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -291,6 +291,7 @@ struct vcpu_msrs
 {
     /*
      * 0x00000048 - MSR_SPEC_CTRL
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL
      *
      * For PV guests, this holds the guest kernel value.  It is accessed on
      * every entry/exit path.
@@ -301,7 +302,10 @@ struct vcpu_msrs
      * For SVM, the guest value lives in the VMCB, and hardware saves/restores
      * the host value automatically.  However, guests run with the OR of the
      * host and guest value, which allows Xen to set protections behind the
-     * guest's back.
+     * guest's back.  Use such functionality in order to implement support for
+     * VIRT_SPEC_CTRL as a shadow value of SPEC_CTRL and thus store the value
+     * of VIRT_SPEC_CTRL in this field, taking advantage of both MSRs having
+     * compatible layouts.
      *
      * We must clear/restore Xen's value before/after VMRUN to avoid unduly
      * influencing the guest.  In order to support "behind the guest's back"
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 4ac5b5a048..aa74cfde6c 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -381,6 +381,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
                ? K8_HWCR_TSC_FREQ_SEL : 0;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
@@ -666,6 +673,14 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             wrmsr_tsc_aux(val);
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        /* Only supports SSBD bit, the rest are ignored. */
+        msrs->spec_ctrl.raw = val & SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         /*
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ee862089b7..64b154b2d3 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -395,12 +395,13 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
+           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 957df23b65..b9ab878ec1 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
-XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
-- 
2.34.1


