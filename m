Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4FA35995
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 10:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888633.1297973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirZW-0007fV-Ug; Fri, 14 Feb 2025 09:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888633.1297973; Fri, 14 Feb 2025 09:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirZW-0007cg-RD; Fri, 14 Feb 2025 09:01:18 +0000
Received: by outflank-mailman (input) for mailman id 888633;
 Fri, 14 Feb 2025 09:01:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K06w=VF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tirZV-0007bq-Nk
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 09:01:17 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2407::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f23b54d-eab2-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 10:01:16 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA5PPFC3F406448.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Fri, 14 Feb
 2025 09:01:12 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 09:01:12 +0000
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
X-Inumbo-ID: 3f23b54d-eab2-11ef-9aa4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nh3oWotrhUS/RX4XH9S8ebxcMiPzZ2NVsEJVubroJws+7RCEGP4GlHnYGdsvBmxY7iAzXO5N/QAKTEykNkMxRm67ZlBJlu5hf55coo7AnXU3mOydihO9uW6feTo5QoFNvgStHK5/5wjeYdZDD1z9Y62H1XzhqcRI0Udw4pmbACrb8N2/OIKR3+nrAP0XTpIMpxCdHzkEwZikGZ2Bd+zPKI2+woGNSu5VJ1oQ+BWMT6Zk7NeYPpBtnsSCQYbSvnvMEmv2igGeu36RymeCbZfoVpiRq5SUNhrlnE96r1qOhIM98HyH9Dzpzr17dfge6/p1n/W0FLfeETxPK9WTNIqyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45iqNkxXBPv+1X0OuQFk5ayq1jVtDKR0WVl00qKrLAA=;
 b=M9T1Ukn1tETx262NpzPg0Oh+VEknXFB/pRDbABcef90MpiLOYHyNw9+UyhFUPdGefUQ9jHKMTkqRqhE5sIp2Sdf3W3ovi6J8+caqOMR/VO/IhFWSM9aVkSJNfB/HLv1dLK0oEnJ8DW1kWUHmFcsIVvBQh6G0yK1z6C2ZhbkYxW8NY3kwQKrshMZP880vC/ZORLW9ZZF77KohLOOScN+BFSbAyI+NiQSpO57kK0fu6n0tz/AbR2yBvTmQTJJNtApODzzl6fIPvXL0HdlrKDledgb1tcLL/c4yMcdrJIuu0MUxlTAee20YUpQmzYViR8Jx0PfOOwXS1JOnnx2AwVLwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45iqNkxXBPv+1X0OuQFk5ayq1jVtDKR0WVl00qKrLAA=;
 b=JNP5R0Jd0UkHjLRTLuYm74xqj+cekUl7e0h4vC6zeIyToJqBH0VXPZkprNzsVJzzuOuAT2cbybF7JUOElp1Euh/8bCLFfk+iy3jmaHjxDT/GL8lF645AsdLtMNCLdS5tKLrkjWpEWgi4lfAMP1hLGCuakp4rtNyTImn15KDnkdc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>, Jan
 Beulich <jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v8] vpci: Add resizable bar support
Thread-Topic: [PATCH v8] vpci: Add resizable bar support
Thread-Index:
 AQHbfCv1LhGDvDdYvUG/cVOOSigHrrNB1FUAgAGqhwCAAu7EAIAAC/MAgACG94D//38EAIAAinmA
Date: Fri, 14 Feb 2025 09:01:12 +0000
Message-ID:
 <BL1PR12MB5849D418700CAF462753D58BE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
 <Z6sWnK1BYxArBq--@macbook.local>
 <BL1PR12MB5849CF146DFA8BD2761D1F4EE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com>
 <2fcc37f5-20e5-4c52-9e8b-c24121c05e8b@gmail.com>
 <BL1PR12MB5849BDEC2A23731E9281A26FE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z68BPHUxW42KdJPs@macbook.local>
