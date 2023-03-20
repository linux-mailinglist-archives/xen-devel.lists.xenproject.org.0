Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C12E6C1903
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 16:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511977.791470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHRy-0006zi-Ik; Mon, 20 Mar 2023 15:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511977.791470; Mon, 20 Mar 2023 15:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHRy-0006xy-Dd; Mon, 20 Mar 2023 15:29:30 +0000
Received: by outflank-mailman (input) for mailman id 511977;
 Mon, 20 Mar 2023 15:29:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peHRx-0006xi-PB
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 15:29:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0018db96-c734-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 16:29:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8879.eurprd04.prod.outlook.com (2603:10a6:102:20e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 15:29:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 15:29:21 +0000
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
X-Inumbo-ID: 0018db96-c734-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bsl1RPgsPprnc9mBxD6sZRz4caoSLb3hMNS2UmaGg9bi56+IM/BK4XAdByKc02ysYCVgnfjgTJrZmhbcCPd2j4C3QNs6BX5PRJ6Kp6w5h7/bcaEeRhm99ze1Qqwz9FIiwU1iz0JA1cKHBgLAVEe/zdvSyvJMxZFgTiXLyczgrcRd2BvtGpL+LuHeWMeTkOhXtt25RktXn3MHQUiZeCC+K/L+0SclXX+MIbIPmgmIX54ZxhzvrxSpeO8KpgSLIIpn4NMBGWlVPAW8KWKxp3INJxhD5hFNqH1xpFgSYeQ1f36fw8cXRRQBzpqB/aND/o8bwVFTDzZUXgmzHBBu5335sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/YNcxkdmj2cYMt1tizAh8QzH4XEYfIO9XVNzW1J/f4=;
 b=KmSckM+8zUUmt3RdrLzOxWZiXfPS+xUK/JfPyAL18y7EHBeWhWv/k1+QJbhKaTrWkBZdJe5Bn6/oNHcZOO26klKaeqa4dpcmi75pcFW3PWdYeZuVvApRFfrEefyE+fgFERamb9ZguYWBk0GONJxpzoLqAS6x3j4936Qaz95V5c0F7v6d+BbChqUgHpzLuIJSQK3a2+JuJx6LanSmcO3kqubQFAoUMp4QcFHnnUbNhdC9RkaXcA/gioLiRYRA18bw2P0NqsQIwQmmVOLCFPkaMa5Z5k9BKLJaCzrtRncORDYAdZFJYSjBkm2A/960Apu/wiClvCrAs6+NdwdNdn4uTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/YNcxkdmj2cYMt1tizAh8QzH4XEYfIO9XVNzW1J/f4=;
 b=3aCto92fg5MbDjVnPcky8T7UwPZ4YG9t0aACFnAwAVVm2Rdul8zihISOLjz9GceeoXwN1berwoEyHLNh5lJx2ka5Cim/uomHTOxBM3OJQ90o+mgLIW2gIj3l74so+fVVTM5zvPvCsbVClSgfu5mneNfcO8hBbzM2nKxq5GLokn3bcsfjsnTGRDd/7y9md2tgeuuTHHdCEsCaqCEnk/OtTMp2q3z7oLUtjKa3nvA2fg9r4v+7QNZ10Sy110cNkQmE/l7XJ8xVxzyEe5lkouW7kV9ZgJfaB9mO/PKL0lPEBAbOAewuW1kHh6IxC6WsAKG4fTPyV4Fk2IJ3EdXekmQeFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f62de066-d17f-f513-9eef-73615ebaf645@suse.com>
Date: Mon, 20 Mar 2023 16:29:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Huang Rui <ray.huang@amd.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
 <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger>
 <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
 <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
 <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com>
 <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171115320.3359@ubuntu-linux-20-04-desktop>
 <ZBTEBkaI8q/mrJmv@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171346410.3359@ubuntu-linux-20-04-desktop>
 <ZBh4w+hDajq06BU6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBh4w+hDajq06BU6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8879:EE_
X-MS-Office365-Filtering-Correlation-Id: 42467c8e-3a05-46c4-0931-08db2957e0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HlasHkZ8vK1MJj6iOU8pmv/jf5571KGE+GRyx9RJIqPXYeOC0sNxFKYvPW4N/g+Co4UCeuD477eqnLrqlKycL3YC+orUJ3kqGdLE1QiEzKpa60FR2gDFxmOAbmB1YYm/n5HVdcx44FomuDpItFmYNS8aM7g0ly60G1atY3c14I78vsGgYai9Pp4yMlEmsuCibelNuZvu+74XX0bf8H5edQ7DWycYz00VGHw4Ff3pvTMvfy9rII7Umu48xTODLpoEgP9wy/Zw8VSm2R1bkKjyUfX8p83ptaypoy4yuaS2c2bMIJtDhIVzlZwplOJHioe9wTmUgCrVAoKe24Bq1oJ8sPc68s15qX52HHQxtf6fMENRoLwAuhwYH9flxWTK7K5JoNqA8Jma1g9u2WVqwmh7wbctdlcIO3dRonO6Hc8eWv8ubiKkh+PjeWqWLd5GMUnjnRycye1q2lWiPcaAiPXjNHkAQZFwe3meLevA4JgVH9/o6BrNrZoJBfmZGH48Ba38wvN7dojcKIOYQuW1YhVZx1QseEcOeQ9C3XM5qNFEIwn8vbX69qkzUvY5H+6Xmf+EvUBWn58T2cNgPdPlueft6LVteIFCLJWwB2XHo3N/HQJH2WWEF6II8RpIx8dNUexEYPX/qpU4Cmm//5RN//Y1e96WiuMkCwj8QMTClTOHslreU89e2hNXxYgo6i5BZhlsm5QdcCzFf81JmiiAVciQ2o8ZXzaWwzKlDL13mo+gGy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199018)(83380400001)(36756003)(6486002)(54906003)(478600001)(2906002)(4744005)(7416002)(5660300002)(41300700001)(316002)(4326008)(6916009)(8936002)(66556008)(66476007)(66946007)(38100700002)(6512007)(31696002)(6506007)(86362001)(2616005)(53546011)(26005)(8676002)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE83K2hrb21nRVVlT1FCL1d0aFBUd1dTTHFRRENRN0x3endPR0VxUklIUDho?=
 =?utf-8?B?U1F3Qk5ZZHhKanRvZzlYSlZ3U2czTy9RbFlQaC8wWTJLM3hqcFFpTHRaUnA2?=
 =?utf-8?B?RHFrVmZRU1AvUlNNSitsMWdOSmUzYzRJRitlVEEzVHR5Uk15M0VQVGNKYS9a?=
 =?utf-8?B?SVFiS282NEJndkNqMkcvbmhZVXNabjc1bGVseWhHeTRWQ2FibFpmUVUwN0sw?=
 =?utf-8?B?MFBKUjBDTCtOcitsZXdocDlQRTlOOGgrT2FUWjZnNkNURnloZWFjMkRJUUFG?=
 =?utf-8?B?T25lZEViODNSMm91TUdsOHNscDB5UUFxY0RjOGZyYVZxaGR4VXA5VjNBeFF0?=
 =?utf-8?B?RysvMjdLRnlCNkR2MFhGVGhXT0JqaHRqOFI1YzRUUkxPNkx3bU1CZTUySk9M?=
 =?utf-8?B?Z0pDcHhNWEdkM29Nbk0rM2RIVDVpV29Bb1pmZUtSVitvNjBab2lWWFBUZ09T?=
 =?utf-8?B?MllIeEx5cDZrY0MxdDhTdlBVM3lzTVdFQ085b3FTMlpGLytweTlNTzNkdENi?=
 =?utf-8?B?dHQzSFArdjZLZWd2a1pBaHY3NFd0Zk0wY05zS2VGK1JRd1IxVEJaYTFTWWh2?=
 =?utf-8?B?RXk5bEFpOTMyYnVZbDNIS2RxUEhTUXlsRm9YQ0pTL2ZXM0NjVldxeFJDUjk5?=
 =?utf-8?B?dFVvRmd3L09RZHN4aGM3UW9QeGpsSkxHNWN4YzBGMVVrYkNrUzRhcjVWSnBh?=
 =?utf-8?B?Y1dJVkN3NU1uaFhXWkN3SmN6TkxjVExCcnJnaDZZOEpOV0Z3aXp2N1JYL0N6?=
 =?utf-8?B?SWZyNnBQSHpsbCs5U3dKa2RldDVyK2Y4cW5DV1Q2Tm4vZHNMbG5ocjRhVkVi?=
 =?utf-8?B?RmhRMUxwUlJHMks3M3BpdXBBbUtSZGpCcTJSMDZxSDY2QWlQbXdkeCtuemZX?=
 =?utf-8?B?cGdMTGdhVzRNYWpFZWZkRTlsV0x3YnJlbS8xYnhaRXEzR29iRUdpaVZXbXJp?=
 =?utf-8?B?bGZiWDkvUFYvZnZGZXFnQkdnSU5VY21YejQrb2JUazFwZE5SaG94T3lBTlhw?=
 =?utf-8?B?anZvVFV3TjUvL3p0L3RQY0JYRUU3ZFQ5ZTY4ZGpValozNWtIWE9xb0lCSW9F?=
 =?utf-8?B?SzF5MHNrcW5nSjNKMW1mQVIvMzVjNm1sSkdKYzM4ZXkyaGJURzhkdDVUN0Jm?=
 =?utf-8?B?MVRuWUVkeEpiVDZQRU5lYndHZXhwdFJZYzhHY1hrM0VKK24yNGFWc0xTMnRO?=
 =?utf-8?B?THgyN2pkT0VZYlAxR1hOZElqbk5rY3UyYlAwbFVLZVZKbzJYUTRESDkrTUYy?=
 =?utf-8?B?UkM4L0xnU1hmTUN2RzlpMWx4ZTVEMUVtVVAxeUhKU3FYbFB5VVBDaXNWVE82?=
 =?utf-8?B?blNFSG81WTg2aWxkN3N5Y0IySjVIa2FVTlVsa09ZdUwyZ0Q4dmtyNVVqOCt1?=
 =?utf-8?B?ejJyQ2tIZkk5Tk41ZHMxcG44aTRFckgyM2F5S0dLMWUrcDBVclB0ZWJKbk55?=
 =?utf-8?B?VEk4dy9xc0UvSlBoK1NNM043NlA0cmJIemprbmJ5UjVnVmMyY204SzNtMjN5?=
 =?utf-8?B?RkNHT25GTE13dHh0YUhiWlJMY3A2a2crT1BEYnJTRmRkUHlPbUJiY2JNVjFn?=
 =?utf-8?B?dTM3SnpXQ0JaZXdXV2tYWE5CU1ZvbmdnOGtLdHdJbkZNS21YOFNxbXhaQ3JC?=
 =?utf-8?B?U3ZLenhlUVBLVU85T0VPclBNVktwQW1haG5Mb0RSSTJiNUFwd1J0UHJZS3hF?=
 =?utf-8?B?dnMwb0NsRFV5bXJBOUhuYTVzVDlpRnFBMXJMN2FVeE1uWFphbVNETkprK0F2?=
 =?utf-8?B?OEkzaGkrU2dpT25ZR05ZeHFDeVdnVUtmYXMvZDlLa2t0UmJzSDdMK0djS3ll?=
 =?utf-8?B?eVNjTXJkaTR0WVBHWFlDand3V09NYnN2NDhPVlp1STNnODNKS0FnaXVPU05y?=
 =?utf-8?B?ZUJSRjFOdlBKZGFuOUkvS0x5OVJDQ0tqVEZYNm1KVzRsclAzY2pldDl4dW1O?=
 =?utf-8?B?VzZpN0owemdua21qb0JZYThDOG1BNlBSMzVEd0lpSWN4SytLdVozZ2NXTnIr?=
 =?utf-8?B?WlBlOC94ZklDdjJzVlA4eTdTYjBJUEJUVytnVytOcmVjcjFLYkRVaDNYa2hS?=
 =?utf-8?B?aWpQendRQlNTMVk0NVRId1FLWW05L2ZYOU1MZTlUZ05yaCtGM25TQWJ4MVJU?=
 =?utf-8?Q?I7I9//UrBbpQFQK72OjnK4lU5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42467c8e-3a05-46c4-0931-08db2957e0da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 15:29:21.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yby4e+KDTGQE0whbQjVFr+oKgv2FzIcljz9V4lxaRZFLIQqw1eaAMuF3S2bsQ7TfiRCPHX9yjmN0DQ+k3W4Jsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8879

On 20.03.2023 16:16, Roger Pau Monné wrote:
> @@ -244,12 +242,18 @@ static void vioapic_write_redirent(
>      }
>      else
>      {
> +        int ret;
> +
>          unmasked = ent.fields.mask;
>          /* Remote IRR and Delivery Status are read-only. */
>          ent.bits = ((ent.bits >> 32) << 32) | val;
>          ent.fields.delivery_status = 0;
>          ent.fields.remote_irr = pent->fields.remote_irr;
>          unmasked = unmasked && !ent.fields.mask;
> +        ret = mp_register_gsi(gsi, ent.fields.trig_mode, ent.fields.polarity);
> +        if ( ret && ret !=  -EEXIST )
> +            gprintk(XENLOG_WARNING, "vioapic: error registering GSI %u: %d\n",
> +                    gsi, ret);
>      }

I assume this is only meant to be experimental, as I'm missing confinement
to Dom0 here. I also question this when the mask bit as set, as in that
case neither the trigger mode bit nor the polarity one can be relied upon.
At which point it would look to me as if it was necessary for Dom0 to use
a hypercall instead (which naturally would then be PHYSDEVOP_setup_gsi).

Jan

