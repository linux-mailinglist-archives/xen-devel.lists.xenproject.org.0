Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE876CD7DF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516178.799890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTLo-0006IQ-0c; Wed, 29 Mar 2023 10:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516178.799890; Wed, 29 Mar 2023 10:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTLn-0006Fv-U3; Wed, 29 Mar 2023 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 516178;
 Wed, 29 Mar 2023 10:48:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOlf=7V=citrix.com=prvs=445effd08=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phTLn-0006Fp-30
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:48:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 357cb11b-ce1f-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:48:17 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 06:48:14 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5871.namprd03.prod.outlook.com (2603:10b6:a03:2dd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.34; Wed, 29 Mar
 2023 10:48:12 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 10:48:12 +0000
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
X-Inumbo-ID: 357cb11b-ce1f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680086897;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Gcb555ZZxThI/dq0Tuz+5D2I5IyYAMW0SLNGqI7QqPg=;
  b=YVJT2SzVnG4x5V5fU2fK32A/TTsOuaavkzFDcowGO+zFXtQW/ld2qbdT
   XFxZflSCx52wYocyArPcZVScr77WEEFObHJivJieJvsU0H23duIvChLPD
   MvdSckjfzrpT/roxFGOsBr41vnfdRBuUCDxyUtXmBVa14Q1DqmprzDSy4
   0=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 103903716
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cuxBKKIf+O1qekp1FE+RX5QlxSXFcZb7ZxGr2PjKsXjdYENS0zAHz
 TMYD22EaPvYYDP0Kt4jPYW/oUoD6J/Uz4JrHFdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pOkR37
 NFbcAsSVRqKprin64KRSPVz05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03b6XxnyiBur+EpWH1aBxiw2NyFYxGSYyVQCkm/iks3OXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8UE7wWKxrvR8hyuLGEORT5ca/QrrMYzAzct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/H8pKkjgxSJScxseIa3k9n0FDfY0
 z2M6i8kiN07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN9gpkYKa1aoru7kLUhd5DIZiYSB+dv
 XECs8mY8O0KS5qKkUSwrP4lGbio47OAL2faiFs2R505rW31ozikYJxa5yx4KAFxKMEYdDT1Y
 UjV/wRM+JtUO3jsZqhyC26sN/kXIWHbPYyNfpjpghBmO/CdqCfvEPlSWHOt
IronPort-HdrOrdr: A9a23:VBygo6Fd8Ii4DswfpLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.98,300,1673931600"; 
   d="scan'208";a="103903716"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iahTiel1oJ9aEzXq9e8BIpcFZbChQ/gZDMu5xpU+gcGOtH1c6sbn0bXc36cDFHfoQmpp/ClaTIZ05vWEehlBOEurbw+Sg/wCZ6YPl2foxGylnWGG11lcwFvifmuXWinM/f0gVK9dnxMuPLG9unRPsZf6YewanjDTEQbMu+VsGXZaQjxcTvmrcMGs1Y1+o3YnBbHo2Uz/Yn5X3frJjkabwUSqiIZ4/SP64LOb2uSGOQ/gR8HaBreInlrqn2yjV9FbierIdfjDSDx3I/7GyWhNx/h/27lTuOLWLdbiODhTHYsPiqGtGtK+54iDSCrQKU01EIhr7WFbqDEr5bJGAztfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjccRZPr+GMcor3zhNZBlxQ+vDMUSFsIPZ21KlTWugg=;
 b=SwqHG5F7fE4AQ+sNrM6S5Q7ZABP9FM4Fotmuf+5dOnUp3eEqkZR3MZ/wB4BspX5l0KBCE7ZKVyvRudU0J6fweyz0KsWHKIkJdXLZQE0LsKsU8VBrz0Qenpf6BqEZ9P8bUqOmczpNKclyZjLa7Iz48/JPp9aMQBuR6ekO7e0weTIAcPJF1kaKzk50W/j71V8ga1A1EuNCMB9QQ4YmRUF6dkAC0mjoHSUx29whZF1FKrmfr/JsZcwO2DvFARstBNVTdozqmUeny5U4B/ZKIHTpdZ9wnhqDdpCc4FrSGQhSIpX3jEoQ4LBPeDDGazuWbdYAvY0h2GF+16zniOgAa6jpuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjccRZPr+GMcor3zhNZBlxQ+vDMUSFsIPZ21KlTWugg=;
 b=d0oxFyMmJng9UXKRC+LLU9gXBV4ea497exmoJ7QwIQ5RTZ2LNc7hCfSATGZpTbZ/sKmMlA8LzBs8WxxLrUbMfrDFaN6kx2U0GYueRFW8ItAc0NgGy5s70azvZcXuA57653VsAe3so90V2ajqbTPu1J+onCkrvZ38Wauhr1eFL14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Mar 2023 12:48:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Message-ID: <ZCQXZu8AqZtLGCUB@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger>
 <c175d1b5-972c-e311-d634-e7a68e919ece@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c175d1b5-972c-e311-d634-e7a68e919ece@suse.com>
X-ClientProxiedBy: LO4P265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: d174e814-e39b-407e-03cf-08db30431720
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3SS2xkH1dqW892E+/vv6mqmbX+fR3nyBoBA3Qav0c7MAf1zJ+X5gsJAWwcNooPqX89IYJ+ymKKkiHWHzmwf9bnaoNhWC2C32yxsam20LZiwcGU7gRD08POPr96Z4H7UUyFLUaF4HOH94lv3SKsxr6QzVmc3dh8KDYe4pnBbQIUmcWK+apkb8UOir/eOBmmgZBDIz2r5wNka967PvytKcaNndoUlkF0/3hGiYyrC9KfIkZq8A6S0p833CCy/WNPOxwpgma7ds0y4037HA/5uVUuJuhCKI/lUBZcT1cAspO/67JR+4FtBskAKimtIze7A/DOVatAGwiRtHcQG4QeDVt4fafbTy3bkElCsDhRFgzp5Vw4ZoLR7Ak3Hk2aySUGe0ELR+MKLHD0105z998+PV4jlJfaVCo9Iay/eM2RH8nmKB9oBnsr0l52FbTgM9cgQJNInl6A6z9N7wQ1pig5g7O9HDd5g3DrESM0fAjt7y2vusHsH7mi0QB+hFTOeWZlNP8PGr+QEKlN0Gt6MrXikaAxjzpwdZBn82Hkz04T3Qikw26wVuzkSeNGzqh1Os6d/J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(6486002)(54906003)(8936002)(316002)(478600001)(53546011)(6666004)(9686003)(26005)(6506007)(6512007)(66556008)(186003)(66476007)(66946007)(4326008)(6916009)(8676002)(41300700001)(82960400001)(7416002)(2906002)(85182001)(5660300002)(33716001)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEtVN0JTeTFyRmpwSjhiSmxIVk5aMkFoeDIybXRSby9EZmplRWI4VUZabUpw?=
 =?utf-8?B?bEVlTmlCaVJyRUVhQlNlYXpLSmZwdlRLektZMUJHYXBwTHh4NTRqOU55QVps?=
 =?utf-8?B?VTVjUzdjcUpQSVF1MDVDTTVoN3YyM3A5OEcyWG5NTjVCV0FWUUhQOFRiWGd0?=
 =?utf-8?B?K3lYWVRTV1BaRzFrbDNwYm5vbWhuZmlrSU5jRGxvNzhZbHdrc1RyWmRncnZN?=
 =?utf-8?B?dGpOMTZzSW1LZWExeXRHT2VhMitiUlYzZ3VUbXIrUk5LNW43ZnhocU4rSWFY?=
 =?utf-8?B?N2tWalVBc0hVMUdydTdyRTlxM3NpcGxLUUttZitFWjdOQ05mV0pkWUtPcnJk?=
 =?utf-8?B?UG96bVVhRXZYcVlkWi9vWFY1N2lZRTIvUVZFQ0NOWjAxeHZpMWN5SzVKMzNk?=
 =?utf-8?B?WHBIcGdKQVpOTjZrN0F6T04vanVuMEUyQzFvNElrdlZxSGtDNHpVQ2h5Vkxx?=
 =?utf-8?B?K0hRZkhYUTJSZUtqRGxTU0xEcExHQ2szd0didVE2b3UvTkwzSHFycEd3cVQw?=
 =?utf-8?B?Unl3UTRtNkM5MmxuV1NweENKcWYzdzBGRmlRWEhzbmZmV251WnkwSnRoSFNy?=
 =?utf-8?B?WVBkUGxPR0hYRlNNVGc1Qm9BQVZqMXhIT3hMZTIyYjRWbURSVHVRVlkySE5U?=
 =?utf-8?B?NkpHTjh5dG1iYmg1OHJESGE1YklmYlZiZnd0aE82bEJkWG4xZjlCTWlzVnIz?=
 =?utf-8?B?UlNSbkdvNTI3RTFrZzc0cWM1aEltZEplMzRrQ25qcmJhWHRvS0ZkT2FHVG1V?=
 =?utf-8?B?YmlhN1lrUWdzU1RHZDVoTFBXb2JRaGp2WE0rZE9xWUwvVithblZjVk9HU2E5?=
 =?utf-8?B?Y3NuTHF5REl6cnloN2dtUVVaQnZybGo0VS9oWWVXaWgveVRBc0dCWUU3VmhP?=
 =?utf-8?B?UzVpakd2VDFDTnA5aUgxaXE1Z3p2THJnNzJiVFBYa25CMVVqR3BKbDduY0Mr?=
 =?utf-8?B?VGN1UVMxRkxsSVpiTkhxekMvMGtKbENKUFdWVG9YclREYk0wNHkzdUJDQ1Bt?=
 =?utf-8?B?MVgzTE1xVmlHUkxrTVloZk0yWWZiWWZyVEJla1drUWIyOG5URlpSVkpDc3BU?=
 =?utf-8?B?dkVvT2d3Z1lsaHJqdzU5SmhQT3ZSNisxdVFEOVB4U3ArRDVBeC9iaWZMemFu?=
 =?utf-8?B?YXRHMEVnWmt1eWx6MGthOTZRckV6Zk5JcXNCYzk4YWpxMTY3UGlhbE9vczZz?=
 =?utf-8?B?KzM3VFJsTnFsOHhoY2hVQjBRUGMxUlJ4Y2FrUks0S0NsVTlRVVl2M1NPdGtN?=
 =?utf-8?B?dXJNbG1NZE5xMStaRS9RUmVaSUJDMlRVWUVERU1mQWV0cFFYSXhOUUZvUG1v?=
 =?utf-8?B?TnhrcXZoNE02R2JtcmpNWWJLWkpiZHR2bkVsaFF1Vlp5ZzlHWElkVFZFQVlX?=
 =?utf-8?B?K3pXakhFZStmVkUvWk90MXBEQ3JheC9icWpCODJSODd3ZGFseVBveWw1Z3or?=
 =?utf-8?B?KzNWQzZoeTFMOC9PT3BsWVNFbElQOGdvTll0aWE5YmdCdjVvbGdPYmRnaGVF?=
 =?utf-8?B?S3g2R3RNV1IrYlM2VE9VQjZTRndXSjYrK2VNVWVhaUovV1p4bEpJL1RwZStP?=
 =?utf-8?B?Z3g2VUxQZG9FajlGY3IwdHJmZjk3cnExWGQ2S3NFQ3VKeTZHSThqL3YxTjZH?=
 =?utf-8?B?RnM3bW1JNGRIZ2FDODd1c0tWbEFtRFVqWlZWa1pXZUdGQm9rYnRqSk5IYmt4?=
 =?utf-8?B?bFlVNHl1MlhrNzd1R01KYmFWSXowRWMxOGRSdWZRUXp4eDhUd3lXaGNLMDBY?=
 =?utf-8?B?ZWZtdVN2MUNEM0xXY2x6Qno5dFVRTFNBR0RvcWxDZlNPMkM3bm9HamtJTHNJ?=
 =?utf-8?B?YlJhdWtSMjg1YTBUbWVoUEJPdVFmaU9Sc0JCNGRVU1U5OHhCZmhhNUU2UVZD?=
 =?utf-8?B?MGVpK1V5VlJhYzlQRFNTMC9nc3IxQkptMWdJc3NXb00yZE5iR3d1SHNmMzN6?=
 =?utf-8?B?T3VBNHlWb3FrcnNxY2Z6eDR5Q1ZBTmEvWEFMSmNnUXVHSjNnUmRLY2pWKzhr?=
 =?utf-8?B?K3FXT0ZuVmphNUJDcTluMCtoOGtqWjJPR2wxckJ6ZVRLK0JOZ3BOTWxPdC9p?=
 =?utf-8?B?L2JOb01wVS8zRzVRZSttaDdEKzcvUHYzQzFEWWdpcTNYUDZLVU9yRFBQUThM?=
 =?utf-8?B?SjlYSnBGZStQOHo3Zmh4WWtOSWhEdjRIZnNnUGgrb0N5OWlmYVpxVlhtNUdJ?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cPCilO2ju8rOZ8bMEIwfR9IPGZ//LJPFMWMGn8t1By7CVkV3bwft4tHdGy3VUHi/o0rM/Ox7DfWXqr1+xmcotZqIcIFxxXWyQAHASGkhcJcHg0RkOOhgZofHkIXKDfthzMw9AmARj7Q/cTogjqGeJyGg13mIAKvVmwHCZMBnwiXDy1tMVLfDcdvkaUvNQsgi5WK90zFgcTmEsvNrPac63fRmNF8WSTFwtk1C07ThlXWllVBLTxr8fN7pt8ZCzkNDpq4e239k21qS7G6Azu56gfUzamjJA76/9i3VbAOcvDj3qDhENdLpac2YX6ahfzKP3Epm9NoFZHR0SVDVYyLe68aji9JWm2HkwDtihI/iG7k8C603CPkjjY+eXdzTBJj8hJbYJ1RJp1DqvshZBdq/vGxr2oWc1+NU1CVoLexHttvV/99eDHxLotH9ijr+1BrdC3c21WVNr7ImObgM3uEoyzllrt11V0srN6ohRAyXcUxJIij/3Kq+CsWRHO4LDgnGFTlb+cqe52yzPNNIaCYOh/CDUqhvxXvkc7yOuZAioPNUE+rDR7+bkhdaZxTN/cIjeL/CYCMsGvN+eD5GVyqkngLDLzzQVK0KEqfe1L8O9whN1XHjsLgVRFwIapS6KHlVFSsATIxicqfH5QIpKIb+QEFqqC2JkNT+JoPIDUHnqZm4yUWwnhI0yFQW1X7FjLmRcPfxAopHvDKPLkr2oCOowHuo7EKi5oPwkqkGxkDdx8YHWo1tw27g8v8xGZKARGiu6DjYap1Q7Gyxo+1aTm0uV98AoJTKECns+dARRTRJP7jVIBJoRqXQCw5Hmgpdn6o4ArVClr3Lse4jBcBb6ejmot5wdNiPV21M7no4Rj2sqvAYPZ97KkgJlYa1gk7tkbjyyAvKqzGiOVwXgsdT7GYi6g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d174e814-e39b-407e-03cf-08db30431720
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:48:11.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ia7Q/Rw0OLcL+dsaQwjgZ5zQlv8BelN+yfg7CQ67PtSaizzD211dQ7U7us51zt3jO8vvwPaCk9lCZCNRyZLpBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5871

On Wed, Mar 29, 2023 at 11:55:26AM +0200, Jan Beulich wrote:
> On 16.03.2023 17:16, Roger Pau Monné wrote:
> > On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >> Prior to this change, lifetime of pci_dev objects was protected by global
> >> pcidevs_lock(). Long-term plan is to remove this log, so we need some
> >                                                    ^ lock
> > 
> > I wouldn't say remove, as one way or another we need a lock to protect
> > concurrent accesses.
> > 
> >> other mechanism to ensure that those objects will not disappear under
> >> feet of code that access them. Reference counting is a good choice as
> >> it provides easy to comprehend way to control object lifetime.
> >>
> >> This patch adds two new helper functions: pcidev_get() and
> >> pcidev_put(). pcidev_get() will increase reference counter, while
> >> pcidev_put() will decrease it, destroying object when counter reaches
> >> zero.
> >>
> >> pcidev_get() should be used only when you already have a valid pointer
> >> to the object or you are holding lock that protects one of the
> >> lists (domain, pseg or ats) that store pci_dev structs.
> >>
> >> pcidev_get() is rarely used directly, because there already are
> >> functions that will provide valid pointer to pci_dev struct:
> >> pci_get_pdev(), pci_get_real_pdev(). They will lock appropriate list,
> >> find needed object and increase its reference counter before returning
> >> to the caller.
> >>
> >> Naturally, pci_put() should be called after finishing working with a
> >> received object. This is the reason why this patch have so many
> >> pcidev_put()s and so little pcidev_get()s: existing calls to
> >> pci_get_*() functions now will increase reference counter
> >> automatically, we just need to decrease it back when we finished.
> > 
> > After looking a bit into this, I would like to ask whether it's been
> > considered the need to increase the refcount for each use of a pdev.
> > 
> > For example I would consider the initial alloc_pdev() to take a
> > refcount, and then pci_remove_device() _must_ be the function that
> > removes the last refcount, so that it can return -EBUSY otherwise (see
> > my comment below).
> 
> I thought I had replied to this, but couldn't find any record thereof;
> apologies for a possible duplicate.
> 
> In a get-/put-ref model, much like we have it for domheap pages, the
> last put should trigger whatever is needed for "freeing" (here:
> removing) the item. Therefore I think in this new model all
> PHYSDEVOP_{pci_device_remove,manage_pci_remove} should cause is the
> dropping of the ref that alloc_pdev() has put in place (plus some
> marking of the device, so that another PHYSDEVOP_{pci_device_remove,
> manage_pci_remove} can be properly ignored rather than dropping one
> ref too many; this marking may then also prevent the obtaining of new
> references, if such can be arranged for without breaking [cleanup]
> functionality elsewhere). Whenever the last reference is put, that
> would trigger the operations that pci_remove_device() presently
> carries out.

Right, this all seems sensible.

> 
> Of course this would mean that if PHYSDEVOP_{pci_device_remove,
> manage_pci_remove} didn't drop the last reference, it would need to
> signal this to its caller, for it to be aware that the device is not
> yet ready for (e.g.) hot-unplug. There'll then also need to be a way
> for the caller to figure out when that situation has changed (which
> might be via repeated invocations of the same hypercall sub-op, or
> some new sub-op).

Returning -EBUSY and expecting the caller to repeat the call would
likely be the easier one to implement and likely fine for our
purposes.  There's a risk that the toolstack/kernel enters an infinite
loop if there's a dangling extra ref somewhere, but that would be a
bug anyway.

So device creation would take a reference, and device assignation would
take another one.  Devices assigned are safe against removal, so there
should be no need to take an extra reference in that case.

There are however a number of cases that use pci_get_pdev(NULL, ...)
for example, at which point we would need to take an extra reference
on those cases if the device is not assigned to a domain?

Or would we just keep those under pcidevs_locked regions as-is?

(as PHYSDEVOP_{pci_device_remove, manage_pci_remove} will still take
the pci_lock).

Thanks, Roger.

