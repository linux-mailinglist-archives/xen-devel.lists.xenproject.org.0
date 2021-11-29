Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689EB461B0C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234635.407206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigl-0004uC-Od; Mon, 29 Nov 2021 15:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234635.407206; Mon, 29 Nov 2021 15:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigl-0004rY-KJ; Mon, 29 Nov 2021 15:35:31 +0000
Received: by outflank-mailman (input) for mailman id 234635;
 Mon, 29 Nov 2021 15:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrigk-0004Rj-PB
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:35:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa4cd6cf-5129-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 16:35:29 +0100 (CET)
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
X-Inumbo-ID: fa4cd6cf-5129-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=yz/7WHXZdG8/P3IiQ6Qs4BL/Xb7Cfc20DDjQceoZCN8=;
  b=TElRmbUNJkrvbEEPYqFTIdDBLeHlsoRwgIPFXFxmw+zFCS9/W3VLVgXh
   QVItSOU86ng5Cr+B+BXOxDelLgxolv51CstVyHACCq5dWhS4pYvL3LClz
   eKdEw0gyeSkkRK479aX7IPh5caJsSR+WZTOCm5330LfMFB/4wk2KoESiH
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ekcI5uORet7Jwxrn6rsWpCStPe8tL2WUVcTjKREfIxZYEv1ndBhht+OlhgjUT03imn8oVkwOBL
 d2Zg9qZAsnrN1W0IESBFvYCKUuBOmE3cXiqwg5ex6a2gf7ltXT61XQboeQztKMrIhGEhOuWV3N
 aVq8zMQcIWq43T9GW0+9PKL73+kOoUW+Y5JB6ovZzvXEd8l4u95fJgdZjVzmqLayrEJfO45aAK
 MWYUHI8nmO7EShnV0I4IXs73OvvKRkfMonXntx3cVS5Q3lij2F3YUjm6OB5dScZdyRotnLYbbi
 ztmj0CZh9aOOgoRV9debsiCn
X-SBRS: 5.1
X-MesageID: 58773259
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ol4skqNMrgz5AiXvrR1GkMFynXyQoLVcMsEvi/4bfWQNrUpx0DYHz
 DYcXmCHbPeDZ2v3LdB/ao6yp00GsZHQmtIySwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Egyw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozakjvBa9
 9V9icS1FCx0N7HNn8A5dBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iauoADhmph7ixINffnO
 s4DZShNVi3/MiB+PF4wLtFmzc790xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiR8pPmV2Dj
 nnb5Gm/CRYfXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVqko9Gph0imQdVdJ
 kcIvC00osAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+lyYfFwy2mBlg4FjscQ4EvqM4xYRgN2
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2nS9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocd7xorqp5
 iFsdy2iAAcmV8/lqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkyYp9eJWCzO
 xaD5Wu9AaO/2lPwN8ebhKrrVawXIVXIT4y5Bpg4kPITCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:Co9WK6sk4TzpeXhATTyT78PJ7skDG9V00zEX/kB9WHVpm6uj+f
 xG/c516faaslsssR0b8uxoW5PpfZq0z/dICOIqUYtKMjONhFeV
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58773259"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f55NV7oVqNkETdXKYfOD1m4cC8U4yAsYj1IHyEh4bbU/W1Bm85fm6RVM4puLQoLLU4cO3O2h4Kl2ptfz2ZGf1CMotN4WQhI47fpi9qTBmx76UQqv8cQD939iwJb1BZ9ni8dYCJTRuEJS4+lrkEfQt2eZ5ayn0G8pTnWnma1tCZv0nK32ZTVNyjG5SUmQIEHi6ZvcnXNPtKmm6UfLpnFgQ29giMcWrowfONV8v1TDsnrMp+TNImDgZ/Gogl+vc897mqc+P7vGoIk0vsWxajmgucYooCjuROn/xyPIqZSSzjutUC6u6lUMaAhG2f12aqwvImuwwzD66ld+31MSf7ZPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1+vUAFlvux2wXM0/t+OqbhuL51Rq/ENxTsQGJDXxM8=;
 b=jMTDTY9KwRBXc7Lw/GNPeO7RiG9RzZtTMKMrruVk0jF1GMQjS+3ubJfG5KJwG6L4rkhHXDhtO2d0pks3AZ/KdmbgP0V1dJRHJ5g3818koTZN9YQDuCjW5XwbKThV2mdNfjGoCUqGZqgUAc35HRMiZE1BZ3hk7DhU21atjn662C/0pAwOcWmAfonZTku3o8UyjtsTi9jbMW33Mk/x4Pb4saGIQw9K9eOWF1Y/CaOR4pSD0VcoQicKbf9fLJqX6whx91ZL2Ad9hHHfpWbMxWDTGJCXV2uivILhnDVQ2K51cTOemI4/JpVLjTzh5puL6f48EI8RynfNqdjbUra4U74hNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1+vUAFlvux2wXM0/t+OqbhuL51Rq/ENxTsQGJDXxM8=;
 b=M5+JQ+ReDF0scKFpjAU4vWIAvSC2NEix+xcptabn1LFjxfyqnM/rI5iS5Fo8k7ILfTXX0sPu8EaKlmE1X6DeTOgJVMCPOmigeLf7Gb6rjxZDhZtQwUwUKg6fhiEnHPxyrSLQDvuMFHi/uRS7sbJsuMZwW3d3tjThWDuZhpZSU/c=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 03/12] libs/guest: allow fetching a specific CPUID leaf from a cpu policy
