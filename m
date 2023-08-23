Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C0785441
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 11:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589102.920829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYkEC-0003dR-Vb; Wed, 23 Aug 2023 09:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589102.920829; Wed, 23 Aug 2023 09:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYkEC-0003b2-ST; Wed, 23 Aug 2023 09:32:40 +0000
Received: by outflank-mailman (input) for mailman id 589102;
 Wed, 23 Aug 2023 09:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AP4=EI=citrix.com=prvs=59274c529=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYkEB-0003au-Em
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 09:32:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd9ad485-4197-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 11:32:36 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 05:32:33 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by MN2PR03MB5053.namprd03.prod.outlook.com (2603:10b6:208:1a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 09:32:31 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 09:32:31 +0000
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
X-Inumbo-ID: fd9ad485-4197-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692783156;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GvAi7JgvUJaHha88qOlXcr42sQyRVJZsDVb6Co8nffY=;
  b=KyZXYZFQkA75U49VM0n5uZocQGY67OMxhNWNVsyiCnKLbxhT4hEkemoF
   b3osgbFlKUJGjrK/Rh/htR+fK+KMzE5pes21CpGN7LWq2ElxVNqaled/y
   fQ147xqBu3HB35z4SY5hq5w850QT42pJYqwDA0oUw4T6edf3LtwvVxtw4
   s=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 120238342
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L1AO5qKUSGZfrFG5FE+RM5QlxSXFcZb7ZxGr2PjKsXjdYENS0TcDz
 DYfCm2POfaCMGamKYsnPo+29RlT6sfWzoI3SlRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5vWD5U/
 vIVAwoVTU+8qeOu+YOpV9RV05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHmjAtlCT+HinhJsqBrInDUxGEwkb0Xhn9iDrxWZfvdEK
 ENBr0LCqoB3riRHVOLVRBy9p3isvxgCWsFRGek39AGMzKXP5w+TQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAXJ2IfYS4PTSMe/sLu5oo0i3rnUdJLAKOzyNrvFlnYx
 jmQqSEkirY7jMgV1r6691TKnzKtoJfSSgc/oA7QWwqYAhhRYYekY8mj7gHd5PMZdYKBFADe4
 j4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsIFcFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:+im0XKGC1Qys6JufpLqEMceALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPGDP5gr5NEtApTmrAsm9qArnhP1ICNAqTNWftWrdyQ6Vxf9ZnO/fKmbbakrDH4dmvM
 9dms5FebvN5DNB4PoSjjPTLz7VquP3iZxA/d2ut0uExmpRGtpdB40TMHfgLqXOLzM2eKYEKA
 ==
X-Talos-CUID: 9a23:PDZKrW8wxXEUbgjjZoqVv1ZNRdoufHD29m/zfHCWCH5Qea+IdGbFrQ==
X-Talos-MUID: 9a23:g0zEggrROcG8nJeKDUMez3Y5bp5K8/WcMl5Xr7Q8npKjEAlrODjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120238342"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSH77QJJ3+ybj6gxp6XhynoaDXanBYaDrPz+vgbhMwPK6XLriKYAF1PD45SnyaFUZ7xYWrG+OaSd5OS5VXbK/rQIoVLRfQgAKf1LCzg9LS6gMur89SHn5aoOg7YTsrBmuRw6r+psMZjcrY7gX4hDcP2MuCrQVNHReZdzP6/WB/mlL40tJ7D6RyKvqGQVaTUfkGRpvQbTbcL5395yXif+R8/FD/6EYAVkRSIESBe1CKbZ7V15tr7zlcJV5JppsfJ8HB4QUQFWJKDBtMaVrWMh3gComYP3ln0pV40x7u4icYxIGwBb28FYkK7BOjUmzEmc9hMveBWIy0peVkNFLe8LwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/csi6HXDQXgudvsz+56a8rZ68eRR8lyq2H86xcgfGCs=;
 b=bU/Famu0mk/am9z6Gha3bG3sWBisHQkvhPrk2foMtnKgXgVuLF5Mmj2FRKUDISbU0/bumsX/6KVX2nIw/+yzKlH8tYT7dJ1r+GeIZEhVNQW7hSVFFs3BYrcBbmxRdtFMS9QRa2f73EL5OCUQEOW03lGIEWcRq8+7S4B3NXKMm2GyI+Q3HgXZo8WWUKWmUhDRgpXgoxzW2L9ZvBVM/PH8blGWq6XirkP+cpJwPgT5DHPtPJ/5TOreuVkUYcALLEHe0ciip4POsFpoLmD0TgM2IGBblIMzSAj4Q78ikGtnfC99xMqNou+OWuHNuOoainh+gdkTGVN0sBYKKUqXUa4iSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/csi6HXDQXgudvsz+56a8rZ68eRR8lyq2H86xcgfGCs=;
 b=Co3LV4n7Lvkn31y09qdqU27xc5edEBwThnEWcKn0VHaWio52MV+lovOSgrlYQDC7BS4HxvZGv0oO+4DHjRcaROfdHMCbxKckilH4nexzomNR2HbJXNsHQH2O7Gv9HkV0EdXmA3+n9EWUQXO+wKyiu50+U3iK1BTk+KvmWPKB7BE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6f81176c-2df8-d3d3-b3a6-ac6349b97ef2@citrix.com>
Date: Wed, 23 Aug 2023 10:32:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-GB
To: Simon Gaiser <simon@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
 <80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com>
In-Reply-To: <80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|MN2PR03MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: be712d60-fbcd-4bcb-632c-08dba3bbdfab
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ByRq034HqPjwihYb1mWGNexcXGrPv+6sl6ChhuIqW0pc3ngfXEF7UTfKdj0veOsxTKrnEsbVeN75CN8ar4maEhDbI/tUNmXsemc6LY22QLL3dwshmbcWdA4uQBYDtYF7nJ7XmtwAuA5Pxm2YgWaLfIbE43PaqIVAAHnxmJ1PLZxjGY3jMrmqrei3V1KOjeZLJZCPIDSm5f29Ely357Wwq8xgXnYv8MSz5ssfqSQC+o1CHYQtiVJHcSfTFiv7xx3LBIHljmruT9yOKldFp3gwSmih4teugPDFBpefpXCkxYuk6hP1vs6UXQ3sap2ywEczVMcqEbky+NNCEyNIcNxPiwKPwHEdr8oPvaXldqmWTLEIBdsct+7mEQOQmgaHtH2CXsi3l5WcFZ6eRQUmS3p0X+Y+CDMIXGcWCWGP2VrNyQ1J8Y2ZIYZCqQOcEuSYM5woqa+Svf5G1/cKUtaJQGLpJxhXXLksXXbk6VGixdEENT67fgeVU1K1wgFakj9e0TA11HAZWcRPzyERa/ZVr5vvU8/1qY7VGucJ2iva0sbYkMjxJHEoWimJOdcN52pqCN3a34qb0Wp7kTXkxcszJELxWms0RGuiUtpS20bKTvS4dxaMtmYymptU2e7y1mCCgC0PYKbIrErIUmI8bOpfOGwGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199024)(186009)(1800799009)(86362001)(41300700001)(5660300002)(54906003)(66556008)(2616005)(66476007)(2906002)(66946007)(316002)(966005)(8676002)(478600001)(4326008)(8936002)(31686004)(82960400001)(31696002)(6486002)(6666004)(53546011)(6506007)(38100700002)(6512007)(26005)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJBYWtuaHpRMDh1eWRHZzJWYnZuVlN5TWRDclBkcXZYUkYrMEZ3azlxQ05a?=
 =?utf-8?B?SlJvWWtsZlhXOUtTQ2Z0OXZPNEF0djBiVThtdGJRdzdTSG54V3dhbmY3Y2Fm?=
 =?utf-8?B?ajRkckJzMU5VMFRpT1U4ekhTdmZ6YXZ0cUJqb3d0NU9wSFh2bnZGOTZsaWhU?=
 =?utf-8?B?OGpHOW9nY2NMcElSUG1yQjVLREQwSkkxakZqT3BMK3d6NlROYXF0NkljU0Ry?=
 =?utf-8?B?cXR1VFVnYkZjL1RTRHc4VmZiSFZiR2M2VkhINEQ0ejI0QlZLQUxISUdrbmtu?=
 =?utf-8?B?VXpjLytCdkVLZXB0LzhpNWkxY1NrbFc1T2E4M20zbGUwU0t5QjFxbWx1MTZK?=
 =?utf-8?B?MTNVeGEvR0hPUTZ1R0dXcEVQU1VKeDYyNzNhNG13Y0M5cEN1T0xHSkN4ckpP?=
 =?utf-8?B?VEp1T245OHJzMVJqY3JRYmpINHprekVlWnczcVZlTWRyTloxVVdqQll1TVU5?=
 =?utf-8?B?NFF0L0NDUUtJS25KcGNodEVVV2RqcXhzZUpDNUNLeFUyWm4vRTBGUkJqRjdR?=
 =?utf-8?B?SGU1V05KcEhHV1AvSGVLdVFacFdkRXp4cjJGdXFUWEpiS2ZKdWFjbWoybXNr?=
 =?utf-8?B?OENMV3ViUDZ3NTdCV0U5bGRKMk9FTlhlZG1laFlXZlNtWHNnMFVqY0QwOWRO?=
 =?utf-8?B?M0dsYmhvenJ4ZW41RnJhSHBTclZWc0pSRXhYei9PQkhiV0t1YnR4MGJpVCt3?=
 =?utf-8?B?aVlsTWcxUFZydnRzb3MyenJBa0NkNFFMSVpYOHpwNEhSYWRHNU5zYTdzK3RF?=
 =?utf-8?B?VDlRbnJoQ00rUzUxdkRac01tc3BXak4vekR2ZEZEQTVFWnNsZlFFcExQZHd1?=
 =?utf-8?B?T3NYNTNTSVdqTlVPN2tqcHBoKy9GK1oyVy80QVhrd01iZ3NNR2RoVy94Si8v?=
 =?utf-8?B?blpUUWxnM0RxazJjRTdHRitOdzZPVVNQbmxGaEJSL1ZWT0ZDRFFVRWRvQmFs?=
 =?utf-8?B?ZnJWOXhGYy9yKzNIZVE5b0dBaWN5dW1kMHJBZk1mL3BDam9XNmQvY2cyNFVI?=
 =?utf-8?B?d1grV2pNVG43MTZpNThyS3VuTWxYcUp6eldQZjhRK3B6OGVSRitTNHI5ZU9F?=
 =?utf-8?B?N0p0MXAzVjZxZ0ozdHJ2c2tzaUVhb2dlWFByc0p5UnBVQ1NmSHp2bWpDVERz?=
 =?utf-8?B?OU9acllyaDUwTUJyYUcrbW50U0FaT3RNNHQ0dmhKT0M1SzdJc2ZlVmV6ZVFv?=
 =?utf-8?B?L2E5S2NJR3VFUU5jdnM0TmxYekZQUTRIWFY5VXRzOGtCL3E5OW1FKzdZVGlm?=
 =?utf-8?B?ZmtVa2R3cmVRSlF2OHJxRkxYLzZZYlc4NXYwemZFcTJDQVFIY2dLcWRQa2pu?=
 =?utf-8?B?YW5UT0VwaGdObVBhUnF0RlpLcE9EbThxMHMzTGllbXFmQkE1VmRoOVEwNzNv?=
 =?utf-8?B?Y0RUblU5dDViZk1SOHJoa1JHL2ZTVUNhNi9kR3ljWVhFVlBiblo1bDJpTXc4?=
 =?utf-8?B?WUxUUzZsaDYwV2x0RWNrOXYrbDR2ZWlvR21BT1B6VUY4UXUvS3RGR3Yrc3Vl?=
 =?utf-8?B?am5xbjBKMW1JNWdURERlQXpyYXRmb2JHRXU1dndDcjlINmxUK0hUdFcwclRO?=
 =?utf-8?B?WjF4MXhKditkb1VkNHYzZlgrM3BLNDViRXZQYUhydkg1MTdCaExpTXdSckhh?=
 =?utf-8?B?eGhQQTFhVkY1dmEvZlJ3Yll6RHNWT3lKbHFFcjU0eDJsTFlSbUpLY1QxVmFq?=
 =?utf-8?B?Q3VKcTAwR2N4cTNobk1lRXU0eWZTOFE1R3F6ZEhqWjdWVkIzUWlUZGQ2cEZD?=
 =?utf-8?B?UG9BUFBhMXB4M1JmdHJRT1RINk55Qk5tVkpvQjJIYVJpbWRiRzRIZFUvYVg3?=
 =?utf-8?B?T2dQVnB6YU5qOVZxaldXSDc0M1REZmVVOGpUV0U3QXl0bzNjYmNjaDMySXJ6?=
 =?utf-8?B?YWllY3hPd1ZEc0ZObzZzaDF3T0JiRmk3bGd3LzFKcGQ5ZTFIK3NUV1RNV1VN?=
 =?utf-8?B?R3Zia2JCdmhBNGV5MDZVQ2tTVlJDbUVxaWYvNW9DWjN5R3A1MTF6bTNjWGlB?=
 =?utf-8?B?eXlFekYyc25aVjhXbVlsdm12Nm52WkJlWnpEWVJLMWlaeGRJcmRlVldWYmJx?=
 =?utf-8?B?STRzTFVWa0o0b2kwMk9zOTBzdWp2MjFBWFhmWTJXZzBYUVI3UEZRazMrclo4?=
 =?utf-8?B?M3ZlRndQM1Y1bExFSkM1cFdJTitSR1o1NHhUeDI5SHhVK0FhTzVwSElQSzFH?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xt5ar8930wRsePO02ECX0D4YozAssztcKeK4SCpff7O7C9DNDKdLWT+YOaq7S1h8EECImRxzPzPU8Q+pXOGLcBX82q4D09gRF99LBLxPJArEQ/AM58oLpR/oHYkXFoJgUFZr/xqh3NRUMSFXUTM3HoOMxITnd5Og2owdfP/PFs3H+4hRNblskapbhRrBnG3sutFg8IMVJtweri017vFf0Wy0XrD02cZkn7OPL8LXgVL5JAYL+YXimi69CmaFjgNhFzzCYdAac1Xvb3IslWW1p5aKdwgCo4VUbwV41aoswJoxB2F67Gp+RPmvDY6q75R2xFLCCs1GlbTMaSZ329RXaatLge0ILxx+xL+IapvMFJcs4inhe12Vv62BPwNrD1QfdSI6znTVV+F0kWwJVOUcDx0WuMJ88FJJS3H+V7w2PKP2/a45s0DzHWtSfdXUr41i4pwvNbdKzx2GbjnrCeH969cUX4g7YupSrfg6m3Bs5YO6m/xQ+NG3DubCnfUOqYbXVdU5EfLNGMfot4Ub0vXE36KYOXELrf/lKFYLgRiqA+immg7bsfRlAY3egxC0pEr5LOFAKIhZ8Ox087thUaEuMvzMQlvKH5H365O6mp9DwqmGxE9TYoEF08zfyjvu3rDoWQ5CIklybp89Ci30E60DGQebhMuXIc20dLlQjm5TDaior0D5KNlvi751KjGqkwWr/odCxhlUxTfs6fS594NOS0tWqbs8znZ7CH3zYxxsEmMCzLqKNbji07JfM17rLXs9/tp9dJldaTZgxFe7Aymrw4v06DwN9ChpnBO3jd/QBx+rr6ON92siEwlUS6XCdIQp52AgkwuOXwd9LnGppQwNkGf0uP0UdDLmpcUdGb8yRLiMgnr/I1F2erVOIxMeYGdc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be712d60-fbcd-4bcb-632c-08dba3bbdfab
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 09:32:31.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gP6MMduriqzw0ZlAmT1ApYPugZpfd5IMt7lYjfIrahX0S0m6Ltq+1+XVxv/9K1SfHMcYbf4S/dpqTlrdRP7r4aOBpLTZgDgd2v76+VNnyBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5053

