Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5913A345B89
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100567.191714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqE-00087P-Nb; Tue, 23 Mar 2021 10:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100567.191714; Tue, 23 Mar 2021 10:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqE-00086p-IE; Tue, 23 Mar 2021 10:00:50 +0000
Received: by outflank-mailman (input) for mailman id 100567;
 Tue, 23 Mar 2021 10:00:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqC-0007wL-Fk
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:00:48 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ebd2044-365a-40d0-a972-5e54513d72ef;
 Tue, 23 Mar 2021 10:00:39 +0000 (UTC)
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
X-Inumbo-ID: 8ebd2044-365a-40d0-a972-5e54513d72ef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=h3ITOhX7tv2nwa7YAoQOgR1WKEOc5xT9SsXwsOaKEa0=;
  b=O5E6RJPaLqg72uneRLpxahDg5tXw5YI8BHZfuQheRYwabR3Ug1+VScA5
   veLw3BalNHyE/AFN++llu2Lyej/MROVoKaFA7lpsBQCI31J5jbqtR3Som
   PRxzOh84AuU6/4uZ3N+1we6tMbQhW8KovCZZeqn0Ep3jnwCnso467ehvm
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DoQAdXkY97gRg0xOI82IKO2YpwLHJeSaoo5SLrVHhfW2tVadrVJsD81WdeNze+YHrTCUEAHnZV
 s5Ln591fNZGgaa6JQfzRVDFl2lE+1FvWF+o4Ni2pvOMVU9c96C0m1DblSxlOcQ3wZpTjwjcY4W
 Kq4/rBXW3cRRdRcAkMjxqA9vAf7KxMn1d6FeT/xW9e9ZHNmZZ0sc9/zVL7fOqicIZ+/BVBFB7D
 4lgpUu3oCdLo6LuZLkSLeoY8U6S6xFLQVNXLIKz5gSYat7z1tiN8VehX5yc9or+trGEtqCpIHg
 eEE=
X-SBRS: 5.2
X-MesageID: 39900342
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gNsv8KoOWVYjYSLLCSg654EaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="39900342"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4T+UxrA1vFb2VU7u6rOYvVMqWlLUTSndwSRVvhrNalwAhg0502GGSU7r68hLc0fOSGjnp4k9TCVuRLaRFVw0C36IGX/5HR5X7kzhWF8xtIMlrxaLF1x863dDRWanhxxfSL76hmCDHAwBPojm0hunYTCAo08vQY0DKfTe9xSaWZFbleygycvAEJRkDFx5C3meu0EGr+c2UbQ90BoEE0Py/aHwOPePDoXfcQ/tXiHTHtjUA9FcC2tdE8cmNUMiOJvpvj8wZPb0UHaNqgBBLYC7tfWC9NAQkRpsDJ1IYrY7G93tYmWHlAW5zNqEfwQvNhs/2DVxpEn69V9QlwQ6EQJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLD0gqExlSO+XE2AhvF0loGaIpssKAiJtCEzPFIxt+I=;
 b=mM4qGr6DrUO1XCpWDLopRqflOsOmaZt++8DtePWEfDyuZZqKQI0uo0KkIYhwLgbxkSHrH6CJElH7/Z/lmJO+wdCoJqjUj0F3EMm/Afbwq1efiAPH9IbjT6wYlTTIVcwLe/1573TexNrSMiC49iFMPGoSvdIFNyVGMeo7Cg+v5xzmD3QI46/I5eroTaZ54R+duP/fE9mUc6H2o6Iy/Gl8U0oebybHkVGyM9SP9akPxKc1A0dJBCygnRIDo09LdLKjWWj6j8RkK9jxFilO07tz6FibqiTp9bMW9lQx8FbhoirXfuKFLYFcSXJNUCpFksA09uGBphkCkn82SdR4Rl5iyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLD0gqExlSO+XE2AhvF0loGaIpssKAiJtCEzPFIxt+I=;
 b=K+1pIRti4OggngmJ+ZzjtYTRmuFgJCK9wVwDLB84kxre/vPJuSMhxvUNiRK+dJEK/YU4B8jBUOBvnUiHAnsq9iBcoNdFpNBeWNopVLjuTuHgx1jnqTpF+wivCcXEVTDj8LRvV1sBK2842CSbnX6ZKz2/u18GIr6wYuoszat/8Sk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 10/21] libs/guest: allow fetching a specific MSR entry from a cpu policy
