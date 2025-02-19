Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC33A3B449
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 09:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892466.1301437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfbD-0007bq-LD; Wed, 19 Feb 2025 08:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892466.1301437; Wed, 19 Feb 2025 08:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfbD-0007ZQ-Ig; Wed, 19 Feb 2025 08:38:31 +0000
Received: by outflank-mailman (input) for mailman id 892466;
 Wed, 19 Feb 2025 08:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ0s=VK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tkfbC-0007ZK-Jg
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 08:38:30 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b084e4-ee9c-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 09:38:27 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5452efeb87aso5063563e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 00:38:27 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531333200sm1418344e87.259.2025.02.19.00.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 00:38:26 -0800 (PST)
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
X-Inumbo-ID: e3b084e4-ee9c-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739954307; x=1740559107; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unuvCriN5RlwNxJV2//ulu/6r4DgFkOTyWOIkoxNnZc=;
        b=EMelHKIb7qV44b82SxpyimO0A67fOZTnW+FsRCyYGcbVvYTW9g0RzTud7KFHREcXpc
         K8wOU+SAWE78sxUZjNvoVtvNowaMThpd13d6Wz6/Licnm7d5v/KtUH1JhwQWwFbBF7+Q
         OhDc8E27YpDe0JT9FkvLebiLUFBBXtG1iH7vp5C8AQmV9llWKAXsg3ZReVjOgs3RhLFq
         Q8ueXtis8YWnomDMz6ddT4XIwjN8jevvQ9byLvnMro6YhI6PzKdckzJahVf8P6qeZJoO
         O0MdVZ+ZDl/5icCUY9UBMxYqxYQYUwcB9hX0qSdg/q4xSjLjOYX6G1D569bBo7lhGtaQ
         OICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739954307; x=1740559107;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=unuvCriN5RlwNxJV2//ulu/6r4DgFkOTyWOIkoxNnZc=;
        b=D4YDPYPJssCjj651bxx9l3/e3v/bqJeONM6huwXe0csZhKvcZazdyM/Hp+8SX9dfai
         00Srgb0GyewT721CMqvhhFFI/5djxZ63oR3OljJy/3idiAii+DmngKs5WPXBJ0yb7Fjq
         aFrBy4ixd/W6A7lLSaoofrvo1ghFXpFRUu+g/pmAQJp+RVVEh/UC2TxoEUEEP8BiJzZ4
         EICl0r6RKpnfyDRjoSGscM9u0IW9E7QzKlQCbi6nqcM6EovXJ+T6lxKhlll8/WsR+X7w
         OtcOg483h+8dNh8Wm0N+k9/Z661/24WaJeBNMuqz/F1qXDHuiIIExhUIFRt9NFChdOrj
         AIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqDrpYpAdikAxRz7gS7BkTgNiJZHUVXzUsFzWaWdbRDZ1T+ik/f0fHZ7ow79nRBf7/eqe/BuqicUQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy444wx22+nl8A3hyB96tk2ryR41OS5KAFcr+DQYLQjhX4dORjr
	LJpxATDdzOk2JHJDq/jPhJR0U+MVtJJt2B4t8gcoWYMNtxddVfE8
X-Gm-Gg: ASbGncv+L3Dq9EhEU85wD87JPrR6OyUkfKolDmL5yD2dh/Pd42W8xMbk3A7O9o2bH+N
	Pfo2lMoOc8M7SoGu/PSU28cFHwhBiZc5TgGYptgEnM+OnLy0IbfohtNcKgGzMxtvjBE7wUcsQGo
	USITLDlKK6E4d8+yjHroiYs06crN7869jPaqCrgGXYJghqjl0VRt0ts3u55PFKcQT0XEDfMTYD3
	7sYCMYmDY2vx21MlFPoKbry1TtRVJM6Gn/RtvxaXry5TDz2XsDe9dA4B6RUqhGl4uT4tSCkULNU
	BGcL2yUTs8Zfq1N4T2DemUCs
X-Google-Smtp-Source: AGHT+IFgr0Je8SnXC0f3VuOVdqjWKtHW62CoaYzSy9SJ0VW13/zj+simUV6C6Ys/sr/f2d7AfxKtRQ==
X-Received: by 2002:a05:6512:110a:b0:545:27af:f2d1 with SMTP id 2adb3069b0e04-5462ef23975mr1179228e87.44.1739954306576;
        Wed, 19 Feb 2025 00:38:26 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------K7dtozMUn7RB80nP5ka4NHFE"
