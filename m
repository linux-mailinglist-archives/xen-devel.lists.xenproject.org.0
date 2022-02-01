Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF14A6191
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 17:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263672.456513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwJq-0002qe-Oy; Tue, 01 Feb 2022 16:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263672.456513; Tue, 01 Feb 2022 16:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwJq-0002oW-LB; Tue, 01 Feb 2022 16:47:50 +0000
Received: by outflank-mailman (input) for mailman id 263672;
 Tue, 01 Feb 2022 16:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEwJp-0001jp-EM
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 16:47:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae893b9a-837e-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 17:47:47 +0100 (CET)
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
X-Inumbo-ID: ae893b9a-837e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643734067;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=iQ8aKLKi+QRqm0WFp5cY9I2IT2KtztKgt4ISNOrHVJo=;
  b=CnepMP1HNjytUTBCDPC5hdKLWqzSlqRFuLIda0T26xP3pwBJr3uzu0lD
   rpr1EBpE42sSWW2IyF13rgc8RfuWBV6ZBb7NhVAEV9fj0JxHNDUTALAUE
   EEZhCUK9b4v4oPpiu4VcJsM3RBISkVIbj/SjAcSgLE695Ukr8lcKbUaJL
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rBm4U5mhg7EzJd67m+tOSkD1koJKCPx5b6mkyO5J4Hk32Mvk8mCEo1gp+JaYXLndmlnK/WKAoo
 1IrDWcqdKO+UMUD3vtG0mtsluzZdA7iw1pKsDfP6LlJxXXuXPCDc3CuAD7HSh7vklsIE6HGcGW
 hnJALZOvI7qNpQVpZqK4FLtk7HZzjNMoyP2TqN67bVxPsLH+/HIICuJcr456/4rxCNOAq5l1A+
 5Azl0LsorCbpYTlbYggjtnzAbvUx4e4ZT09TuhKWYHxiZ5QEXKoZGXMoEgGGv2GOv/T+G2cuWE
 k9kSrRwiCab53pWQjHHCsMkq
X-SBRS: 5.2
X-MesageID: 63644287
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g2qAoaxIveAvFIEdeIp6t+e+wSrEfRIJ4+MujC+fZmUNrF6WrkUEz
 GAaCj+GOfnfNDHyctglb4m19k4FuZXSnYA1QVNs/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZg2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt95O1
 vdkiZe/cgECOb/xqP5AAjgfHj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEDgmts3JARdRrYT
 9UrNzFtXhfHWixSO3MoJIMHzMCF3WaqJlW0r3rK/PFqsgA/1jdZy6PxOdDYftiLQ8R9nUuCo
 G/CuWPjDXkyK9i32TeDtHW2iYfnnz7/WY8UPK218LhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVXRe1vXqFtR40QMdLHqsx7wTl90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt93WGx5GjLaacnS28aWpnSnvaAlSIHBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQevBCxWtamS0bbtT838JrW7FF5mLJtg43d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8Tom1CaiEMIsSM/CdkTNrGgk0PyZ8OEi2yCARfVwXY
 8/HIa5A815HYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bUl313DbOvCgGKod97BQ1bdhATWMGpw/G7g8beeGKK7kl7Va+IqV7gEqQ495loehDgp
 SDgAxIIlQak2BUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 altlxyoDqsdRzLZ1S4aaJWh/oVueA7y3VCFPja/YSh5dJllHlSb9tjhdwrp1S8PEivo6pdu/
 +z+jlvWEcgZWgBvLMfKc/bznVm/imcQxbBpVEzSL9gNJEi1qNp2Kzb8h+McKt0XLUmR3SOT0
 gubWE9KpeTEr4Iv3sPOgKSI89WgH+dkRxIIFGjH97emcyLd+zP7k4NHVe+JexHbVX/1p/r+N
 bkEkamkPaRezlhQsod6H7J69o4E5oPi9+1A0wBpPHTXdFD3WLluFWaLgJtUvapXy74H5QbvA
 hCT+sNXMKmiMd/+FAJDPxIsa+mO2K1GmjTW6vhpckz26DUuoeiCWERWeRKNlDZcPP1+N4Z8m
 bUtv8sf6gqejBs2M4nZ0nAIpjrUdnFQAb86spw6AZPwjlt5w15PVpXQFyvq7czdcN5LKEQrf
 meZiaeqa26wHaYen67fzUTw4Nc=