Date: Mon, 29 Nov 2021 16:33:46 +0100
Message-ID: <20211129153355.60338-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bcee822-ffa2-49e9-da5a-08d9b34ddb37
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-Microsoft-Antispam-PRVS: <DM6PR03MB47646CB169DAE641C4F8BEF38F669@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gz68Hx/n8hChPwCR91zcbuCUt3hrJE8voptcZEWcKVAk3RKOBU/CgXD6HfD0c3sjJgg3g6RX+8Yt95bxVYQ6PxGiGANUAzYByaO/vronzUNUEIZBGKQd8EjJtLR3aw0p/ksB9ULDjx/Ht8NgRg4H1+PYlW9nzmFzjuoeKpX0odbEPO/j6ycD5cykgmaiFMNg0iaLaid9pXCPFNABzxxKhBf5VkshkiPgvz1BcDQpEOFZcUmR+SEyAzm871rCBWQ+M/w786kR0Pn0t9HpJovcQ7MS4KPithOLKonCUedcOUYcf3aExqLBBQI8UQyN0nA+9AYV5LfoqMBaZs2wfVnCfAAXSl4Vjvr+RdqP0Q+oYxGZmCRU1J7uEAetq/Yl0HLpLT2TWZPNnidJ5ha3NCWi4Qf9TN3c0H0ju6GNeB74dWUx61zu7Ypttvx/QW8JFiF0ilPk3pnAjnbQaWtGgEOYVL0wYvxiz2svUrW6DdcpdVJYUyw5MRSit4fFgkEUiPCuvggeM2Tsc367ClH/59CynrOG2tva8+oeQaw5yAJX16QsBIHtGCXouP2H9rfP3IVeQdBfelRbubDNZlCgboroYHkFUJD9/1mUSnMz3ZbBnGn+0fCvXi6OxpdAnME0aLhnBehzTTN0lGwLt+UzcCOmOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(4326008)(2906002)(1076003)(66476007)(6486002)(82960400001)(38100700002)(186003)(83380400001)(956004)(2616005)(316002)(6496006)(6916009)(26005)(54906003)(6666004)(36756003)(66946007)(86362001)(508600001)(8676002)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHBkOTA1QjhoV3BuQVZjM3FZVmxUT0grSzZsRmdyYlpkRXBIakFlREZtQWll?=
 =?utf-8?B?ZjROeEgvTk5BcmdZRGxOMUtEVzFXV3hLZ0REODNiL1NrL0NuaGJFeW0vUGRQ?=
 =?utf-8?B?SUp0c0hIeW9iZ3djT2xaOVFjRExIVUJqcHE2WUMxN1pxcnhpcVd5Uy81cGJQ?=
 =?utf-8?B?S1J4N1o3alBPTVJIMlZqc25uUllhTGVJUmVWVnkyQkhhRVY4YndVUnNxRTFj?=
 =?utf-8?B?RE5FWWpwRFZjNXRMcG5aZE94VWVJeDFPa1ZNYlJ6Z2NZME03TGVEUG9GTVN0?=
 =?utf-8?B?eDZrTkpMV2lDVEJMenF5Wng1bXZwY0hkdDd3TnVBY3g4OVFadVN0MS9JMHdi?=
 =?utf-8?B?TXI1ZTgvZCt6Ri9mUXc5MGJuMWJzdzVyWXk0K0NWN29uck1IVElUQlAzTlhG?=
 =?utf-8?B?VzZ4YjZMVVdnbFVYMWQ4Y21UdzFnamhHMjl1cGdYVEwxdkp2Sk54KzZER3BV?=
 =?utf-8?B?MjNTUUZTUWYwU2VmT2dUQ0xyUk1RZzZ4d3pieVJUaUE5MERDUTVaZ2JiWFFt?=
 =?utf-8?B?TnpKWU5TL2laaU5GODB5MUM4Q0dmYXFpZ3d4UlNEaUFqVmN6NFRiUlZlc0lh?=
 =?utf-8?B?S0Q0MVhiUlg4WHVpS1haeVZLWExXWFRrNU1rK01vN3F5bCtlSk5qZzlxZXQv?=
 =?utf-8?B?c0ZFc0lIN3pCM2hBUWFzVVd4MEwxTk1nK2xxTkFlYnhTRHhPNWc3OVhQWkVi?=
 =?utf-8?B?MmxGRGgxUmtHaVZkbkxuL285S1hvaFRsbUVtNWFCcVpHcVJ4RVFQczBPYXJH?=
 =?utf-8?B?TUsxY0ZkM0c3NUN2bU1sd3Nxdll2dnFHSDAvamJUa3VoMW9XVGpGRXExU1NK?=
 =?utf-8?B?YkxBN3M1NTEwMnpvM0RackJMZzI5Tk9iTzFjdFcvZ0U5aGpzbGFGcWFUK2Jr?=
 =?utf-8?B?bHJCMk5Bd1gwSHBWYUI5RG9jNkpwS01tcDJpZFdyWUxRMXdEVkNDaUVKTWV3?=
 =?utf-8?B?bmo3NUdCYUFxWi9TL1VwM0srZk5oWEx4OExWcG13L2xUSndFc21RSVU5cUNm?=
 =?utf-8?B?SFdGS01Ick9rWFhSMzZ1SW1DM3JySVBZZ1JPZGFJK0psQkRiNU9SeU5jUWVJ?=
 =?utf-8?B?eHVPZkRUdmZhcXIxM3RDcEJmR05HZ3BJMXRoQ052azRrZmFKdENSUnFtMnZG?=
 =?utf-8?B?UWcyS0cya2hJWU5vaURFclFPaTRDNTJQTTU4WHFnN0VYSWpxTzZzU2RNbVd5?=
 =?utf-8?B?TG1LOElzdFN5aklKNGMvdk9LZk1wM3hzcFN5em9SZVdOU1ZYRncvbTVlNjM0?=
 =?utf-8?B?L1I1N3NEQTJJSk14RnhaUlFRQnBBcFpTVWZBd2tsTi9VSFg2L2RsMVFhaTBu?=
 =?utf-8?B?M0g5RnJxTlJzZWw1Z3RhWDU4cTU2SS9MZnVvQUJ1bVcvcTIvZCtBNS9MN2ky?=
 =?utf-8?B?ZDZvWDhxNHlGOURvRkZuQ0pBSzdyRXgxbVl6eVF6UkdkcVJlSUliRmlBek9I?=
 =?utf-8?B?eCtYWVN0RC80OVBMbHVrUWh6eC9IQ3RYejk1ZVZpcUFpM1hEVXV4MkdIcU8x?=
 =?utf-8?B?Qm9oSERET1ladUYwZWFTTWdldDA5aDFROXF0Rkg0YlZKZ3BYc1RPd0Ruamtp?=
 =?utf-8?B?TWJnNDUwc2E3SytiV1puSjI2MThrUE5EWklCZDMvWkpTZUtzVEVOWHBhbys1?=
 =?utf-8?B?ZVdLUkwwSDhaZm9RMUpiRDdIZjBOeHl1ek1RNkpzek9GOGZMWXREUklrOXVr?=
 =?utf-8?B?RGowVzNDSzBsd2lRWXlacElSUllJRTRmeDlrQ3lydDZOaUhEb1Y4N3QyOWRK?=
 =?utf-8?B?T3orUitnSjcycFJDUGhaWmpMQW80NEFGdkRZbENFWDZseHYvYzY5ZURPbUJn?=
 =?utf-8?B?eUdCT0NUTU5CQ3IxZzFacmlUb3E3LzJCbmxZNEthRERIeURiTlQwQVhlMTht?=
 =?utf-8?B?Zkdqakt3Z0Z0a3BobG5jVGhRcS9GMUNXNm9zc2NxWnh4Z2ZlaUMxK0w3bFk0?=
 =?utf-8?B?TzMrRnNTRUJLK1VrSTZPNFZSODFsMFVuNFBnU3R1VFVraGZhQm1TOVVuZGht?=
 =?utf-8?B?WnEvd3A4dFB2T2QwL0ZXcGZXUnNicFZhcTRJRmFxcjJFZVdVUWNrYzBCSFlu?=
 =?utf-8?B?YUoydDhFK1U3QmRoQ3gzS2VBdGlBMlVkWlFBMjhTQTNySDhwVDlxVnRmaEQ5?=
 =?utf-8?B?cG05cjFnWlNDWDlDRXhaZkdpRWhwelFSUmdiWnZMT0hrdW9jYWFIbTRPK0VP?=
 =?utf-8?Q?/IQvN/b0aLcANkcma2HbG+A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcee822-ffa2-49e9-da5a-08d9b34ddb37
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:22.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0PyNvdK0yvVlbi8SCWNkHJBPihDm+mK5KF32DO6IuXjCO6f897NbrmJQ/HnQta/iEATT79HC732IRpaYvMipw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific leaf/subleaf from a cpu
policy in xen_cpuid_leaf_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Note that callers of find_leaf need to be slightly adjusted to use the
new helper parameters.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use x86_cpuid_get_leaf.

Changes since v1:
 - Use find leaf.
---
 tools/include/xenguest.h        |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b77..0a6fd99306 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -807,6 +807,9 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                uint32_t nr);
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index b9e827ce7e..7779a3e1dd 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -855,6 +855,29 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out)
+{
+    const struct cpuid_leaf *tmp;
+
+    tmp = x86_cpuid_get_leaf(&policy->cpuid, leaf, subleaf);
+    if ( !tmp )
+    {
+        /* Unable to find a matching leaf. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->leaf = leaf;
+    out->subleaf = subleaf;
+    out->a = tmp->a;
+    out->b = tmp->b;
+    out->c = tmp->c;
+    out->d = tmp->d;
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.33.0


