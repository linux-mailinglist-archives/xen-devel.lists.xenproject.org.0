Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2B9619997
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 15:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437603.692043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqxbJ-0003vz-DM; Fri, 04 Nov 2022 14:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437603.692043; Fri, 04 Nov 2022 14:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqxbJ-0003sX-AA; Fri, 04 Nov 2022 14:23:17 +0000
Received: by outflank-mailman (input) for mailman id 437603;
 Fri, 04 Nov 2022 14:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hilw=3E=citrix.com=prvs=300b5b1ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqxbH-0003sR-MS
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 14:23:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 363ca381-5c4c-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 15:23:13 +0100 (CET)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 10:23:10 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6515.namprd03.prod.outlook.com (2603:10b6:806:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 14:23:08 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 14:23:08 +0000
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
X-Inumbo-ID: 363ca381-5c4c-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667571793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=jm+WktHEAe9juee6Ae1iGK2iCs5BKtmxCfe43jNjjjk=;
  b=UQcerZNo6WY0+B9bsfwmSybO7QmU84vNPmAeNE+kEJ61n89NneMyHWnw
   oAwxUkMKVvmTgYUXXcLFdQm4V8FwuNTKLTxJqLddwi0tLu9Gq4YHoRYjf
   ysTquQIO58K2bOO34Ji5tMHWHwh3F6RmaO/NPN6O4cFLhr/0ICqjKIMh2
   I=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 84179917
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RTebxKqioU2uG/e2fNBGV52O0iVeBmLeZBIvgKrLsJaIsI4StFCzt
 garIBnVPveNajamf9h3Pdng8kIC7ZfUn9UxSwBkqy83Qy8R9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzyVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC8kPwqZgc64+q+AdtFH1/klK/fAJZxK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIK9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAurBNtNRezhqZaGhnW463IjJhY0VmKCjt+h1VP9Vo4BK
 U09r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOlMIwXy1s6
 VaPkPvgHzkpu7qQIVqF/6qQhSO/P24SN2BqTTAAZRsI5Z/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxBXSnJ0WhM8PkqCkp1bOhmv2ooCTFlJtoALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7cWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:N64WV6+O+fZektSfrZRuk+FDdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4aPLfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZe
 yhz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlCl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFc1ccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiU7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri6knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdo99RrBmc4a+d
 RVfYDhDK48SyLbU5mZhBgk/DWUZAV9Iv/cKXJy+fB80FBt7QJEJgUjtY4id0w7heIAoql/lp
 r525tT5cBzp7ctHMRA7cc6ML+K4z/2MGXxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208";a="84179917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv/VklMqqYlPnlXnYlapC0c6Rb29DQltCHqSyCvklvOdd2FCpUgOyg6NrUff4MMBTTjD27O/q9+L9MkXNd5fewFnNKYZWFZ1ICSulA2jlTggSGzTLB1C+1IaPisQDTwam+4VswxThfwff2bbIftIbbdkg3eHx5W4F1RUX2ZsIeX4i+lbTwWiY9EZjDXGQTQXT8bYG/EBmeE8a3W1vsyjMhLzuGCC80fKc6ydPjpQScSIqTjT80keESsBhyWL2rCJDzzx4EO5axcoekKvJz3yI91TRI+vSC+QODVShfoTgk5eNDWQ30hLzBlOcTEVWroF/TEq6pnZupAb/hP4MK1gKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+aUh139xPDENw+O/ZnONlv8URjchfq7wyKCH+pV9NQ=;
 b=REZX6Luv5sNr9HiUUvOto8ffkmCCNSOuv15OI+5KSbhjRhVoPeci4UZkMRdxm1qiWyKj2KIv90Cy/JcpXmDZR2qnHxyxoJBXaKbNOYYHCCjjjPZUYWGoVoB3k8YTnhGiNYVwh7g7PlBJOKhtVME+lmu0tU/EQ7BtA0xgX8E3yT1UjwtFrS0fIU9p7lgKzqJOwD2FBeXYn/WDMQDroJFNPUvtDHSneQKsgDk+vV+t98TP7I89uIJk5KdCxQZ4+Hq9R2uKRgYehL+4UZ5fgThgJiDft861FGw+q5WsMSiF0cPk6yC23ZJB3mOquqT0+XWmT/e5qK2pNiZDYZa34Z0CvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+aUh139xPDENw+O/ZnONlv8URjchfq7wyKCH+pV9NQ=;
 b=SxAWIWRFBxLHn/hMfwwrifzAueEAhcdhIhlqwgcBpW1BxaiUyCI8Uqe1wYHJ3mxEYYH7RpyenJx0qXboJ5r4N0QHnfGv8y4ilSPuwpgMf/91gaumbpim7jOPsyHdv5fRBaF0ehAc2OmpyUxU9QsF+5u1FiUj1kV9UVed3VZy24Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.17 1/2] viridian: suggest MSR APIC accesses if MSR accesses are accelerated