IronPort-HdrOrdr: A9a23:Io519K/3Bij5WvpnrtRuk+E2db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc69qBTnhONICOgqTM2ftWzd2VdAQ7sSlLcKrweQfhEWldQtq5
 uIEZIOcOEYZGIS5a2RjXjaYrQdKbG8gd+VbIzlvhFQpG9RGsVdB1ATMHfmLqQ6fngPObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Lj1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESmti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1ifF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAy7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1SwKpsKuZAIMvG0vFmLA
 E3Z/usp8q+MGnqIkwxh1MfjuBFBR8Ib1W7qktrgL3g79EZpgE986Ii/r1uop43zuNJd3B13Z
 W0Dk1WrsA8ciZvV9MHOA4ge7rANoWfe2OEDIqtSW6XZp3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.88,334,1635220800"; 
   d="scan'208";a="63644287"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVZn64yVMjR/KyHngXzqdOmfNdtDKiqRqnOWqDJ4Bd/0IDq382Ygi6jYnktIR3WAM1Pfk1acmaTkKKvW1p7Oe5Q7R7rLZRmRiFlYKfuEVM6H8PelONuqtH+rhq5jC4laNGz2X3UOhjP8z1XV5+3E0ZUfvehK+tHocBm80UP4WGSzKAibdScsDmq6nYAzzCqRQmMShLsrKwzy8yzDCTaPh6/T1vxTf0fQcoWR8CiAcwr4cN59pCrG7cFl6xeoIJ4/9l69PSDVDwkYkoj2h62SzFs1TpJozh16jMYJmJXpVAnh578T2e8W7KXOuDHaC2U30kmDz7jJev27VW/4zRHkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGPY1jN8DxvfaKtqXBqMnzr4TdR32OJ/pPgeJPgLEX4=;
 b=kaxYvJmUBtk4jxsSkM6zeVqOWKPTXk8clMYZ0GSmDVnBTFibFHsXHKcHrL92TWcFQCoXJxDPqFr8NOWg4NiSQDMaNyV9IJpQMpDEQ8FtvVZC6xSunsfSlK4QBARJkY8EBfpcNtjtTjHTWuI3MPCq/7pjzYO0Nl+Cr0LnNKJj3FmW5yv8QvH061EdlcmeKsHGIWD6STiCiAC7VXla3v8/1JeTTlUTWl9EL/hqrk68DvlQT9KSfXcwcj7hHFXrlcK4lE+Vh5z0z8XwV0OweYSFhly3+zZY45VBbtAY15z6iECVaFoDppLBuQWCOYeiiJhs31IH+c9znKe/SiFpP5pTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGPY1jN8DxvfaKtqXBqMnzr4TdR32OJ/pPgeJPgLEX4=;
 b=PoMM35FnbA8FyTbfKoJr8K9XKz4Il8FXKmbcy8GJN2m1D5G9FG/qjoutbar88+jPxTSqijcph/LuaJtlMfYE+h8M20G2IeWKnAU7S2qr2wjXK504Wy56EX4PT1TwPJWTjGWJUrQMdHZAFrkoPh7ArVnscTjTKBDjC7eGcA8T6IE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM guests