Date: Tue, 23 Mar 2021 10:58:38 +0100
Message-ID: <20210323095849.37858-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0041.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c29a07e9-d2a4-4b80-6ad7-08d8ede280ac
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49696C48F1B6D8A9A6C525EC8F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a2xPCDEFULyMxzkcoZ4/YVb/APADbiHa1/YPHvfUYgYmvq4XE6+qG5L9W3NFaiAdE11e0nzaVZSKgewg0bWhSo8p+o8Vox0nr9XHYw63zqtGaDGDVevaKKyoGyqvhq9as8Jw/rdeIkiU870Sx6W44fVYILoot1yhDACe5M2xNh/FvYIG0eSFuoGsLHYtUvI9c0EVQz2fncYOV05nYRYwZDNVWAGwGgmNRYZJD0mEGYc5/YyVkaSRJkWaWm9/PUHpAg4fWGnGUtVkF9cKHYRQMdX26OFf+Twvb7MUPVPiq+seqcjyhaai6y0JDwHqPGxV90y7MPaQmUVzuHi2tCHHCJLzU7pFzoVWv4RwpGS9mUc8Eb+SxitWPiECzd0Vcyt1j4ZudTWMsgt/SAjzE8PfKs5cnlXPJ8VYxJOWO0n0gR7Bi1okg3PXY52YXqJnQiSIdIHmPE60+mfybQ/PEMuAxxZJgLpqxl5Wn+h6xA4G5d/o1dpMQH9DZH1EGYAQ3j98Sbw9wA/uKSy+ScEDyZrGjL1IBR8YX0IjYttEPiQ6QyfpBxmUZyf7M9rrC14szzF5jVpk17h5nX1SlP/ZXTbPJlj2zL47+sah26lwwDLiZahZ8lo5+Ink9sLVE4iDPdmi/SGKkCySh9hlcsFL3s9AQfdJHqNkszzg6ayyZV/LG5I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RmU3NlJKODV3QWI5RHNjbjlqdExiT29JZVFhM2tqNGF2NnljaXczdWtDR3Ex?=
 =?utf-8?B?TDhTNDBKdStFaC9tMDZsK2YvdUluWE9keUpadEhvbE5UYXd6eVdYN2wrV2Vn?=
 =?utf-8?B?WGJrZDZxUndwQTBWNjdITDlnaHcwd0NiS3dkbFBoeG1XV3dTLzJnRlJvTzJJ?=
 =?utf-8?B?aGt5SlVOejhJODMra3A4TnNBTW9oeDN4RE5RdFMvdnIzZkZqbkwyQXg1QlVt?=
 =?utf-8?B?Ni9zbkticmMwcjUrdmx4R1RtSkdCajlDRVlWU1JGQURpQWFLQVk1T3N2V3Zx?=
 =?utf-8?B?OGNaQjUyY01BWFJMYmpJSkEwRThwdnI1OFNRVzJpNnc2OTBNUUhsVVNleWhO?=
 =?utf-8?B?Skk0WVUwSjBmN2lxSS9CWWlIS1hNNEFmYzQvR0o4eUZOVm14T2lacGdQZHoz?=
 =?utf-8?B?ZFFSeDQrS3ZMdzExR1F1RG9iSFI1N3ZYcUxDY1h3SGpDb24vUTVDQnV3Mm9I?=
 =?utf-8?B?NStBeXJRMDIyYjMzWHRoYUdDYktCK2xlT0xuYlYxeXRhUmVBRWVLa3U2L1g2?=
 =?utf-8?B?MVZlYmF1NlFTSXgwNm12aGhOOEN5ZVB1R01tQU56b3R2RnR5Y2k2cHp2TXJO?=
 =?utf-8?B?VG5CQVJRaDFlV3ExNHpla0hsbHIwbFFMc0ZUM3ZNaTJUL2hqM2tBMlRLdDlm?=
 =?utf-8?B?ejZYcWFMNXg0UUJRcHlYckdzU3RzVm9uajQwK1ZGVXIrNjAvRUFCcUwzSUFC?=
 =?utf-8?B?OHduTlFFczd5bVhCRlpsVXpaQjQrbXpHYmgzTVR2NFBLWTh5TzlMeFVHT3o1?=
 =?utf-8?B?NmlCT0F3YVh2U2k5bDkyZHM3UXlMU1pvNjdyVzd2OTE5RmhXZ2VaY1llTGVC?=
 =?utf-8?B?NnVGQWFZMGYxbThnZmg1TEVYMXZ6eGsrWWVzcjlQVzg1OGJFeS9oU2VyL1Nz?=
 =?utf-8?B?bGRHREs5ZlpLcjkxTVhXWFFRaTZzOFozL0VLandPSytnR0VSeGFLTzM5UXh5?=
 =?utf-8?B?UWR2dUVubWRHWENTNmlzSWEyTnlWOFExbk5pek9QMVM4aG9ZWU1yUFlvWUdB?=
 =?utf-8?B?VmRlWEV3ZmU1SzZGYzdPYWNMbUdVbkFxVTk5MzBzalRSY3pmRzdIUWRsakJG?=
 =?utf-8?B?L3EzRktmTlBWczR6dkE0THlLK0ZIUWV6MFQ2OFNTdzNNVlkxWExFRm90Wlp1?=
 =?utf-8?B?am9SMTBacDE4SDZGRHgrTDRHNVpTTjFqTlkvYlVwU3h0bkFiU0NUcmh3NU4v?=
 =?utf-8?B?TmlNTEEyYmhlVnVqVXdEdjg5bVFPV21RNlJKVklLT2dVRS9uTEdldUtlTFd1?=
 =?utf-8?B?Qnd3bnNrNytHVHhKcloyeEVDekJEbDV4dk8yTW1SYnBWSmFUVGFTcTBtbi9k?=
 =?utf-8?B?Z0d1MHpCWUdtQXU5NWUzT0FRODNxSW8xNUhacEFPNmJhOFZydzJMSVlSMnNz?=
 =?utf-8?B?ekxlaTVvczZwY1FlcUdIdVZXbGp2S3E2K3YzOEhUQnhhVzhncVZJcndDeHI0?=
 =?utf-8?B?NkkwbDZFWWdST3dDV2t3UVpVOEpJYVhydmhxdjVsZm91V1FWOVlVeWljeUJZ?=
 =?utf-8?B?U0gzd1hDVGRPeCsrR1JaM0V1Qm9GNmwvSzFjZEZNcjArL2kzRGQwNHlTOG9k?=
 =?utf-8?B?Z1VsWDdpWk1YVFRiamNrRGZVZ3gvZW5aUmRxek1wZGVDZGI4eTh3akNMa2xx?=
 =?utf-8?B?NWVKUUJXbTh3RDJHNDRETzZHQWVZdGtFYVNlOEJtZVZ4aU0wb1NhOVdXT1NT?=
 =?utf-8?B?aDU2UkZuZXFxU2hCaHpEdWl6d3pGY3JGR0NneDljeHhpZytrRzdLNHVUSmQx?=
 =?utf-8?Q?lCzoZy39D8U+RjYwgjlFqKR7j2UiBuCeqP1EAFf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c29a07e9-d2a4-4b80-6ad7-08d8ede280ac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:35.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUx9M0aKZRAAr2pRVow6mwnk40rczOD/MifLldya1E1OvFPpucrxQp5lYEyL8tJQn7jmMaBx+RrXEVC/3SIRKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific MSR entry from a cpu
