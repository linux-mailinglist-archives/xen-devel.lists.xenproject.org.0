Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA52748374
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 13:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559116.873837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0zR-0001ZW-VA; Wed, 05 Jul 2023 11:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559116.873837; Wed, 05 Jul 2023 11:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0zR-0001XE-Ry; Wed, 05 Jul 2023 11:48:09 +0000
Received: by outflank-mailman (input) for mailman id 559116;
 Wed, 05 Jul 2023 11:48:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFzj=CX=citrix.com=prvs=5438f3518=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qH0zQ-0000nM-5J
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 11:48:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce793e82-1b29-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 13:48:06 +0200 (CEST)
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 07:48:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5718.namprd03.prod.outlook.com (2603:10b6:510:40::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 11:48:04 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 11:48:04 +0000
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
X-Inumbo-ID: ce793e82-1b29-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688557687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=aXd53r/4eYVmkGUvAQMKmeysxWpF/omPBjlPTSLTmQU=;
  b=A7kjVzBTx70ZTl+Pu8ggKbOmYmlHUh4Vg7pzeQ4tmA0RNWJ0aa0hCj8b
   J2CtskxqbzpyGlCM9QqDOSViipzevQFndum2+M1+zfcUooIL95U1IOyhk
   S18l6qFNXL+TLgwXt0x364JVGpRCKn+/IhZZJ+PJSdoWf2ZJAT4cy4n09
   g=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 117786688
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qYjbrKC7V3IToRVW/w7iw5YqxClBgxIJ4kV8jS/XYbTApGkk3zQBz
 mAZXT2Fa/eJNDT8c9EkOYzn9R5XsJeGmtBrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxA4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1txMJmF/r
 9MiawshZSCsgOuW8oyxRbw57igjBJGD0II3nFhFlWucNtB/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxruAA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPcrS382LGfzUsXXqopM+GS+PB1r2G3z00eKSMuXlC4kaGQ3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8ztLSxitvuSU331y1uPhTa7OCxQNmlbYyYBFVEB+4O7/Np1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlkRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:uPEUa6FEr4c6R+1xpLqFVZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdqZJkh8erwWpVoMkmsiKKdgLNhd4tKMzOW3ldAQLsD0WKm+UyaJ8SczJ8R6U
 4DSdkGNDSYNzET5qyVgTVQUexQuOVvmJrYwts2pE0dKD2CHpsQiDuRfTzrdnGeKjM2ZqYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njDsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqv9jIDPr3DtiEmEESttu+aXvUjZ1REhkF2nAib0idqrD
 ALmWZkAy080QKUQoj/m2qQ5+Cp6kdQ15al8y7fvZKrm72JeBsqT4dam4JFeBqx0TtfgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gCwlGl/NLQgF4vsulKREhg==
X-Talos-CUID: 9a23:lYgOZGFjLaHs1/qwqmJLznUzGvF/XUee91vbE2C/AEZbdreaHAo=
X-Talos-MUID: 9a23:OvBv4gsH3prr0nJJ9s2nvxY+Hslm/IuSLEksnLQ4g8KPNhwoEmLI
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="117786688"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4HFPfDsqOmfzYJUGO2R+PhYV8yuirtcum/mLRVgy0Teu1gXq5C8xNAPoQqEmG+rPw0geVpf+rd4L4KBiWV6+OyjtLD0xRawGwPeTbY5dnsb/fajSY+f2qhBi4YmbDP0PWaiME0F2os8y5gI9Yq0c2buPl9faVgsEhFPSiY3TzJub/zEf8p4ufizDfegXK5rBVQbfoTHbyaT7pG/r6BICup19fyb4CbOpxmIMaKgQV4XQ8BEedpdB6ZKbLPr1+lvL3AxK4L5xJRMD82ZBCUb9E2G+M8GOEziQJjl+SJlXSc+qC2DJkigcgyL3qo2caffXBWGYJ3cIOTutUPUvoH3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgKxqQHr4ShwbPmBjiVo8c6X9VCkUpAoN5RBLlpefTM=;
 b=DppKI6M5d3lSBQNoAb02xgH3QpVsPthQuyXOa38WYOdjHe1fT5sOXyXzX9Kq9lxPqd+to8CkirXTNS4+jXZVf1ReHzB1b/e+OBFIN9ka4LxwLe3Bmx1uOODqKe6DzZakGphgGrDJenL4k47lVP6zCmftF+gJLLDL/jVDj5g9AUFf+d4EZ4Xpnb/v7T1YEQmCO7nO3C7WeBNCiGZpgMEHCcACP5T3M7QWDORf+kwvZ7JjofPq8JuNqU6wMZJcNGIErgILi6wPyeN4G6NakNYcRBXxxpPpoXTMYFgj701Nv4ic+aMaehYaa9rxNFxtSt3fbiL3ZmRFLWKA7nQTLSmDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgKxqQHr4ShwbPmBjiVo8c6X9VCkUpAoN5RBLlpefTM=;
 b=E8hq28SZrADnoJ4aNwrU3Nky/t7nZMvrzrDuvp7hunxQKF2KWD+hi8qlNgoSo2znpQtLdnZE5wpaAgl8JW5Y9gqKXoiOj9tIef418OvKbmani0eYr7rSyRWW1AHTXccP99K1j+5buEIPqNTu7JOSm13EqoiJW6iHde8ShJ4RZzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/3] cmdline: parse multiple instances of the vga option