Date: Tue,  1 Feb 2022 17:46:48 +0100
Message-ID: <20220201164651.6369-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67e59fdb-8660-444c-61c3-08d9e5a280ec
X-MS-TrafficTypeDiagnostic: SN6PR03MB3565:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3565335419097738D6A28FAB8F269@SN6PR03MB3565.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eGxltsL0f/Za4UVeC5LQRhhNOe7mv+QfrtlZhjmBxpctJvYYIlZsCPGcVPsN3x4OVE5q40uk9Mt4UVRuY9piI2M1WcZf67VyDCmjP7xvvJQUie5/PLR/N+28fI2rBy0U8vBm7HNP2+SzLGyw2ivQuQO2lcdR1b6lMf4nx8i+g8qarfCvwSHfwo4V/e6GZL0LkDTtISd4vOI0ZL4niB8QzI4yqXzUGlc+FfM+jm/ktK7Ln74sUJkqA1aJjAW7PFO/LgmwevS3ZEAsuOVcHz+L0p98ChvgDNsuaqoYBXXGi+oJMqRylVf5fitlN5wxV+xvdJycM9hNElZ+GmWyM7xSqW7e0aguKeqPoTYiIO6fCkQjKjA80ZGzONfbGQwMX9hQRCs8mRWblJSU1XniUGnIlpu4M+rcrl5SFXqnWvU+ErFNeby6j3IhPCHY5aRKfIFOu2luslE3H2Eju+9u5oo+Z3tPr+KtJKer0ZmXVd/wLADRubJBzpEP3bW2k93p60tqsuJYMd4R1HXmAcfQ3q8HFCVAfkuTz5ie364mNLwwvL+/28WdMB0jYZ8WiPRtJd0i9WglBlh2MfAJYVgURQcmZ18saAKKy5ilEuLbdeAc9Ay3um6X2o1efIK8VbdF0KsUBx0Tkkf34E4iWOyybPTNVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(66476007)(66946007)(8936002)(4326008)(8676002)(508600001)(5660300002)(66556008)(6486002)(38100700002)(83380400001)(6506007)(36756003)(6916009)(82960400001)(6512007)(26005)(86362001)(1076003)(186003)(2616005)(2906002)(54906003)(316002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFpPUFZRTDM4RzdPNHBncFY0M2ZDaWoyMTFyNHF5QnhLMEhPSHdoclA5Z1Fm?=
 =?utf-8?B?QlRhcWVnMHdwMy96Tjl6TnE5K3FQQWNmZHlKZVdqcDlkM1lYQWtpcDZCbzBB?=
 =?utf-8?B?RDdiRmd2M3p1NG10TU9wcGpQTmwyV3JuMml3SURycnNpTVpmbFhHTzN2U2RE?=
 =?utf-8?B?MHEwWWU0Z1NiWGM2R0puSk5uaXY4dVZSdmpINlQvcG52bFNSZXhpVDZpOHY4?=
 =?utf-8?B?Y20zSVVIMW1NOXNkaDRnbGcyWVAzVXJ2aEd6Y3JReTZwWEt4bTQwK1JrWGY5?=
 =?utf-8?B?eXZkT21HRStIVG5oY0ZyVVJaTmNKTWxNMGt1bWN5VDlmbHFSY3Z1VmtNT2Jh?=
 =?utf-8?B?MnhKYTNzaUp4cTdZaDFhOXp1WnNKWXJzVFVGek9wVWF0UVF2NndaejJYZUxB?=
 =?utf-8?B?UDZKQUhUVFRmU2J0UmkrTjlVc3lFa0ptaFV5dzRLWThrZ3RBUE1wSmU0aUp3?=
 =?utf-8?B?QjM5V1lMQU4vU2E1M0c4emZ2ZDlMNFM5R1djbTdQcmlzUnJTREtpSzUrL0V3?=
 =?utf-8?B?RkVjNkZ6bStQcmtQMGpFRkZpQlpHdFVPTnZlcmhuaFRXS0JIMjZoUWMwTmNj?=
 =?utf-8?B?dEsxNFRyV3JrZmZtUUttMm01eHNJcTVpOUdBbjU0UnlqbmkxTDVrS0ZtdlQz?=
 =?utf-8?B?eWltN2toRlhZcFBNb29LUnpEcTRWSVVmQ3Bsd291YTlEcnFveUlCT3FIdkgz?=
 =?utf-8?B?Q2tsNnhJNmNlQWNDM1lmbWhhSUl0bjBjbS85RzlaVUYyWGVRY3grT2pZcGxO?=
 =?utf-8?B?SW1UU0ZpekxJZmFVMi9Dd2VjS3I5ajdHcUMrcHBQMmxxREdQN2UxL2E4TW9U?=
 =?utf-8?B?Ykh5dFRjSjVWNkxTdWhCOWo4MXFObUhrTExkZDdmSldTUkpYelFOOFAxc2JI?=
 =?utf-8?B?blY1ODhJNW4vZHhaOG5OMVc3K3MxWHUxNkxkL25WeTJoaE1hK3M1MkJpWVJk?=
 =?utf-8?B?Z05xTW16amtNL0ZSVmtEYkhmcVQ0YWpsRVVkQmUxQkFqRkZrRGs0UVZLbUll?=
 =?utf-8?B?ZGhtTXBIZll3ZG1iN285dGxJM2JWZ0RHRXJtWGZOV3FGUlBwT0ZiRWtQdEJE?=
 =?utf-8?B?NGV1UHdkc0tGZnJLNlVxNUhqcmJmMXZJWlBTZVFQT1dXWHJsd29KVXVDTGlP?=
 =?utf-8?B?TTZIT2RzRTIxdTZvY1B0YXVIcXRjRXlFSm10L1RMTVVSOVdJOEtHWi9kTS8v?=
 =?utf-8?B?WlUvRHR3UjBMTjB5WkMyWGJKaUZuVXpMZzdJUHozRkdLbC9VK2dydXNjUG1s?=
 =?utf-8?B?VDhraXF2b1loaVArcGw3UjNMZGp0TFllTVZiVXgxVmZvSDRxKzlxQ2FFRktx?=
 =?utf-8?B?TkJ6UHA2RndhcERQWldSODVDbitXVW43NUh4d2ZDMVZiekFRNE05UnRwZHlt?=
 =?utf-8?B?d091UUxkanU5ZnRaTFJCTjlUdGIrWDh0K2I2YkV5aXUzaFNLTTVvN3J2TUpB?=
 =?utf-8?B?RVVlbndVaXVYekdsT29yOEFTMmVoNVZXVHpXZ1NZU040Nno2eS91QXhWRnpn?=
 =?utf-8?B?aTlUbW96MHRsNkwzQytxcDUyZ05vdFVTMHRLOHV3QUtlN0FtMjlreGVGZzdF?=
 =?utf-8?B?STFYNXZnS2tLR1BlNzl1QVYxa3czMEppbTV4eEFmbVB5WDcwZ1VpNHMwcXJu?=
 =?utf-8?B?QXlBUjhZUWlvZ3Q0Z1h3Wk1nWVVwcytsd0pmUVlEZko4QVpGb3JLU251eDlh?=
 =?utf-8?B?L2crVi85OWxqZXA1NTYwTGZoYzRGY0hOUjhYVnMzUWZUTmlnNFdDVmZhVUIv?=
 =?utf-8?B?QnBuK1o2T1BBU0MySDhhY2s5OHR0ZzR4dXVINEROTHZNelVWV0ZTOG50Z0ht?=
 =?utf-8?B?STZ4U2o5LzhTL3pmQkMyMzh1ZEphU1dLV0hkNDlIZU4xS2w0TTJvOTNyZmJQ?=
 =?utf-8?B?U1BsUUNVblNkbmJwSXdQY0VVS05xd25nNVBrZ2lnV2Q0c2VJeXZRZDJUZlFz?=
 =?utf-8?B?R0lLY0hpcWVwcklWSUUwSGRFVUh1Qk9RbmlEYnQ4TnZCbGdKdndTbWZrRllr?=
 =?utf-8?B?QmtGSXd1R2FvbzY4REFXb285NDJzdnNqaktzakRnM0JuUmQ1QU9nMGxmRnpJ?=
 =?utf-8?B?VVNYK0FvRmtlZWM1MDIxMHlpeXM5K2c3N29pbnN4SEl3UU9iUHQ5TDJad1U2?=
 =?utf-8?B?NnV6ZFdnMHpKQlBkbjc1UEIwZXlpYnUxSXRYTmozUnlJSUE5K0g4YU9DS0Jz?=
 =?utf-8?Q?zjLxDMKO0bBF8hpc8clz7Tc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e59fdb-8660-444c-61c3-08d9e5a280ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:47:16.1960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGcJfQOzqHlEU7tVt7ky2yj5IO7me2txUJ29ntI6JZRSGzyOipS1PXblHX006fwd5vEfnXDEmdAHgAM31pW1tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3565
X-OriginatorOrg: citrix.com

Hello,

The following series implements support for MSR_VIRT_SPEC_CTRL on
different AMD CPU families.

Note that the support is added backwards, starting with the newer CPUs
that support MSR_SPEC_CTRL and moving to the older ones either using
MSR_VIRT_SPEC_CTRL or the SSBD bit in LS_CFG.

First patch is quite clean, as it uses the shadow SPEC_CTRL in order to
set the SSBD bit and have it context switched by Xen using the existing
logic recently added.

The next two patches introduce a different way to context switch SSBD
either depending on the underlying SSBD support, so it's either using
VIRT_SPEC_CTRL or the LS_CFG MSR. They also kind of overload the usage of
several spec_ctrl variables in the hypervisor in order to store the
status of SSBD even when not using MSR_SPEC_CTRL itself. I've tried to
document those in the commit messages, but it could be controversial.

Thanks, Roger.

Roger Pau Monne (3):
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
  amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

 docs/misc/xen-command-line.pandoc           |   5 +-
 xen/arch/x86/cpu/amd.c                      | 116 +++++++++++++++++---
 xen/arch/x86/cpuid.c                        |  18 +++
 xen/arch/x86/hvm/hvm.c                      |   1 +
 xen/arch/x86/hvm/svm/entry.S                |   8 +-
 xen/arch/x86/hvm/svm/svm.c                  |  67 +++++++++++
 xen/arch/x86/include/asm/amd.h              |   3 +
 xen/arch/x86/include/asm/cpufeatures.h      |   2 +
 xen/arch/x86/include/asm/msr.h              |   6 +-
 xen/arch/x86/msr.c                          |  15 +++
 xen/arch/x86/spec_ctrl.c                    |  11 +-
 xen/include/public/arch-x86/cpufeatureset.h |   2 +-
 12 files changed, 230 insertions(+), 24 deletions(-)

-- 
2.34.1