Message-ID: <9a56dca4-5d19-4e95-820e-b8b361d4c1c3@gmail.com>
Date: Wed, 19 Feb 2025 09:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/dom0less: support for vcpu affinity
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 dpsmith@apertussolutions.com, xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------K7dtozMUn7RB80nP5ka4NHFE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/18/25 9:29 PM, Stefano Stabellini wrote:
> Add vcpu affinity to the dom0less bindings. Example:
>
>      dom1 {
>              ...
>              cpus = <4>;
>              vcpu0 {
>                     compatible = "xen,vcpu-affinity";
>                     id = <0>;
>                     hard-affinity = "4-7";
>              };
>              vcpu1 {
>                     compatible = "xen,vcpu-affinity";
>                     id = <1>;
>                     hard-affinity = "0-3";
>              };
>              vcpu2 {
>                     compatible = "xen,vcpu-affinity";
>                     id = <2>;
>                     hard-affinity = "1,6";
>              };
>              ...
>
> Note that the property hard-affinity is optional. It is possible to add
> other properties in the future not only to specify soft affinity, but
> also to provide more precise methods for configuring affinity. For
> instance, on ARM the MPIDR could be use to specify the pCPU. For now, it
> is left to the future.

I think we want this to add to CHANGELOG.

Thanks.

~ Oleksii


>
> Signed-off-by: Xenia Ragiadakou<xenia.ragiadakou@amd.com>
> Signed-off-by: Stefano Stabellini<stefano.stabellini@amd.com>
> ---
> Changes in v3:
> - improve commit message
> - improve binding doc
> - add panic on invalid pCPU
> - move parsing to a separate function
>
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 9c881baccc..10e55c825c 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -324,6 +324,27 @@ The ramdisk sub-node has the following properties:
>       property because it will be created by the UEFI stub on boot.
>       This option is needed only when UEFI boot is used.
>   
> +Under the "xen,domain" compatible node, it is possible optionally to add
> +one or more sub-nodes to configure vCPU affinity. The vCPU affinity
> +sub-node has the following properties:
> +
> +- compatible
> +
> +    "xen,vcpu-affinity"
> +
> +- id
> +
> +    A 32-bit integer that specifies the vCPU id. 0 is the first vCPU.
> +    The last vCPU is cpus-1, where "cpus" is the number of vCPUs
> +    specified with the "cpus" property under the "xen,domain" node.
> +
> +- hard-affinity
> +
> +    Optional. A string specifying the hard affinity configuration for the
> +    vCPU: a comma-separated list of pCPUs or ranges of pCPUs is used.
> +    Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive
> +    on both sides. The numbers refer to pCPU ids.
> +
>   
>   Example
>   =======
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 49d1f14d65..e364820189 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -810,6 +810,68 @@ static int __init construct_domU(struct domain *d,
>       return rc;
>   }
>   
> +static void __init domain_vcpu_affinity(struct domain *d,
> +                                        const struct dt_device_node *node)
> +{
> +    const char *hard_affinity_str = NULL;
> +    struct dt_device_node *np;
> +    uint32_t val;
> +    int rc;
> +
> +    dt_for_each_child_node(node, np)
> +    {
> +        const char *s;
> +        struct vcpu *v;
> +        cpumask_t affinity;
> +
> +        if ( !dt_device_is_compatible(np, "xen,vcpu-affinity") )
> +            continue;
> +
> +        if ( !dt_property_read_u32(np, "id", &val) )
> +            continue;
> +
> +        if ( val >= d->max_vcpus )
> +            panic("Invalid vcpu_id %u for domain %s\n", val, dt_node_name(node));
> +
> +        v = d->vcpu[val];
> +        rc = dt_property_read_string(np, "hard-affinity", &hard_affinity_str);
> +        if ( rc < 0 )
> +            continue;
> +
> +        s = hard_affinity_str;
> +        cpumask_clear(&affinity);
> +        while ( *s != '\0' )
> +        {
> +            unsigned int start, end;
> +
> +            start = simple_strtoul(s, &s, 0);
> +
> +            if ( *s == '-' )    /* Range */
> +            {
> +                s++;
> +                end = simple_strtoul(s, &s, 0);
> +            }
> +            else                /* Single value */
> +                end = start;
> +
> +            if ( end >= nr_cpu_ids )
> +                panic("Invalid pCPU %u for domain %s\n", end, dt_node_name(node));
> +
> +            for ( ; start <= end; start++ )
> +                cpumask_set_cpu(start, &affinity);
> +
> +            if ( *s == ',' )
> +                s++;
> +            else if ( *s != '\0' )
> +                break;
> +        }
> +
> +        rc = vcpu_set_hard_affinity(v, &affinity);
> +        if ( rc )
> +            panic("vcpu%d: failed to set hard affinity\n", v->vcpu_id);
> +    }
> +}
> +
>   void __init create_domUs(void)
>   {
>       struct dt_device_node *node;
> @@ -992,6 +1054,8 @@ void __init create_domUs(void)
>           if ( rc )
>               panic("Could not set up domain %s (rc = %d)\n",
>                     dt_node_name(node), rc);
> +
> +        domain_vcpu_affinity(d, node);
>       }
>   }
>   
>
--------------K7dtozMUn7RB80nP5ka4NHFE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/18/25 9:29 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">Add vcpu affinity to the dom0less bindings. Example:

    dom1 {
            ...
            cpus = &lt;4&gt;;
            vcpu0 {
                   compatible = "xen,vcpu-affinity";
                   id = &lt;0&gt;;
                   hard-affinity = "4-7";
            };
            vcpu1 {
                   compatible = "xen,vcpu-affinity";
                   id = &lt;1&gt;;
                   hard-affinity = "0-3";
            };
            vcpu2 {
                   compatible = "xen,vcpu-affinity";
                   id = &lt;2&gt;;
                   hard-affinity = "1,6";
            };
            ...

Note that the property hard-affinity is optional. It is possible to add
other properties in the future not only to specify soft affinity, but
also to provide more precise methods for configuring affinity. For
instance, on ARM the MPIDR could be use to specify the pCPU. For now, it
is left to the future.</pre>
    </blockquote>
    <pre>I think we want this to add to CHANGELOG.

Thanks.

~ Oleksii
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502181227580.1085376@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Xenia Ragiadakou <a class="moz-txt-link-rfc2396E" href="mailto:xenia.ragiadakou@amd.com">&lt;xenia.ragiadakou@amd.com&gt;</a>
Signed-off-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:stefano.stabellini@amd.com">&lt;stefano.stabellini@amd.com&gt;</a>
---
Changes in v3:
- improve commit message
- improve binding doc
- add panic on invalid pCPU
- move parsing to a separate function

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 9c881baccc..10e55c825c 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -324,6 +324,27 @@ The ramdisk sub-node has the following properties:
     property because it will be created by the UEFI stub on boot.
     This option is needed only when UEFI boot is used.
 
+Under the "xen,domain" compatible node, it is possible optionally to add
+one or more sub-nodes to configure vCPU affinity. The vCPU affinity
+sub-node has the following properties:
+
+- compatible
+
+    "xen,vcpu-affinity"
+
+- id
+
+    A 32-bit integer that specifies the vCPU id. 0 is the first vCPU.
+    The last vCPU is cpus-1, where "cpus" is the number of vCPUs
+    specified with the "cpus" property under the "xen,domain" node.
+
+- hard-affinity
+
+    Optional. A string specifying the hard affinity configuration for the
+    vCPU: a comma-separated list of pCPUs or ranges of pCPUs is used.
+    Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive
+    on both sides. The numbers refer to pCPU ids.
+
 
 Example
 =======
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d65..e364820189 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -810,6 +810,68 @@ static int __init construct_domU(struct domain *d,
     return rc;
 }
 
+static void __init domain_vcpu_affinity(struct domain *d,
+                                        const struct dt_device_node *node)
+{
+    const char *hard_affinity_str = NULL;
+    struct dt_device_node *np;
+    uint32_t val;
+    int rc;
+
+    dt_for_each_child_node(node, np)
+    {
+        const char *s;
+        struct vcpu *v;
+        cpumask_t affinity;
+
+        if ( !dt_device_is_compatible(np, "xen,vcpu-affinity") )
+            continue;
+
+        if ( !dt_property_read_u32(np, "id", &amp;val) )
+            continue;
+
+        if ( val &gt;= d-&gt;max_vcpus )
+            panic("Invalid vcpu_id %u for domain %s\n", val, dt_node_name(node));
+
+        v = d-&gt;vcpu[val];
+        rc = dt_property_read_string(np, "hard-affinity", &amp;hard_affinity_str);
+        if ( rc &lt; 0 )
+            continue;
+
+        s = hard_affinity_str;
+        cpumask_clear(&amp;affinity);
+        while ( *s != '\0' )
+        {
+            unsigned int start, end;
+
+            start = simple_strtoul(s, &amp;s, 0);
+
+            if ( *s == '-' )    /* Range */
+            {
+                s++;
+                end = simple_strtoul(s, &amp;s, 0);
+            }
+            else                /* Single value */
+                end = start;
+
+            if ( end &gt;= nr_cpu_ids )
+                panic("Invalid pCPU %u for domain %s\n", end, dt_node_name(node));
+
+            for ( ; start &lt;= end; start++ )
+                cpumask_set_cpu(start, &amp;affinity);
+
+            if ( *s == ',' )
+                s++;
+            else if ( *s != '\0' )
+                break;
+        }
+
+        rc = vcpu_set_hard_affinity(v, &amp;affinity);
+        if ( rc )
+            panic("vcpu%d: failed to set hard affinity\n", v-&gt;vcpu_id);
+    }
+}
+
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
@@ -992,6 +1054,8 @@ void __init create_domUs(void)
         if ( rc )
             panic("Could not set up domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
+
+        domain_vcpu_affinity(d, node);
     }
 }
 

</pre>
    </blockquote>
  </body>
</html>

--------------K7dtozMUn7RB80nP5ka4NHFE--