Date: Fri,  4 Nov 2022 15:22:34 +0100
Message-Id: <20221104142235.36556-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221104142235.36556-1-roger.pau@citrix.com>
References: <20221104142235.36556-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 1588a87b-915b-4e25-1e52-08dabe70187a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AVy9LN+tpdd7yVe7pwZzWUQzuh/H2ZbpXbgKDJeYkhbnranbLJ2R0fMjkV4yOQu38Z3wZ+iYShlIsQ186vhE91cLXRxCDN2VzgDqCjNnuTARY6FbMK0jE6kiYmU8TK50VdE+Q5ver1zdkn1V550j/069OmeIqUtyCd/1SioV7ZJtjUxifsIcycCHULJ2Jj93MdgR5nKhCw5TZXRqKWasYBCkUD0GVhRfH1/dJ8Yrx77RQssrG9S7MtGPS7a/l5O24krghE3DJmig7hq6oXh2GvfBnxTYqL8tpWFOBzT1MRwgGiHdEm0ztrSP/A+/w0IBgIXWIbBW1fxqPndh3N6EgjG81GhEDoMicZCsFRrZBPHHkNDhEH00ZtJEOs894Z3xjGXzsLeWOKJbeWx2ynef2Mutp8h+Lwe9ZrZOO7N7lFWiBY/cXQgJAxsb6YbsSk3CfXctsOKRbbdkPsQN3++j9+FDdoLJJrFIIhysTwjB723RN9Jh/MH1eG7WCVAoU6IOVGnIxT3v8LyBMdEIDNJjgvCZgk57xaCyxKEKO4r2+fD3strKMTEqOx2wV/NI7zelw4AsiMjOEd2+7AHxlz2FdJKqVOYt5SL+r86/mEK3OiX9wG15LSaggS6UKLS+uYMpHL/fUd6CPXzBFdJi25xXRRGf0aQBDWbcHVtPOMiRfHvP42kObVPOx2gkOfdEnP1gql8CTu3ilX36r4rgZ4kz/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199015)(5660300002)(82960400001)(38100700002)(66476007)(66556008)(66946007)(4326008)(316002)(8676002)(8936002)(54906003)(6916009)(41300700001)(36756003)(2906002)(6506007)(26005)(6512007)(6666004)(186003)(107886003)(478600001)(6486002)(2616005)(83380400001)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlJkMjM5OEJ5VnM3S3NmT0QxQkJLcHJVWGVGYTMvZkxhbnE2UnZXL3BFNmJa?=
 =?utf-8?B?UWJLdWJsSlhlYk9pbks5c2tXRGhEVldNOE95VWcyUlluVDltdVJraGpiQTE5?=
 =?utf-8?B?bGFpaU1JeXZSdFljeFRMSVR6SkZ4M3ZkT082RFBvOUJnUk5EL2xoSkxSRGNC?=
 =?utf-8?B?YVdWN2xtaDRGRzZyN3J0SzJtd3JGUklNWldXOTJ0VFJTUXpWYVBENXBZenMy?=
 =?utf-8?B?Ym0ycUE0dkNRamg1UmVSTlEydEthcUViaDZvYUZDU25iNmxwSGx3K1pLTGgw?=
 =?utf-8?B?WmUvc3FrTytKZm5IU1pRd1BOcEdDRzdEVGZBVmtHREloNFVzUG5NTEc4ejdr?=
 =?utf-8?B?N3NiOU1FNnpSeFlSZmo1NnRYelo0SittYmc4VXlIdnBGNVlIOVBYTFBqSytw?=
 =?utf-8?B?SElBK09JQTdUc3NzUDRveE5UL0VzcWJJYlJOUHlRODBkRlZoSVJwNXE1dXBC?=
 =?utf-8?B?MXNUa2ZpZ3M5cnhycjdSUGlpdGhyZEtIQVI2eGZiWE93b0RBb2kvYW1Xa2V5?=
 =?utf-8?B?T0NybnNsaFg0T0ZScWpkbHpxekRMb054TTZVYXduWDhjd0pUenR1Yldrc05s?=
 =?utf-8?B?QmZuenIrS21YaGRBMGJLcFF3ck8xZEFwbEFrMVlHak5GY1R0WEtJQTdGMkFO?=
 =?utf-8?B?RnVNZmIyaVhJRkRVYUFRU3pKZWZkTkM1c3FyMlFPQ1VGNldMekJPL2xPUUJP?=
 =?utf-8?B?a2tUdkJUQWgxZkt5Nm5ZZVJLdkF6L2RRVlVycmx1MnNTN3pzelE0S3M2R0Jo?=
 =?utf-8?B?bVJpRTg2QlRyL0FkSi9SK2Z2dzZydHZJenRTVmRGL01ZQWVBWktGSTBRNitQ?=
 =?utf-8?B?OWhyMFhwUTBjVEY0UlZwM2VPNzlqcUVaN28rdkJ3UkZaY0FZdWdaK3BXOXhr?=
 =?utf-8?B?QzVCMWh4Ti9nYVgzQzVBZEcweGlmQzhwcTBPL2VTQXRaQVZoUmd5RG5XM3pt?=
 =?utf-8?B?RzVTWUJSZTJlRk5ibVNlVU1KdEFMRHBCK3FJUEcxOXpDVzJKbXJkcnBFQWhx?=
 =?utf-8?B?NVk1Uk1wR2VLeUJlMkpydEd6RmZLRk5uNk9lTUxRNnpmdFZaWDlmeXZwblha?=
 =?utf-8?B?RkFaN2ErZjRROWc5akVSRjQ4aTFQZEhoQTBKNWxDdk56a1JueC9DNFoxeThk?=
 =?utf-8?B?S0xqeHVmNG00S1V1Sk1vNGU4Vmlld0hjNXdBbkdSeDk3cXBId3VDUzFVYlVx?=
 =?utf-8?B?ZCtOeE5hS0x3ZlcwY09ob3RvcVRpQVQvWW1IVXRsdnBBVytLbm5melYvcmM1?=
 =?utf-8?B?WjRVOWMvcFdCQTJEVm5MdXQvSmZJTHZiN3JiVVpaSXpkcFRrTTlxWUgzK3Jl?=
 =?utf-8?B?L1lKekUxSzlBbDRMTjZ4NG5JRmY0a3E1bDBTQWthM1dJSkdlRU56NTNuNkpl?=
 =?utf-8?B?eEhRK25IckRlbXlTRUhrd2RGKzF1WjZxeTF2bjNFSEhTc0lKUTVUS2VtSjR6?=
 =?utf-8?B?MHpnZWloRG5kM1R1QXJMckMzUlN2TlorcCswd3BKTHNqN3pEVnBRZ0pyejVP?=
 =?utf-8?B?MTlPY2tNUTgxLzB3QTJ0cVBhWGRMaFlwaEIwKzZsNkxuU2UwOVJUSEFHRG1D?=
 =?utf-8?B?TXNCRFpiZEpVL09pUUk1UTBQMWpTMnhLODIzdlVNM1NuSDR1OWM4TzlsSlEy?=
 =?utf-8?B?NTNBR0FKRXptRjkrT0JIVGtCVVJ2ZXg2N0dESjd6alI4MWptb29INTFmVkxJ?=
 =?utf-8?B?MFFYVklrWHFDaW9haVZnS2NwRjFsYk9tVGRMbFo2d0N2QTZsRG1aNDEzM0lZ?=
 =?utf-8?B?ckZTODFZNUg3emRmenpraEZKSnJWTUhPNGE2aDJzY2tueXNFUnFyb1RiKzFZ?=
 =?utf-8?B?RUZCaFFlSm9WV21aeXJQMGNDSEJTRXlDMXVyMmR5RXRVNHNZUUZONFJGRVNj?=
 =?utf-8?B?ZmVKTndwejJnZkxFVGVCR3hNQmdacU1tL01GZmdxckxzWVJmaTBwTEh1Tjh5?=
 =?utf-8?B?VE1ucVdNYysyblZIMXBmVW1BYTUwZ2VMTjFrOXAvamxqTmNNblZQbmpwd1dE?=
 =?utf-8?B?Q1liUTRSOXBrMExFN1IyMGsybGY5Y2ZhbzlidXlsRFIxaWZFWndJa3lqdEZB?=
 =?utf-8?B?dUs4M2JYWUdZSUQyN0tLSUx1dmJXRys5T0t6d1UxZEp1dWp4UG5FZ2JuNnQr?=
 =?utf-8?Q?GfJZ2iOheJljfw1iSU6K9xZMk?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1588a87b-915b-4e25-1e52-08dabe70187a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 14:23:08.5117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2VKVCJuZD6aol+imHZt1vcZtKfz/3DPLKPRYuRHN0jrlQCa9U3Ic2AT5ATNlumsIdoKkN372eEr2U01wqcu5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6515

The "APIC register virtualization" Intel hardware feature applies to
both MMIO or MSR APIC accesses depending on whether "virtualize x2APIC
mode" is also available.

As such also suggest MSR APIC accesses if both "APIC register
virtualization" and "virtualize x2APIC mode" features are available.

Fixes: 7f2e992b82 ('VMX/Viridian: suppress MSR-based APIC suggestion when having APIC-V')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/viridian.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 25dca93e8b..c4fa0a8b32 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -197,7 +197,11 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
         res->a = CPUID4A_RELAX_TIMER_INT;
         if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
             res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
-        if ( !cpu_has_vmx_apic_reg_virt )
+        /*
+         * Suggest x2APIC mode by default, unless xAPIC registers are hardware
+         * virtualized and x2APIC ones aren't.
+         */
+        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )
             res->a |= CPUID4A_MSR_BASED_APIC;
         if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
             res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
-- 
2.37.3