In-Reply-To: <Z68BPHUxW42KdJPs@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8445.012)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA5PPFC3F406448:EE_
x-ms-office365-filtering-correlation-id: c89db2a2-2854-4efc-1686-08dd4cd6216d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q1E4WVJrdVVsR2lobGQvcnRadGN2ZU9obERhWjdHekhpcFVBVVJZM2FjbWR4?=
 =?utf-8?B?MVdTSjkranlwZndZeU9uYnBpVmlTV0UxdlpQeTlWTHpLOFlkdVZrK1dqMy9U?=
 =?utf-8?B?U2Y0QmFvYWdrbGxiV09MQllGOEFvYjRCT3laL3c4SE9oUmgrUjAxL0FjdmhB?=
 =?utf-8?B?K3QvODdJb0F4WlRLazRIWjV2VWhpd3ZqellJNUtkVXE5NlNDaGxHdmp4SE1i?=
 =?utf-8?B?cGxua3pwWEpXS0Q5bnpqc0kwWERySWpNSERLMy9kd3VTSCtQSHBwQXZ2NUZ1?=
 =?utf-8?B?ckl6Mkp0aXdRalg1clVVQ3YzSWNYUGUxQTB6R2ZiRzNsS1lyZW10UGl3YzVP?=
 =?utf-8?B?RTV2VExjcHFxZWZuWGRnUXQ1OFV6ZUZiSkRpeERmQit2MjlpbUVmSjgzblpK?=
 =?utf-8?B?SnBZYTBGQUtzcS9TMHE4dW1PaTNrdDEvRXFlby8xaWw0NTgraVE0dWdOTWhz?=
 =?utf-8?B?aTN1VVBscDhITDVLV3l0cWZhVi9vY2xzcGY5REJycm8zVUZtcW41SnEvMXgv?=
 =?utf-8?B?dVlCRFI5VUZYQzlubnpsejdvM2pQNm5XWnRYdXN3a1RneGo4d3ZFM2l5Q0Vu?=
 =?utf-8?B?YVRIMWt2WW03TDhuSFlwdmtyOERHZ202WTYzSWdDeTk5bmQ5YkJjaG1iYWMw?=
 =?utf-8?B?b2FScjRHbjFPU1BkUkNVZEdHRVlFZzk0R1NVNmdnNVJhSEVCaEhPR0JPRC9x?=
 =?utf-8?B?d2ZEdjluZXlKWTFGczh2b0RZeHUwOWdoSEFOSnNoVlpNNnpRbmpKRGVVT2NO?=
 =?utf-8?B?cmFVN3psQVhxTUhjdUNSbUo2Y2hGVU5qUkthR3hhQ1ladWI2L2U4ZHJpUFpj?=
 =?utf-8?B?OXJlellTMWw3QjFpbUE4WWdtRHFrRU1kQy8wcVVKY3UrUUcrVWYxM2N6Yit3?=
 =?utf-8?B?SUUzWjRaWm54dUZ6VS9xa0d2WFVGajVISWFtNFkxVnBzSUkzWnpGeVR4amox?=
 =?utf-8?B?Mm1vczZzTXBwNm1GTENnVWJ3SmJkUFdOSGpmZm9aK1MrREFzdFNNL21JK0ox?=
 =?utf-8?B?aE9XZjBTSHB4RVFVamlscGtua3RJMEltMjNXUUlqaGEyQ2pETVVrQ0NRdnNz?=
 =?utf-8?B?VXBFbHZ4NDFWOUlaVnA5RWRzUkNIR0hFc1dYeDBITHBPbWpxYzRDYkdlSlJ3?=
 =?utf-8?B?NVQ5dngrWWl4ZUZWcGFmbHBOZVRFSW55OWwxbVBUQ2JMeXpvekczdmhQb3dy?=
 =?utf-8?B?WmJmbndXeHVvTitaNVQvRDhFTm9IV3M4V3pRb09PNTFXTjlHN2duWGUzMWo3?=
 =?utf-8?B?M1FhRkVzeWFYdlhodFIrbnA0NEdiM1c5bFlIejFzdDRXYzEwWUxaS3I2cVZx?=
 =?utf-8?B?NFFMNEJqSHQyTWhxWFBjUTcwcEVzY21uMysxcVFDQi95b3podG81WDNmVzN2?=
 =?utf-8?B?K0twOUlRZXc4QlZ5WWtpNjFnNGRLY0VreGFVc1BGWFg3a0ZvWUF6UmE3V3lj?=
 =?utf-8?B?NWZhcXozd1BXR0RDUndrL3AzbG8vKzR2amY4VmFtZy8vZVdua0hKeE1YNStR?=
 =?utf-8?B?SU9LOS9CQ0tiRlcvZElYQ2tENDVPTU1SYUxJbGtiRDlLUXc0QXpGZGxmbStY?=
 =?utf-8?B?TWxBR0J4U2JyanppQ1NwNmNyVFhadkV3T1pPY0dEdEN2Z0U0dXBMeDVsbElZ?=
 =?utf-8?B?dnpwbkJxb01oZGcvcEw5UkY2RG5KLzdkUlVNRTh6YmNwSWtWMCtEaUt3UTFQ?=
 =?utf-8?B?MnZMTUVCSWZIYjM5TlFpYjJncG0rRjVGUjJaMjVMMWxjVHpmVGhHaEcrbE80?=
 =?utf-8?B?dGkvbWhwbTZGYTJyMC9aWXlhSFo2dVV0eHRVSFBzRWorSHlEVlhPL29rZ0ZW?=
 =?utf-8?B?bnJTWjdINEZURHZTQkFXZnJWZzN4ajlORUZQRTFsVW4reVdRR0JKc3lKYlJR?=
 =?utf-8?B?RnBCM0VvUUIydklaSjVTMnp0MGpuNFNydklyaFllbEZ5Y29xdWJtdGk1SzQy?=
 =?utf-8?Q?brkHoyn3igU4dKytSaSvKgISjborEoSl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MVR0SllwQjMvNDlVQW5UNURmZXZ2MDllNUo5NmUrTU9wZDVpOWsybEN6aXVC?=
 =?utf-8?B?M01DNHJIOWFCZUtOcGRWRlUrWC9Zd0hpSEdGV1RmZTFibU1hUTB3aVU0aENC?=
 =?utf-8?B?bXJMeWZCMnRseWg5NTRjM3JXR3M1K21aTCt3M3BRci9WTjk2bnhpN05Xa2tM?=
 =?utf-8?B?enJmTmliSFg4dUR6ZlhteGk0bkZOcDBMOGNwWjJ0eDJPTzROQllpdmZPb0lR?=
 =?utf-8?B?M3NTdC9MVGxoTFZpejJRR2kxa3NjZUt2V292dWd0STR6eTJQSWFDbWJIZk9s?=
 =?utf-8?B?SlIvNFBUMndKQXJEenJzTUVYcmVkVTFYbVBKajJiZTBTWkx1cGxrK0tKQUVs?=
 =?utf-8?B?V0VLR3ZCM0NhYUV2RzNZOVBHRDRoVDVnZWhnQXEzdHhLdmZKU3ByQzM1UEVT?=
 =?utf-8?B?RExRby93RDVYZ1RVcDM2a2hFTnpTOElqRnp5L1h3aFJNUTdOWlg5ZThNby9h?=
 =?utf-8?B?allkRXdrcGwrUjllYlhDcWYvSlJJVHRIdHRaQk1jdGNScS9taDlOZWpvQ2hO?=
 =?utf-8?B?SjRlM3hNTGVjWWZoWGxkOGRUTHR4T1NaTHY3SFptUDFlcVVaQXlOdTc5ZEt0?=
 =?utf-8?B?RWkrSmU3Si9wZkRFWS9BcnF5b0U2MUZIRndpbjFhTlZXeUNoYUFUczJlWnFU?=
 =?utf-8?B?Y2MyVEV5Um1pMUhVZWllREN1UFRGd1ZxaTRuenlkbFNhRjNwZlg3K0RsN0w0?=
 =?utf-8?B?cGZLQUlLd29ER1phd29KTi9vdi9PaDh1bTI5Z2tJTi9oOVl6emtpYmtab2tP?=
 =?utf-8?B?NUl4WGhhcHl6NDQzZm5jZm8va3U1QzJub2VzVmppeU9TSFBLd09OeWxwdmU0?=
 =?utf-8?B?dG5LMVBMQ1NaMS9jaG9WVzlLd3BxeU0vdFZ5K3NvN0RGNHMwNW9OMWlYN2pk?=
 =?utf-8?B?bUNwNk12YlRoSVpKbnh5ZmYrNEhtZmlvS1J0YllEbTV6TklZYzBmNm5TZDll?=
 =?utf-8?B?bEswbzJoTmVKVlYzR2xyZXFlbjczamVQbzF6VysyblRISHkyalVZekZmRU9G?=
 =?utf-8?B?SG5DQUxab1R3NzdQVEhPOTMraDRNbVdjOWg0eE1ZL0JhMW4zQlBocjVGMkZt?=
 =?utf-8?B?bWZYamtlRlYrbXluOWJjczdaMFBUL2U0ZHdYRDU2VkEwRlNrS1l6Zy9JMkFk?=
 =?utf-8?B?Qm5hQTdJM2xQUDJJMlpSNWFVV2hNSDFtN05WaThkK2N3MVZqaXcvdU9LMWw5?=
 =?utf-8?B?VDRJREhlbjRzS1MvcGtWZ2gwQVJBUGhTbWFEcUFYbUJrdzZKVC8wc1o4R043?=
 =?utf-8?B?SUFkd2o4Z0MwV1Ftd0R4cU5BdmJ4bUY3Ny95eVBqVnZWWmhmb2ZwUFNpd2xB?=
 =?utf-8?B?MlpEWWJ3bXNYckNUUkErK2g5SjZTNjlPaGk1NndFclprTXlzU1hUVCtKU1F1?=
 =?utf-8?B?SlhPM0U2bG5oZVl4U0x5UURtTE9Id3c0TElrWWVHS3M0d2tFY1hJR0JHMkN2?=
 =?utf-8?B?dlRRUUxXTjVJTHhPYzUzaDRuWXR2MkJXd3dHZk5MeWc1dE1yaEZsTTF2WW85?=
 =?utf-8?B?VzFwOEJHYnFZOXpoRStiTGxscnE1b2ZoSC9vMDhKSDdFMVR3MFplTXRyNDNP?=
 =?utf-8?B?NFRXTlhyQzE3ZnVIV2Nad3prV0lsekttMnRqYzhzVVhSUmtCc3BMZ0xiZi9U?=
 =?utf-8?B?bFpyQzNyenYwcWZ6R21uamYrMU9aN2owdEFodGVJRmdpUHNxbWw5dEFoNXZE?=
 =?utf-8?B?UDhkNXpKTEV3d1NtaDViYkVIUGNYdStUTmtWTE1qRjBVTDNudkxKcGt3VEsy?=
 =?utf-8?B?Tjl6dHppSDd1V3dJV0d2Ym1DZHlycTEvakp6dEREK3pnSmtkQytTd2MxaFYv?=
 =?utf-8?B?V1FpY3hFM3QzV2pmbTV3STlBSmhvMzNYMTkvYy9RZ0ZjaEY5d0hrWUZFcXd6?=
 =?utf-8?B?UitMTmRueDVMbEhpcWRRSWoyNC9QOHphOEovQnhWQnZuZnFlTG9iRVZJYXFV?=
 =?utf-8?B?dC9KSnBQY2dMRGVzZ0p5SFpPMHJaOGVSUmZyYlVQdU1xN281TkoyU21rdTZR?=
 =?utf-8?B?REl6djlVcGlKNWhYMWtoN3hMWlVTcWVQbG1zRy9oNGxqdTJXMFlYQzFiVXFz?=
 =?utf-8?B?dGxNdjFuYThaT3gxSnhHMElmbCtRUmIvZkFhaFZkRXppdTE1Yi9VYlVCcUNw?=
 =?utf-8?Q?Sn84=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D6CF65C67785C40BDBC998E8063896E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89db2a2-2854-4efc-1686-08dd4cd6216d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 09:01:12.3644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3GWmAo0aikQh5rlhh36wJpEx2lbpMfjGuTC9XECDUNkmGfJYcJl3zofrTs1zwxBBu3nOkpzP5FdqKbeY/KYDSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFC3F406448