policy in xen_msr_entry_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 41 +++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 983e4c11d93..ab34df1dc98 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2611,6 +2611,8 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
 int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
                             uint32_t leaf, uint32_t subleaf,
                             xen_cpuid_leaf_t *out);
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
+                          uint32_t msr, xen_msr_entry_t *out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index a1e1bf10d5c..091aeb70c9c 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -925,3 +925,44 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
     free(leaves);
     return rc;
 }
+
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
+                          uint32_t msr, xen_msr_entry_t *out)
+{
+    unsigned int nr_leaves, nr_msrs, i;
+    xen_msr_entry_t *msrs;
+    int rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
+
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        return -1;
+    }
+
+    msrs = calloc(nr_msrs, sizeof(*msrs));
+    if ( !msrs )
+    {
+        PERROR("Failed to allocate resources");
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_serialise(xch, policy, NULL, 0, msrs, &nr_msrs);
+    if ( rc )
+        goto out;
+
+    for ( i = 0; i < nr_msrs; i++ )
+        if ( msrs[i].idx == msr )
+        {
+            *out = msrs[i];
+            goto out;
+        }
+
+    /* Unable to find a matching MSR. */
+    errno = ENOENT;
+    rc = -1;
+
+ out:
+    free(msrs);
+    return rc;
+}
-- 
2.30.1