Date: Wed,  5 Jul 2023 13:47:41 +0200
Message-ID: <20230705114741.11449-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705114741.11449-1-roger.pau@citrix.com>
References: <20230705114741.11449-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f1c001-36b7-4792-1cb3-08db7d4db0f6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NrQfB0dqjQ6jJ0Qx0GYQQeQxqCr9aZx2cP8qgHfEp/UZStgr/k9Q62Xl8Od3UO9w9Hr4uUSIE4yWqqdZLMrVTtTIKkRwiwldZFeqk3L/hUbj1RL9clyLWlIbKDWO61qrAgNcq51G12pIjjnQL4Hh709mC+QiQlH2QAq1utfZun3DO5vH54N4T6mrtdT4VLmS4MGdb1piTzvSlBtHAk5N9jC5ftvKDCFF/B5TpqOt0zHZlxj1/jUQeU5R7yjlUy+rtSoY3t+cLy6mPmFN+q7nSw1Pk5FvLvbcdCu5a3/ZPoA6e8PfXoysYPfx/A03NPqodG7oTlnEDKjLD7pklBgnlS7+NCnc0mB4SVUoOEpfwyWQP6QDmtRKFlY7joAVBenTAhx827oQUY9BtVqIZMUSQKN+VX9JGrrEabDz6lG0/jRpRODq+V8kBsIvhCuyxXGJdDodD1jXDOqyR/Vd9e2Kw5uRMzLet2Oe0XvfCMqcb2BpCM+yxGecmYTochH48nrdlJ4N9nQUwZ8iWg0VMmb/A2yzBBS7ZsJkQcJGdOWTV/huIxE/imtJmI95rV76qGhS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(186003)(82960400001)(478600001)(6512007)(6506007)(1076003)(26005)(86362001)(2616005)(6666004)(316002)(83380400001)(54906003)(38100700002)(6486002)(66556008)(6916009)(66946007)(4326008)(66476007)(5660300002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVNmcmdvZ2lDeWJnWS9Xb2FyaFlWVEhYRzZ3MVdJZHBqY0pjcWgzUHVCZXdF?=
 =?utf-8?B?T1YyR0lSb2gzNkF6Z3JkVTZnd2RaY3RydkxmbWtnNWwyNmJXQ1FpV0ZoZlpl?=
 =?utf-8?B?ZGxoc0huMU45SnhxNU5uTHhDTUhTMzFRbVM4NU05QllCWDdVZll1Z2dhU2JD?=
 =?utf-8?B?RUNUMVRxRXBBR3prbzFsUTJDT3l1dXhhZ0dwRVVTaUtXQmF1TjlJeWJiMmJC?=
 =?utf-8?B?bmlTZytFdVE4OFUwSVdiSHZkS3lZd0Vsam50RDNhMkhXbnlhZWY1ODlCZ1ZN?=
 =?utf-8?B?QXhpQ3dYdEJOeUM4YmJVeTQ1TzVUWTg0cE4wTExVYldGY0Y3cWRrOC9QVjlG?=
 =?utf-8?B?OXpzb3orVGRkNlNTS010YlJtT3Y5Sm1FaW5PeCtiWXgzbCs5RSszUmtodDc1?=
 =?utf-8?B?amtGT2RSaklnQmtYdW1PL3V5OU53VmU4TE5DRmhGVWxTZUpFZU5QZGNLTFdG?=
 =?utf-8?B?UTIyNnNlQWQxQmxXMUlhQW9nTzVVQkhTWkMrTWc4UDRDend4ZEJYVG5QdDY5?=
 =?utf-8?B?OUdDNkNEVnJrSkJQYkdXVDFvbTZLcHY4K0FJdXQybUhYaThZN3pBbDEzTitW?=
 =?utf-8?B?S0gxMkZ5TGhMZ2ZWVDZIRHNmQ1hNS2V1TWM3NnozeEw0Nnh3eXBDRS9keFNn?=
 =?utf-8?B?RFRVVHZ2ZlRRSUVGdnRFU1FOWXBXMDRtL1lhVlVyZ2tNY2lYa3FVOFBKUGRM?=
 =?utf-8?B?TFZFVGhKRzlSY2VjVStjdDlYVWZPZFBJMG5qZ0E2RlVBL0lTWjZRQ0NiVHIx?=
 =?utf-8?B?QWF5V0lVTmo0WVFJTDRBdElKUjNuTDh1Zys4WXczL1d5d1Q4N1RBOG5uemU5?=
 =?utf-8?B?QUhBYkFvcjZCTUExakVudGFnRlV5bndYNWwrdGxvd0o3OUxka05OZ2pvNkxG?=
 =?utf-8?B?Tkd3Tk4wRThDVW00bFVreWdvN1l1TkE0b2syZ1J5U1ZCTU1DZWk3ZkZOU1NT?=
 =?utf-8?B?dkVRZ3EvRjVkbmhRZCtmdjdUQkVJZFo1TC82ckR4NGhuRE0rZjM0WnA0Q0hh?=
 =?utf-8?B?cEZlNFZwcW9LdlZTVElaVnRscFVDZGprZCs3VWdONkVuMDhJVUF6TTAvQkxk?=
 =?utf-8?B?aDk1N1lBTFhoTWdYMmllOVRnSXhTc3Q0ZFh3U0tLdkJGMEQ3eEtkUzVjQkRu?=
 =?utf-8?B?bDVDVGNZMnlaVHA2S1hUQkRYZklJWW1oRzNaTHYrZEFyYWE5S1NEQ3lNcjAw?=
 =?utf-8?B?bE9oM2NUK3h3ZGo1SFRWN3FtdkxnS0pSUUoxMEtjWEVNK3UxZVl4ZXNzSVJR?=
 =?utf-8?B?bG8ybTZudXp1N29PR1c3c2JJZk82VFIyOW8yLzh1OHprbWtMZDg5OW9MNWJQ?=
 =?utf-8?B?dzV2V0QrdnhveFJRc2ZLL1NGWnlJb0l1WU9VQlFydDUzVmJ5aHVvTTFHQ0xw?=
 =?utf-8?B?enoxbmQ2RFU4TG9sem9PSzh2VVFSVWtZd0xKbVFvaCtqNDRxcjhvNVNFcG9i?=
 =?utf-8?B?MnlPUkZ4UndxTHQ2a3gzeldvamxaVjdQZjBubjlDeGJjWDdlSENhdjNMbjc5?=
 =?utf-8?B?ZlhyMlJYRzd2RENVRlF4bitVcm9mZ2g1b0ZkelZibFJjZXJtVkpkS0hGWXpL?=
 =?utf-8?B?SGJ5MFdIc3U3UFRmbGd6WHpiK2llSWVFWnhhRGlpUHZLWm5YZm5TQUt5NXRN?=
 =?utf-8?B?L29CZHN6cUVHbkJuUXo1N1JBT1JkOFFPUnlORXdkMUdkV1lDclRCK1VIbUFP?=
 =?utf-8?B?VFp1a0R2Yi9SR2t4aVRXZTBabXNiOS9RN0orMjhZZGl5Zk1MREFsczN2K21K?=
 =?utf-8?B?aGhvek1KdFMzblg0KzR3NURvd0Jrby82R3FlTkRqVTdET1N2TXlpcFJtKzR5?=
 =?utf-8?B?bUJzSmdKamc0WElZZFY0cGN0NWJEWjFYK2NJYU0yd1o2RXNtOUdlOERUY0ZD?=
 =?utf-8?B?cmc1a2xHc0NMOXJKciszZCtVV3MvZHRvcGJWMFF4dkZtTmJjaHUxWTNIMW1j?=
 =?utf-8?B?OGhZOGdmdzJNOVoxbDV1Y1EzN0M0WGhVTUNJOGdUR3ZYanB3a3dnMWVJSjFz?=
 =?utf-8?B?bjBOUlhQZC9VZGpvQ1J5THBDZ1lNNUE1bE5SVXhwRVZwazRkQXVGZ21ycE5Q?=
 =?utf-8?B?UmNjTEU0a0lGVWZpM04ra0hleDJBbEwxMUxkM2N4aHgramFYYk92SE9wZEp3?=
 =?utf-8?B?eXZJWm9SVk5qMkpHOU9qOUYyVkEwUWJaazB3Y3MxTDVRQ2dHaFowRXlxZnF1?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	88qzQA3YoeVP2t/VrZj0U3/AHthmFGTXqgMaE2D7qaebvXy5fBtbL7IavXeJ6Sa9aFrlXiz6Ag8oEZnHfsvq+N/Wty6qPOm1zgSpPsSoPtTCfvQeQVp3PdYkgJ2Oaok/X/xZKY5ySu1loKClar6jYp8j9EmlcxDoLLOycDoVVu0mw+rwmOw3oRjnFwQ2P+l5drfG8fsJttRODjHw60aNW9D6S0e+vhcdwp9Rbn7S/Fl7ZpOPymY2MfjCPCAgpfC617nItHNEbhw6FVmyEh/f0O46XqAERllWa9ulqPwBDjEerYAWUo0J1kDXv+Nf7jxFqsdaE+OwemV7mLTjXNAghkS+LDnJO/+diReqm0x4g2Xi99uQekkgRiumsUxKs/0zvgOr+KLwU6CHqGEvz9fXvC+HSvZFSMXmBmeSIJVwB+WB0vm1uEvzKfdIwtL0tCJ9k5jOSm/09Gfea7h9iaY6v/zUIUvvL02avzBQ3JsO7sp9VfZ/dn9zU3T7VUnRr6eaMhtIABOzsla6PByAb+urmUU0H7i/t5nMi1EHGblHE/nC1pQfdYMV26epYQi4OGCdhkoDIn5T3hy8ttVRv9fd7/KshC3BYKwHIxAL2R2AvPsB2xfKPnEcWs2Kn4rAD88UAbckgtvtqBILS7rpArQKUeciB/C4XXhgAMeeH2ovlaQI0wpIHAo8cj2buO6Qe07Zb80sGPA6WfVagkWLW9XOYQNfiPBQfzFIj09K6daBngYKvSjsS1N59IhOXImcGqqJAJwbtUIoJA+HPwiwhthhdAWenpxIokT4UOe81A+SRp340Z4hjfwRk9W8hyPA5YrS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f1c001-36b7-4792-1cb3-08db7d4db0f6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:48:04.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzgFMRCbRolYQNVQZGHCMqf/BbeeUCyv1dcsJ7fqUgdAxzkzCYQd/HIncws8IzKKeODEkso5D6e2KUo3jWl8Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718

Parse all instances of the vga= option on the command line, in order
to always enforce the last selection on the command line.

Note that it's not safe to parse just the last occurrence of the vga=
option, as then a command line with `vga=current vga=keep` would
result in current being ignored.

Adjust the command line documentation to describe the new behavior.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Remove xen-command-line doc addition.
 - Set mode to 'ask' by default.

Changes since v2:
 - New in this version.
---
Build tested only, as I don't have a system that does legacy boot and
has VGA output I can check.

It's mostly encapsulating the current code inside of a while loop and
adding an extra else if for the "ask" option, there's a lot of
indentation changes.
---
 xen/arch/x86/boot/cmdline.c | 83 +++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index fc11c6d3c5c4..10dcc6142c85 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -277,59 +277,60 @@ static u16 rows2vmode(unsigned int rows)
 
 static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 {
-    const char *c;
-    unsigned int tmp, vesa_depth, vesa_height, vesa_width;
-
-    c = find_opt(cmdline, "vga=", true);
-
-    if ( !c )
-        return;
+    const char *c = cmdline;
 
     ebo->boot_vid_mode = ASK_VGA;
 
-    if ( !strmaxcmp(c, "current", delim_chars_comma) )
-        ebo->boot_vid_mode = VIDEO_CURRENT_MODE;
-    else if ( !strsubcmp(c, "text-80x") )
-    {
-        c += strlen("text-80x");
-        ebo->boot_vid_mode = rows2vmode(strtoui(c, delim_chars_comma, NULL));
-    }
-    else if ( !strsubcmp(c, "gfx-") )
+    while ( (c = find_opt(c, "vga=", true)) != NULL )
     {
-        vesa_width = strtoui(c + strlen("gfx-"), "x", &c);
+        unsigned int tmp, vesa_depth, vesa_height, vesa_width;
+
+        if ( !strmaxcmp(c, "current", delim_chars_comma) )
+            ebo->boot_vid_mode = VIDEO_CURRENT_MODE;
+        else if ( !strsubcmp(c, "text-80x") )
+        {
+            c += strlen("text-80x");
+            ebo->boot_vid_mode = rows2vmode(strtoui(c, delim_chars_comma, NULL));
+        }
+        else if ( !strsubcmp(c, "gfx-") )
+        {
+            vesa_width = strtoui(c + strlen("gfx-"), "x", &c);
 
-        if ( vesa_width > U16_MAX )
-            return;
+            if ( vesa_width > U16_MAX )
+                return;
 
-        /*
-         * Increment c outside of strtoui() because otherwise some
-         * compiler may complain with following message:
-         * warning: operation on 'c' may be undefined.
-         */
-        ++c;
-        vesa_height = strtoui(c, "x", &c);
+            /*
+             * Increment c outside of strtoui() because otherwise some
+             * compiler may complain with following message:
+             * warning: operation on 'c' may be undefined.
+             */
+            ++c;
+            vesa_height = strtoui(c, "x", &c);
 
-        if ( vesa_height > U16_MAX )
-            return;
+            if ( vesa_height > U16_MAX )
+                return;
 
-        vesa_depth = strtoui(++c, delim_chars_comma, NULL);
+            vesa_depth = strtoui(++c, delim_chars_comma, NULL);
 
-        if ( vesa_depth > U16_MAX )
-            return;
+            if ( vesa_depth > U16_MAX )
+                return;
 
-        ebo->vesa_width = vesa_width;
-        ebo->vesa_height = vesa_height;
-        ebo->vesa_depth = vesa_depth;
-        ebo->boot_vid_mode = VIDEO_VESA_BY_SIZE;
-    }
-    else if ( !strsubcmp(c, "mode-") )
-    {
-        tmp = strtoui(c + strlen("mode-"), delim_chars_comma, NULL);
+            ebo->vesa_width = vesa_width;
+            ebo->vesa_height = vesa_height;
+            ebo->vesa_depth = vesa_depth;
+            ebo->boot_vid_mode = VIDEO_VESA_BY_SIZE;
+        }
+        else if ( !strsubcmp(c, "mode-") )
+        {
+            tmp = strtoui(c + strlen("mode-"), delim_chars_comma, NULL);
 
-        if ( tmp > U16_MAX )
-            return;
+            if ( tmp > U16_MAX )
+                return;
 
-        ebo->boot_vid_mode = tmp;
+            ebo->boot_vid_mode = tmp;
+        }
+        else if ( !strmaxcmp(c, "ask", delim_chars_comma) )
+            ebo->boot_vid_mode = ASK_VGA;
     }
 }
 #endif
-- 
2.41.0


