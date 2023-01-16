Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7518566C430
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 16:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478815.742228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHReF-0006ow-Em; Mon, 16 Jan 2023 15:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478815.742228; Mon, 16 Jan 2023 15:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHReF-0006mN-A5; Mon, 16 Jan 2023 15:43:47 +0000
Received: by outflank-mailman (input) for mailman id 478815;
 Mon, 16 Jan 2023 15:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHReD-0006mF-6U
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 15:43:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4dab4d-95b4-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 16:43:41 +0100 (CET)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2023 10:43:38 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6347.namprd03.prod.outlook.com (2603:10b6:303:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 15:43:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 15:43:36 +0000
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
X-Inumbo-ID: 8c4dab4d-95b4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673883822;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=egGgxn++pMs3jICn9GuUZ62v5QcxMryKjEcVXGx3rj4=;
  b=QuLer6i7NVpn2vdcBWW83PT1myg+gaRgb9wu2yo25lkfOOqlhz8Q5Yyc
   54PHMYcBHLnDC/OGVD7VSj8FPom6pVTjNnosoWrpdU19lOteedxAiGshT
   hdlttr+SYVH+kIeY/x6f40SihsvRN4JTaT8dM5GS1/XcJX0VVvm+sFCzg
   I=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 92823819
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dUjBG6gHDLTA2KVmPoEjSCoaX161WBEKZh0ujC45NGQN5FlHY01je
 htvXWGHPv6JZmShfNlyO4+w8h4FsZXTz9M1GQtl/yk0FXkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QaAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQXGRYvZzmE2diPyZ3lbLJnvpo7KsD0adZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGybbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReforKU62Qz7Kmo7JTgyUFLk+qODzV+Ga81Dc
 2Me3Qp0lP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRjE01
 1nPg9LgAxRutqGYTTSW8bL8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXI9SrYx
 jmLqG0ygusVhMtSjqGjpwmY3nSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:MAJTDq54CdLURpuz2QPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="92823819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SO8QHTatFmCs04tYDd/QHJVHBMLIrOwP24UD2N/E+3qAjMD7kzI9AqEuH2SGpPfL5jKA4oXHkVm7xw2PJuJntkG7IhwDbjgB5o3l8nOuKVz7aKFDjF5oUkspzyqMK/lmsXq1nOWU6E2DeK8Ku85zp6K2kCBpE2j3zuxs+i43kEGicUKPaCemMQaxfHbKfzjXS7zVm7fjmNGvs9fLKmsyXRnV5xNkE1QZgGtcADZNeNcrP9xxWK2oANi1Fc8A5wfmG63fb5VdjdIBGSvEX3u2yxNJGLqf3yVf/bnd1aP4WxciFgWIYWuKxD2vvXzYzV/He8wCU7DrkOeTRmADzg2s0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egGgxn++pMs3jICn9GuUZ62v5QcxMryKjEcVXGx3rj4=;
 b=mY+q5wqhDydCCBKeBPC8hcb5BzZXgFOgAgLSYILoxr0nufpmwA5p2U+o3/Rp1yIkuRjmZ2/ypIfFGjS/Q1v+CxmalD9T197hMJai/NVZ01+3gm+vVUPIv1wqhLOmWZy3GXjret/E3IssYeo+1KVgt8xhMXPoxmCyaBCVARDsFzDPyr7XL5vp/PJ3qTbw7klD+eGKx6M1pQ4Ch8PeAAeJ0Jq0CEswmDAEWliL+HMjqvj4KVxnbTFFNQgBGb2+qMqIAUhWNn69l50dG+J43q5iq69N0fxsjMxfqMFTuumR6tx3fryenYMTu8/KkRj12HOudzzrvVq94u2MZONsZCXNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egGgxn++pMs3jICn9GuUZ62v5QcxMryKjEcVXGx3rj4=;
 b=oHcSjGIEFzFoMD5oqUw710Kqr8HWZUqkhq+1eouT5urpdr7PxGPrfgNyOBulSyfgpw1SK0UG90zqwzDqg4Y8mjGs2gRXwydfrL+YHmc7OE0QYjt9VezC2G12+9R3fjO716WyiR8vRB1bsq3+eyQdTHzMJbWyLv5P+jxpddbFAcY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Thread-Topic: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Thread-Index:
 AQHZJRefeExwWeppzE65VXS63DgRAq6axG6AgAA9twCABgijAIAAFX4AgAALUQCAAAHpAIAACugA
Date: Mon, 16 Jan 2023 15:43:36 +0000
Message-ID: <ada339ac-f2f1-fd6f-cca6-12a42c49da36@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-6-andrew.cooper3@citrix.com>
 <af2b74b2-8f37-223c-b830-c2bb3bc6d467@suse.com>
 <3ac6a4d6-44db-d248-4440-6e71aa14ad93@citrix.com>
 <adf6f951-a0e5-c167-9739-d8b0a2b4af38@citrix.com>
 <309925fd-1e7b-4541-693a-0296bd22e242@suse.com>
 <a1ffc132-5343-c070-7bda-b3198a1ccc95@citrix.com>
 <ac8d8c62-e1f8-a98e-3ead-e1f3f8a55c2d@suse.com>
In-Reply-To: <ac8d8c62-e1f8-a98e-3ead-e1f3f8a55c2d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6347:EE_
x-ms-office365-filtering-correlation-id: f64ef5b4-63dd-4b26-12e5-08daf7d86ead
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KrnHmNFHfad7akyvbTgRtzs7lbVGtXf6gOy4XRKMBH7IC8bFLSznCJkIRfLhk7epq1Svxet63gZ3gANPmbg0CIRzMl4rwQyhUrVXHXBR/wBbRhRUkZrKvpGg1+LL9Ji8QB3CDlwSuVrSQXK9wGuEta/aI0jiKhG1NFDtG2pESGPHVwH7B90ViH+viPVnoyTZjph3EFy/ixAkq1wm28Of4tjLY5V8ADFxRZnTgSncaH1yovUgNwvEZnGwITNQZxlAVy1RDNpbHdilqZVREN/zkUjeZNdJLczUkeZfWE79D+xdLhr2+kkZQL/UPiYMARYlFQGuG7RLuMqZHg6SjBjDWS4TwNZSuolqUIQPAIPpfGGpznfvZokwsBdU+sRPcPeRGz8a7739XBXb2WxclyxSWZ7sxoUMCK25++yQSkzPW5xvZMvK9blVAJSXbn8yPfPiyEsfhiSaj0WUZh68chpi22gmIoOOne7x67z2SHX8VXWbPoy5MDVDAoMmciQmQrNXL5OxLDvH61ES2uXl4WoD17GfmTHmw5oO3wq+OUOPCehMLNJw+SB594tc5I4dHX7cC9ZcieksJkBGIdMTaRRJf/HiHbodNBYVCCxgE2XUOJs4nAJjmu1nJ17DmigNzyVxz27gfT+OzHxkIP1InYz3hQPUhwb54FKOwAiipanwJ9JcT5cuy8G2ftrkyAcM/gKj7L1Ya3ysfxSBOiLatxODyS/qIY2UPJqgIbbcIjOIsEozoGvnXJTO5pAbFQ20MNQ5dMofyA3fsznN3szGT+0Sbg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199015)(122000001)(82960400001)(91956017)(6916009)(4326008)(66946007)(66556008)(76116006)(66476007)(64756008)(38100700002)(36756003)(86362001)(31696002)(71200400001)(186003)(316002)(38070700005)(66446008)(478600001)(26005)(8676002)(54906003)(2616005)(6512007)(6506007)(6486002)(53546011)(31686004)(8936002)(5660300002)(41300700001)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmxsOTVRQ1JYRVhEUHkzRkUvV1o1K2lBN3pXNHEyRTZOODh5RFJCeFRERlpU?=
 =?utf-8?B?Wnp1NzFIa0NuaSt4NUlEVHRTUzMvVW93dkJTVWlhZnlEc2ZIREVwZVYwS0dH?=
 =?utf-8?B?cXRZSUExOFdlenNxVlZUQU9BT3h0OHhucGpGN1cyOFpSNHJFc0JJOW1tNjkv?=
 =?utf-8?B?MjZKVC9Rc1FWektZOEN2WmpkUW04bXU3VTNQbUk5M0cvaldqdS9xZm5lM2Ns?=
 =?utf-8?B?SHkvalptdlBlelYxQkxWYVdkb2wrb3VJY2VZQlFybDFRalV0VVY5dFpSb1BI?=
 =?utf-8?B?NTVHTkFDaTRpS3Y1cTBRcXlqTlRDbUJqMG5wUlRGcW5sY1RYK1BxcHQySHV2?=
 =?utf-8?B?VHErZ0VkWW9SUm1ob0lxYlVWMWN3UmFnY3ZlRENRUllReElWRGE1RzlYOVlU?=
 =?utf-8?B?MWlxeWp1K2dYY29oaFdzSERMbkxYS0I0Z1NyczUycW9Nbk00SEtEeEhUWTR5?=
 =?utf-8?B?MWRHU1BsN1Frem45amVJTHhSUHNKc3Y1VTFTeHVQOG1ERVZ1Q1lvUkp6SVZn?=
 =?utf-8?B?dXYyenVOWldvSXhOVzFGY2gzY0JZazNNVWZYQWo2NDBONzZxMUwvSUtXUmll?=
 =?utf-8?B?Y0EvdmVUL0d6ZnNHc1pZZjNrNVArRGZEekdkTUhQdWFNWW9pbkRvV1crVTdR?=
 =?utf-8?B?dGNOZWVVdTB0Z01DV1NQc2o1NHl1ak9rS2I3Y3ZoZVRteGE2VE1aeTUwTGxL?=
 =?utf-8?B?bmhab01xZTVKVEFkUzZhMDJRUHhIQnNjempTb2lxS0Iydk53RHY5d05MMHFF?=
 =?utf-8?B?d094NVhoTUpmUGxTRWFIdkJCeS9vcGZvdkpsVU01ZENxUVJRSG9XVEp0Tkto?=
 =?utf-8?B?eGkwSnpOUlUyOFk2T3BoZEdXSXhZcGduVE4xQlZRVnRiMktKQ3M2U0M0REpD?=
 =?utf-8?B?Y2xCMEZ6OTduc3ZXYXU1TlRmcTBLNXRrODBOenVheG5XN1pFaUdrWmdFRllr?=
 =?utf-8?B?ZjdmVnJwOG1ZTlJ1eFBoZzJDOXFCeWZUSlZ2RUx6UlgxMTJoTC90S1Baa04w?=
 =?utf-8?B?b3BnS3J3L2hUQk95MitKZ3hodXI5ZkNpNlZ6NGJtMFpYSlZuVDBaUnprVFZM?=
 =?utf-8?B?NzEyaUJya09ya3lLQUxjZElRVkUvbVo2Mk02Mnp5dDZBejVqajBJc3gya0Ev?=
 =?utf-8?B?aldKcnBoZFcwSUljUG5WZmFvVnpjK09ZeVpmQlJxY2RaNGdwajZEUFl2L0Fx?=
 =?utf-8?B?ZXZhR3EzTGdJS0hBc01FSXJQNHQ1Yy9kakhwZHRpOFdoTXIyK2FXV1IvbjQv?=
 =?utf-8?B?WVF2NDltWEdpQXI2Q28yUGpobExkRGl5UWlEVGEyL3k2cTk4ZEExcFdjYm9E?=
 =?utf-8?B?QW1CYzdCVW0wY1lCN2FJMTdoTWlmUkRnUmY1emxlTXZpeGxOYTB3QmlJdmVz?=
 =?utf-8?B?akd6eWtrRFZHczhHOWRTa2ZUZXhSTkFKTjlkelNtQ1ZweWlkYlNSRDlaMlJ6?=
 =?utf-8?B?OGh2MzAyNXIwUWJjSGhhV0hJU0FaYVFrRGltYkkrYzlETkM3bTUrTVFWa2Vo?=
 =?utf-8?B?Y0ZXdHF1YzAyY0FDdkhJNzJxVTVVbXFlYmk0ZEFSZW0yYVkwUmsrd2pibEVL?=
 =?utf-8?B?cnYxSEZLclVEYWZIOUZrSzk2cmVsQ05ESm9Uc2NYbHRYdVJNaXlza1BSenY4?=
 =?utf-8?B?akVkWDQvakNjODJ6c3I5NGNFTDFkNUhscEt1WDh2Y2VPK0Y0cTVaSjcyVUwy?=
 =?utf-8?B?T2FCRmRpUmRRZDBXM1A5dytCbnYybjREcitXUEpTdkJETjZPdjZrNmpFcGdR?=
 =?utf-8?B?eG9BT0lGTDVpZVB1OGJLMW9CUlNZTkpJU0Y2Rk9IRVNlajl5c0hmOWxzbjlx?=
 =?utf-8?B?anBEb01NUmdob3NWYnhJRHF3akxZa0xtUG0vSUtqVThFbzBWNUZHN2dTUGV1?=
 =?utf-8?B?NHM5bnpLdzhidTFIWjVFcWE4Smpnb0QyT3piVDA5Z0FHRFE3S0Rua1FvMnlm?=
 =?utf-8?B?WmY3RkZ6cno0TGo3N2ZRMytuN2twUEtlUDlTY1JpK3llWUkxZDRvNFhwMGgr?=
 =?utf-8?B?SVJwcG9GYXRJNENTc255cXBHYWNZbDh5ejlGN203R0FUVnNYczNTYzg4ZWll?=
 =?utf-8?B?RU1vWnNpemFBbDhkMjlqTGRUbnorcmI0enl4TzJwVUx6ZEsrUWZzZkFPZnlX?=
 =?utf-8?Q?6hOLxeVz6iruG/ktaX89IAUZI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D069026EBB81A4DAC1C7A9E2A1633B1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mk+DFgyZMzKfJaZ8uWdCuqBzN8iZRfJ+13mtfK3ETH9YcSOVM2K13GfPmiDDjCZAllx8X1Zq7C24pJ6StXJR+HKqBTGGpwCCYLALezQp4/H4QPk+TPzaxnWZVYUvR0csrfNjeOkiw94ZczQKG8bl0OpU3TxhkuOc2x+CxpBNrG9taUuNx4qidDaUbyhJNn1tEYs0UgoLNjYJFp1dGSodbk74y88/R9rXPgykul321UwD3KIV2mgDD70IsspNqpGanJMwHIzzwOUqQf5TecfgI9X8G1FM2AOW2aup+fJ8SVsy9yPavJXsHxAA/XtD8K9OjdeQD3vDl9oxxXjJHlAkZDehc3uEkxZjY56c6e2PjxiWbO79GsRlP/BXbBbJZYNuICXQsJ2Kunzot44vlhsU9KXiqaQLpb/k2WiPWBCSS1IXX5M6brsiKSNlW702e0b9OLk2+JnGmf359CMCKSUsPrKRBjBEFEPNRXDb2CfOjEs/RHfdZR1GXMYHc8TcgJfbv/31zR/hItwO1qlB6AShElzdiMeIPKvcW93g2JhvYQwfQn5m8dtrjevnWeZYrRSUfQaLO1JNHRQWBlwRskoPFsjsQFaFbC8Ni5Zhf3ZmAzqIO9PSMfsDt9q960Aoyoq2m+sE3ieOMB3YzGGALwHYx9ytHF8XKyd1v65fejj8YK4PxTKZr9q+5Me8aHgqcmOpuqF6iQU7sO+QhFEio9IzTyvI7Rz+0XeubRpFf/zUrFl2IBvPcp0ifHd9bKphVJ6LBAnvRnLOqYHcIgwr5hUzYA6KEskjArPTZerxpk+8F5ss0vVZ3iiMWsaxW3vMVHbQpq315/jUVAQMOdpiZJ/DjBSswigJTkj2CCMQXyf0b28=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64ef5b4-63dd-4b26-12e5-08daf7d86ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 15:43:36.8023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gG68dFJkCpgn1nbCyXYeNoGQTEiUeFcl6brHW7fMmkF2fp76V1qVS+HdzDsX8Dt+7SkWTaXFUitNJ9p6/ngfZDVnV2+8ixluVhfS7w+l6bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6347