T24gMjAyNS8yLzE0IDE2OjM5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmksIEZl
YiAxNCwgMjAyNSBhdCAwODoyMjozOUFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBP
biAyMDI1LzIvMTQgMTY6MTgsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+Pj4NCj4+PiBPbiAy
LzE0LzI1IDg6MzUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxNC4wMi4yMDI1IDA0
OjMyLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+PiBPbiAyMDI1LzIvMTEgMTc6MjEsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4gT24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgMTA6MjI6
NTdBTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+IFNvbWUgZGV2aWNlcywgbGlr
ZSBBTURHUFUsIHN1cHBvcnQgcmVzaXphYmxlIGJhciBjYXBhYmlsaXR5LA0KPj4+Pj4+PiBidXQg
dnBjaSBvZiBYZW4gZG9lc24ndCBzdXBwb3J0IHRoaXMgZmVhdHVyZSwgc28gdGhleSBmYWlsDQo+
Pj4+Pj4+IHRvIHJlc2l6ZSBiYXJzIGFuZCB0aGVuIGNhdXNlIHByb2JpbmcgZmFpbHVyZS4NCj4+
Pj4+Pj4NCj4+Pj4+Pj4gQWNjb3JkaW5nIHRvIFBDSWUgc3BlYywgZWFjaCBiYXIgdGhhdCBzdXBw
b3J0cyByZXNpemluZyBoYXMNCj4+Pj4+Pj4gdHdvIHJlZ2lzdGVycywgUENJX1JFQkFSX0NBUCBh
bmQgUENJX1JFQkFSX0NUUkwuIFNvLCBhZGQNCj4+Pj4+Pj4gaGFuZGxlcnMgdG8gc3VwcG9ydCBy
ZXNpemluZyB0aGUgc2l6ZSBvZiBCQVJzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBOb3RlIHRoYXQgWGVu
IHdpbGwgb25seSB0cmFwIFBDSV9SRUJBUl9DVFJMLCBhcyBQQ0lfUkVCQVJfQ0FQDQo+Pj4+Pj4+
IGlzIHJlYWQtb25seSByZWdpc3RlciBhbmQgdGhlIGhhcmR3YXJlIGRvbWFpbiBhbHJlYWR5IGdl
dHMNCj4+Pj4+Pj4gYWNjZXNzIHRvIGl0IHdpdGhvdXQgbmVlZGluZyBhbnkgc2V0dXAuDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQu
Y29tPg0KPj4+Pj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4+Pj4+IFRoYW5rIHlvdSENCj4+Pj4+IE1heSBJIGtub3cgd2hldGhlciB0aGlz
IGNhbiBiZSBtZXJnZWQgaW4gWGVuIHZlcnNpb24gNC4yMD8NCj4+Pg0KPj4+IEl0IHdvdWxkIGJl
IGJldHRlciB0byBtZXJnZSBpdCBhZnRlciB0aGUgWGVuIDQuMjAgcmVsZWFzZS4NCj4+PiAoSXQg
d2lsbCBoYXBwZW4gaW4gdGhlIG5leHQgMiB3ZWVrcykuDQo+PiBHb3QgaXQuIFRoYW5rIHlvdSBm
b3IgcmVwbHkuDQo+IA0KPiBDb3VsZCB5b3UgYWxzbyBhZGQgYW4gZW50cnkgdG8gdGhlIENIQU5H
RUxPRy5tZCBmaWxlIHRvIG5vdGUgdGhhdA0KPiBSZUJBUiBpcyBub3cgc3VwcG9ydGVkIG9uIFBW
SCBkb20wPw0KU3VyZSwgSSB3aWxsIGFkZCBpdCBpbiBuZXh0IHZlcnNpb24uIEFuZCBJIHRoaW5r
IEkgbmVlZCB0byB3YWl0IHVudGlsIHRoZXJlIGlzIGEgNC4yMS4wIGVudHJ5Lg0KSW4gU1VQUE9S
VC5tZCwgZG8gSSBuZWVkIHRvIGNoYW5nZSB0aGUgc2VudGVuY2UgIiAqIFBDSSBTUi1JT1YgYW5k
IFJlc2l6YWJsZSBCQVJzLiIgdG8gIiAqIFBDSSBTUi1JT1YuICI/DQoNCj4gDQo+IFRoYW5rcywg
Um9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