On 07/08/2023 3:45 pm, Simon Gaiser wrote:
> Andrew Cooper:
>> On 07/08/2023 10:38 am, Simon Gaiser wrote:
>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>> 0xff. Linux already has code to handle those cases both in
>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>> same check to Xen.
>>>
>>> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
>>> entries with a valid APIC ID. Linux would still ignore those because
>>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
>>> this check is only active for madt_revision >= 5. But since this version
>>> check seems to be intentionally I leave that alone.
>> I recall there being a discussion over this, ultimately with the version
>> check being removed.  IIRC it was a defacto standard used for a long
>> time prior to actually getting written into the ACPI spec, so does exist
>> in practice in older MADTs.
> So I noticed that the check in Linux is actually slightly different than
> I thought. Since [3] it always considers the CPU usable if
> ACPI_MADT_ENABLED is set. Otherwise it consider it only usable if
> MADT revision >= 5 and ACPI_MADT_ONLINE_CAPABLE is set.
>
> So I checked what the ACPI spec says:
>
> Up to 6.2 Errata B [6] it only defines ACPI_MADT_ENABLE as:
>
>     If zero, this processor is unusable, and the operating system
>     support will not attempt to use it.
>
> And the bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved with
> "Must be zero".
>
> 6.3 [7] Then adds ACPI_MADT_ONLINE_CAPABLE and changes the meaning of
> ACPI_MADT_ENABLE:
>
>     Enabled
>         If this bit is set the processor is ready for use. If this bit
>         is clear and the Online Capable bit is set, system hardware
>         supports enabling this processor during OS runtime. If this bit
>         is clear and the Online Capable bit is also clear, this
>         processor is unusable, and OSPM shall ignore the contents of the
>         Processor Local APIC Structure.
>
>     Online Capbable
>         The information conveyed by this bit depends on the value of the
>         Enabled bit. If the Enabled bit is set, this bit is reserved and
>         must be zero. Otherwise, if this this bit is set, system
>         hardware supports enabling this processor during OS runtime.
>
> So with confirming firmwares it should be safe change the simply ignore
> the entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE
>
> We can also do it like Linux and ignore ACPI_MADT_ONLINE_CAPABLE
> completely if revision < 5.
>
> Note that the revision was already increased to 5 before 6.3.
>
> ACPI spec version    MADT revision
>                   
> 6.2 [4]              4
> 6.2 Errata A [5]     45 (typo I guess)
> 6.2 Errata B         5
> 6.3                  5
>
> [3]: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2fe99644a01f
> [4]: http://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
> [5]: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_Sept29.pdf
> [6]: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_Jan30.pdf
> [7]: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf

Honestly, the reserved must be zero means there's no need for a version
check at all.  That bit will not be set even in older MADT revisions.

That said, it's likely easier to retain the version check than to set up
a quirks infrastructure for buggy older MADTs.

~Andrew