T24gMTYvMDEvMjAyMyAzOjA0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDEuMjAy
MyAxNTo1NywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDE2LzAxLzIwMjMgMjoxNyBwbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTYuMDEuMjAyMyAxNDowMCwgQW5kcmV3IENvb3Bl
ciB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYw0KPj4+PiArKysg
Yi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jDQo+Pj4+IEBAIC0yOTksNiArMjk5LDEzIEBAIHN0
YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQ0KPj4+PiDCoA0KPj4+PiDCoMKgwqDCoCB1
cGRhdGVfbWN1X29wdF9jdHJsKCk7DQo+Pj4+IMKgDQo+Pj4+ICvCoMKgwqAgLyoNCj4+Pj4gK8Kg
wqDCoMKgICogU2hvdWxkIGJlIGJlZm9yZSByZXN0b3JpbmcgQ1I0LCBidXQgdGhhdCBpcyBlYXJs
aWVyIGluIGFzbS7CoCBXZQ0KPj4+PiByZWx5IG9uDQo+Pj4+ICvCoMKgwqDCoCAqIE1TUl9QS1JT
IGFjdHVhbGx5IGJlaW5nIDAgb3V0IG9mIFMzIHJlc3VtZS4NCj4+Pj4gK8KgwqDCoMKgICovDQo+
Pj4+ICvCoMKgwqAgaWYgKCBjcHVfaGFzX3BrcyApDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3cnBr
cnNfYW5kX2NhY2hlKDApOw0KPj4+PiArDQo+Pj4+IMKgwqDCoMKgIC8qIChyZSlpbml0aWFsaXNl
IFNZU0NBTEwvU1lTRU5URVIgc3RhdGUsIGFtb25nc3Qgb3RoZXIgdGhpbmdzLiAqLw0KPj4+PiDC
oMKgwqDCoCBwZXJjcHVfdHJhcHNfaW5pdCgpOw0KPj4+PiDCoA0KPj4+Pg0KPj4+PiBJJ3ZlIGZv
bGRlZCB0aGlzIGh1bmssIHRvIHNvcnQgb3V0IHRoZSBTMyByZXN1bWUgcGF0aC4NCj4+PiBUaGUg
Y29tbWVudCBpcyBhIGxpdHRsZSBtaXNsZWFkaW5nIGltbyAtIGl0IGxvb2tzIHRvIGp1c3RpZnkg
dGhhdCBub3RoaW5nDQo+Pj4gbmVlZHMgZG9pbmcuIENvdWxkIHlvdSBhZGQgIi4uLiwgYnV0IG91
ciBjYWNoZSBuZWVkcyBjbGVhcmluZyIgdG8gY2xhcmlmeQ0KPj4+IHdoeSwgZGVzcGl0ZSBvdXIg
cmVseWluZyBvbiB6ZXJvIGJlaW5nIGluIHRoZSByZWdpc3RlciAod2hpY2ggSSBmaW5kDQo+Pj4g
cHJvYmxlbWF0aWMsIGNvbnNpZGVyaW5nIHRoYXQgdGhlIGRvYyBkb2Vzbid0IGV2ZW4gc3BlbGwg
b3V0IHJlc2V0IHN0YXRlKSwNCj4+PiB0aGUgd3JpdGUgaXMgbmVlZGVkPw0KPj4gWGVuIGRvZXNu
J3QgYWN0dWFsbHkgc2V0IENSNC5QS1MgYXQgYWxsICh5ZXQpLg0KPj4NCj4+IEknbSBqdXN0IHRy
eWluZyB0byBkbyBhIHJlYXNvbmFibGUgam9iIG9mIGxlYXZpbmcgWGVuIGluIGEgcG9zaXRpb24N
Cj4+IHdoZXJlIGl0IGRvZXNuJ3QgZXhwbG9kZSB0aGUgaW5zdGFudCB3ZSB3YW50IHRvIHN0YXJ0
IHVzaW5nIFBLUyBvdXJzZWx2ZXMuDQo+Pg0KPj4gUzMgcmVzdW1lIGlzIG91dCBvZiBhIGZ1bGwg
Y29yZSBwb3dlcm9mZi7CoCBSZWdpc3RlcnMgKHdoaWNoIGFyZW4ndA0KPj4gbW9kaWZpZWQgYnkg
ZmlybXdhcmUpIHdpbGwgaGF2ZSB0aGVpciBhcmNoaXRlY3R1cmFsIHJlc2V0IHZhbHVlcywgYW5k
DQo+PiBmb3IgTVNSX1BLUlMsIHRoYXQncyAwLg0KPiBBbmQgd2hlcmUgaGF2ZSB5b3UgZm91bmQg
dGhhdCB0byBiZSBzcGVsbGVkIG91dD8gSXQgaXMgdGhpcyBsYWNrIG9mDQo+IHNwZWNpZmljYXRp
b24gKGFmYWljcykgd2hpY2ggaXMgY29uY2VybmluZyBtZS4NCg0KSSBoYXZlIGEgcmVxdWVzdCBm
b3IgYW4gdXBkYXRlIHRvIHRhYmxlIDEwLTEgYWxyZWFkeSBwZW5kaW5nLsKgIE1TUl9QS1JTDQpp
c24ndCBwbGF1c2libHkgZGlmZmVyZW50IGZyb20gUEtSVS4NCg0KKEFuZCBldmVuIGlmIGl0IGlz
IGRpZmZlcmVudCwgdGhpcyBzdGlsbCB3b24ndCBtYXR0ZXIgd2hpbGUgWGVuIGRvZXNuJ3QNCnVz
ZSBDUjQuUEtTIGl0c2VsZi4pDQoNCn5BbmRyZXcNCg==

