Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B43AC84B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 11:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144390.265764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBHm-0001vV-33; Fri, 18 Jun 2021 09:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144390.265764; Fri, 18 Jun 2021 09:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBHl-0001tf-VM; Fri, 18 Jun 2021 09:59:37 +0000
Received: by outflank-mailman (input) for mailman id 144390;
 Fri, 18 Jun 2021 09:59:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luBHj-0001tZ-ML
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 09:59:35 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6053c5cb-444e-40d8-933a-def7f51cef72;
 Fri, 18 Jun 2021 09:59:34 +0000 (UTC)
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
X-Inumbo-ID: 6053c5cb-444e-40d8-933a-def7f51cef72
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624010374;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N0UYkNiivjKlqvSzIpY1cnZ/WzS/V01fIIPrt/1IO3U=;
  b=iD+Y4ZItCTOi+RFSY7LvQJt06j/EZW3sNW4QvFbEPqNUFv8zBL3SZ3Uc
   AuDcyRKxx/umNAdeFhLec2n9v37FH2vnqLesYdQGSFbUxJBbHl7SFSdUH
   FVbfUsaheBkYltfFZBoC9MgJ9KLN6dHvt9oj0fbWLmNmoT8rmIph33f1X
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: x4YwpES4OrPQgYeY9n/Ihf+L7nS6HXf4D0fUGqkZzxjLPubTtwd34v81Zq3JPGL7hqmbyXaa/7
 rCJjsECXPemkOreVhHoMezWO3RVYa28OyrY+wlSzgwWnK0mCjgtFS0Z3uFPupp40tRuNjRppcl
 80mThPTlyqUXfBp8oVzh9ocr+uWNBLesGJPtdjVHCTCAo/LILZ0gtaM/m8+P3Ha2KeO/8iyKeP
 G75zkfKLkff95Rpf150LUxnvAqSIRZmHiz3yKrXbazhuHibY0kxmJyW8kVPs0mra+Cb/lbdtvA
 uak=
X-SBRS: 5.1
X-MesageID: 46173512
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UlEZIaDF+O2bHdvlHemJ55DYdb4zR+YMi2TDj3oBMCC9Afbo7/
 xG/c5rqSMc5wxhPU3I9ervBEDEewK7yXd52+Is1NSZLXbbUQmTXeVfBOLZqlWMd0LDH6xmpM
 BdmsNFaOEYeGIK7/oSlzPIcOrIruPnzEmvv43jJjxWPHpXgulbnn1E4yigYzBLeDU=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46173512"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQWJmDfa0CrUTQ3qQ7+LaYIMauNau9v0qnUKefYTXZ7rmbYIE283TY0JYUVAl+74Q1B28U2b4i1AIHgVfEVdkp80SXXO3BJVIyvgr6ESKTkm6p4vjcFfV35KRPxEG40kxTmClshP3+5YhWFEN7PaETKzs9MvXhlgHlunCXZqlfKoH3w5tLugfiNhYDfEM8dsDDSRrCfNTWnw1+ayRqJ4X8HThcgzkekWttgbtV7p6ARd3tO6rKf0FCg1pxMDBmp/Km7thMnpKywua7rZZrdjirnj1JxEai48a8h4iWJgr4IFUwByevHECvPYmcZdXH0bOf4K0V4iLGgnEaG5qVF9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0UYkNiivjKlqvSzIpY1cnZ/WzS/V01fIIPrt/1IO3U=;
 b=HDDY5hOmUD69nLY/eCfzlY9RsYaZOX446g8qMJk8C/i0YXYBf1utiX9vcFrwQVlI8iCoQYs2R7t34n/O6mR8Q/1EKsNE1ZP9UlxKxv5/TxPw3yYM4mrq8chKxS0BmEbIyyfgSJiSAyhqpwA8CiWfkI32RUs+D36URMnNrTyMd/gvMkTFRySe9EiRfTghW7hPKFSw70OQdqvbeUvtPkpR3gegbeBX59bKNst6Xp5aku48E1W3RNxIDTEzTdHQwL5ag25bryqnVR5pU19CAeJruQu75gPQnPAj22jyHYmzinBrnv68RqYI/qSPsqEub/s8fZVKn94UvUZ9ulWgC3qJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0UYkNiivjKlqvSzIpY1cnZ/WzS/V01fIIPrt/1IO3U=;
 b=D5W4PM4JFEHLVmSWWROa8JbO6wRhxi0DJRC/BkEieeptKjxdBBFcJ+XvnfPVbeTMUgL8o4r+wtf6QDcNlitZQJ9cNJk7fwvWP+PZMWDJP+CldaRKl9QFYYjWvBL9hbagx8LHOAV0VACO7SzeoW6T7REhfIS2O6J/WnNvAIgUkhE=
Subject: Re: [PATCH] maintainers: adding new reviewer for xsm
To: Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <20210617234955.18489-1-dpsmith@apertussolutions.com>
 <alpine.DEB.2.21.2106171712010.24906@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <635b99e9-815f-edbb-52bf-dd6465bf16c9@citrix.com>
Date: Fri, 18 Jun 2021 10:59:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <alpine.DEB.2.21.2106171712010.24906@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf8f80fd-66a9-41ec-8c44-08d9323fc47d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5870B86BEED58D7258A1EBB6BA0D9@SJ0PR03MB5870.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vKPehqYNQfxfnIcEIh4HQrorLz9W88IezWvwfYprhuPVyfeRkskdeAdlFY9lIxsE3mzF6lV8PepRkE0q4I4G8lUfrnOJtJXuxFmOIGCEKF7jnXA4iAFpHZlHcwTs7+hZ67jmQHUbniREhT+0heURxOpxssBXqI9ZZk/j/uFsp4Hwh9ghxWWOyC3bnejtKJKTHv6GmLn1eMhdC2mM0Jguvs59ZZHA6xMkGibuYBF6T8jpNpxJ7dT3vBQHC9727DFlp0BqCnWN6E8Ej89aBoW6+Fvi7eCllFnCLnw1kj0U06+tGpSi5iwJYiTrwt/vhH8uHP3YzJ39HieidX+D5JHHG/b1mqtaVkeaTSy+p5xSlelXwq4ueJBAZnCBaOzpdSN+8acf/D7CY9gepG2duyPOOPBTrwH7ymh2vbJsvcXqKqK/Di2VngigqWvsaVucQH1I7/jYHWfjaQfIBc8WWELqNFoimfG8UTlUomF+sn868gqNkCWLMH7nBI/FzoYFLV6w2fAYFNhvkB6p9qzVfTATNL9nywmdTMscz9UmfOWRQ2xnRn4BIjyecXgpl1FKB/r+IDS5Te9+l15b0azP3euZcGTJT3azDsCccJMBi7ejMcrFkpVGV8nuvzjyY6SPupCK7Vn3Tva5y5/3kBpwVJAAy+n8Mh6y8sGuQBS4sKRanGSv5jEfaffWvgdm+SNWPpF3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(316002)(66476007)(4744005)(86362001)(66556008)(8936002)(31686004)(16576012)(54906003)(4326008)(36756003)(66946007)(110136005)(956004)(8676002)(2616005)(6486002)(478600001)(186003)(26005)(2906002)(38100700002)(6666004)(5660300002)(31696002)(16526019)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bndDWkRpck83SDNjbUFRaCszY3Q5cjJKd1RkUVhmaEkxcnpNL0dnSHBNSHE1?=
 =?utf-8?B?Qjk1UXl5cEtqZml0Tk93dWgzeW1WUUdoYTdkYVpDZ2NwQmY3VTR2Mnlvb1Av?=
 =?utf-8?B?Z21xcjBzVGpmdGExMU9CaE5pOU9WYUNUeUFCUVJqTGo0bG8yb1N3UVN2N3p5?=
 =?utf-8?B?cFYyV2lpb0hLV0VzaC9aZGlDazcvNmFpVkVUSk52SjVSSWJoTjNzYnhzTTZl?=
 =?utf-8?B?MGxUQ0pLYkZaOVk5eUNseWFvRkw5SExFKzV2UUgrRlAzdENtQXZUTVVqM1BT?=
 =?utf-8?B?aFB3NUp1cG5tL3hQVUZmVDhqbGY1ZTFGTGt0b25jL1FnSzBaTTZVamM4QTlp?=
 =?utf-8?B?d0I4UVR6YTJTMndWblJscE5kMzhpYkVScUQreWd5VjROSEVFemx0MWpCZ3k2?=
 =?utf-8?B?cHB0bjcvam8zWWdoMTgyL1VmdzBwRmlqdEgzbWpuNXlsS2NGcjkyZXlIR1lY?=
 =?utf-8?B?VjBTQU9FTjM4cjJWQ2kyNlhxOWNpdkU1OUpwNGo5dDVUNzU4MnJsRHlsc3ZP?=
 =?utf-8?B?aUZ6ZFNLTzErbzBLT29Hc3UxR0l5eGhhSnJLVkkvVHlYaThuZXVVdjluSHJt?=
 =?utf-8?B?QTgxNkpaNDNuZXBsT1RWRFZjNktoNGo0OU5YZlhWRnBUZElIL0EzQ29rVDBy?=
 =?utf-8?B?K3FKT04xZld1dlhOaXNYSVVnVkFteHJ6YXZlNjk0NnZtOUF5VDFBa2ZCditW?=
 =?utf-8?B?ejVnRGxUenF0TWlSeC9yeDVxWXZmaUYyc3hxWVpkc2NDSnU3YlZhd3pmb2pt?=
 =?utf-8?B?YUY2cHBzRWsrcjNHM3FiendYYVJJb21OK0szMmRPWktraUZWeFlCRHl1NTFu?=
 =?utf-8?B?cGhWQUs0MDFOaHd5Nm5RcXhuaUdwKy8yNHV3MkxSL1hOWXJYeFh3VWVLMXRy?=
 =?utf-8?B?V1pYMVVsdXBWdjFwc1FhbWxYZUMwNlpjc25JSHdUMXV5eEZrRmlON1J3UzJn?=
 =?utf-8?B?NjhZbkxyOW5QQkJjVS9vQUh5VGh3VEhWL043UHM5b0M5aWlISUQyWGo1clBD?=
 =?utf-8?B?REJXclJiM1pIVlY4Z2JVYVRmQXowbzdyR0VMZ3JTUEhvZWtyS0xrdloxNXBo?=
 =?utf-8?B?YnVnS2FEZDVDaGNtbnZ2ejVPMEhRcjg5SUo0ZXdPQXJSQUFERWpLTEI5ZnRM?=
 =?utf-8?B?SHpkYXQ2NWVQc2phaDBydjZpQjlaVmVFK1NmSGdxNEt2TzJGRnhwKzM5cHZp?=
 =?utf-8?B?ZElPekFRYVliT0NZRm5IRWVKM3FpK1JYb1YvSXNub0NsK2ZzOU9qMjFyVXVS?=
 =?utf-8?B?azdFU2xNaElwZlNHaC8zMnNENkpEME1TU3JyRC9Zb0s0cW5ueWJzVmlmWHE3?=
 =?utf-8?B?Tk93cHpucWF3S3NkTXJMSFBSQzZGUVhSRnN2SkVHd3lDZUg4SXBwQUQzVDVu?=
 =?utf-8?B?QzlmSVdQOGs2NFhGc1BCbVo4YjVVYnNtVzdFRWNJbzYyZXk4eC9hZlNHb0w5?=
 =?utf-8?B?Ykc0U1dMY0dHY2twZ210cGFNUk9rTXFkRE5mRUxPZjlhdko1Rms2TzhkanpG?=
 =?utf-8?B?MHNueVMwY2pYbEtlbE5RcytXby9YemFiK09tY0Y2U2ZyS0VUVVZsUnVuT3J6?=
 =?utf-8?B?M1NwSWhtemZRV1BlYnNhZGl2T2NEdjVydWpteDlBc3I2RThtMXQyazkxaW1C?=
 =?utf-8?B?RUdMNnJsZ0VFakV3aDFDdUdwb0FCd09tTHg5clpFZ0t2alJBSk5aZzkrKzBk?=
 =?utf-8?B?T1RISU5oSmw1cVBYMmtZU1c2dHpkQkl5VlNPeEZUdVpEcnhkZ2RpMkEwdG5R?=
 =?utf-8?Q?GL99qpPojZMYtbC4/ajQBm09XzncZkPUPG4XO9C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8f80fd-66a9-41ec-8c44-08d9323fc47d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 09:59:31.1865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rol/0/Q6pBvEZ3bYPwuUTrm3lImW5CRrLHeR9Ry91ELTuaCFhCgzzpGboF6mmt4rrn3ebWlBUEtHAGiNgs52SZHhAjPYbl88vzieEZRP8+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-OriginatorOrg: citrix.com

On 18/06/2021 01:12, Stefano Stabellini wrote:
> On Thu, 17 Jun 2021, Daniel P. Smith wrote:
>> Would like to add myself as a reviewer for XSM.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

